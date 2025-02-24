//modules
import type { PluginBuild } from 'esbuild';
import path from 'node:path';
import ts from 'typescript';
import { Project, IndentationText } from 'ts-morph';
//stackpress
import { 
  Component, 
  ComponentTranspiler,
  build,
  toTS
} from '@stackpress/ink/compiler';
//local
import type { UpdateOptions, Dependants } from './types';

export function createSourceFile(filePath: string) {
  const project = new Project({
    skipAddingFilesFromTsConfig: true,
    compilerOptions: {
      // Generates corresponding '.d.ts' file.
      declaration: true, 
      // Generates a sourcemap for each corresponding '.d.ts' file.
      declarationMap: true, 
      // Generates corresponding '.map' file.
      sourceMap: true, 
      // Set the module system
      module: ts.ModuleKind.CommonJS
    },
    manipulationSettings: {
      indentationText: IndentationText.TwoSpaces
    }
  });
  const source = project.createSourceFile(filePath);
  return { project, source };
};

export function dependantsOf(
  filePath: string, 
  component: Component, 
  dependants: Dependants = {}
) {
  //retokenize with no cache
  component.tokenize(false);
  const imported = component.dependencies.find(dependency => {
    const extname = path.extname(dependency.path);
    const end = dependency.path.length - extname.length;
    const basename = dependency.path.substring(0, end);
    return dependency.path === filePath || basename === filePath;
  });
  if (imported) {
    dependants[component.absolute] = { component, type: imported.type };
  }
  component.components.forEach(component => {
    dependantsOf(filePath, component, dependants);
  });
  return Object.values(dependants);
}

export function esRefreshPlugin(component: Component, options: UpdateOptions) {
  const tsconfig = options.tsconfig;
  const extname = options.extname || '.ink';
  const extnames = [ '.js', '.json', '.ts', extname ];
  return {
    name: 'ink-refresh-plugin',
    setup: (build: PluginBuild) => {
      //should resolve everything...
      build.onResolve({ filter: /.*/ }, args => {
        if (args.path === '__REFRESH__') {
          return { 
            path: args.path, 
            namespace: 'ink-refresh-resolver' 
          };
        }

        const pwd = args.importer === '__REFRESH__'
          ? component.dirname
          : path.dirname(args.importer);
        
        const resolved = component.loader.resolve(
          args.path, 
          pwd, 
          extnames
        );

        if (resolved) {
          //if component
          if (resolved.endsWith(extname)) {
            return { 
              path: resolved, 
              namespace: 'ink-refresh-component-resolver' 
            };
          }
          return { path: resolved };
        }
        
        return undefined;
      });

      build.onLoad({ 
        filter: /^__REFRESH__$/, 
        namespace: 'ink-refresh-resolver' 
      }, args => {
        const source = transpile(component);
        return {
          contents: toTS(source),
          resolveDir: component.dirname,
          loader: 'ts'
        };
      });

      build.onLoad({ 
        filter: new RegExp(`\\.${extname.substring(1)}$`), 
        namespace: 'ink-refresh-component-resolver' 
      }, args => {
        const subcomponent = new Component(args.path, { 
          cwd: component.cwd,
          fs: component.fs,
          //name?: string,
          brand: component.brand,
          type: 'component' 
        });
        const transpiler = new ComponentTranspiler(
          subcomponent, 
          tsconfig
        );
        return {
          contents: toTS(transpiler.transpile()),
          resolveDir: path.dirname(args.path),
          loader: 'ts'
        };
      });
    }
  };
};

export function transpile(component: Component) {
  const { 
    id,
    absolute,
    imports,
    styles, 
    scripts
  } = component;
  const transpiler = new ComponentTranspiler(component);
  //get path without extension
  //ex. /path/to/Counter.ink -> /path/to/Counter
  const extname = path.extname(absolute);
  const filePath = absolute.slice(0, -extname.length);
  //create a new source file
  const { source } = createSourceFile(`${filePath}.ts`);
  //import Counter from './Counter'
  component.components.filter(
    component => component.type === 'component'
  ).forEach(component => {
    //now import
    source.addImportDeclaration({
      moduleSpecifier: component.source,
      //we make sure there's no collisions
      //this is also matched when generating the component tree
      defaultImport: component.classname
    });
  });
  //import others from <script>
  imports.forEach(imported => {
    if (imported.default && imported.names) {
      source.addImportDeclaration({
        isTypeOnly: imported.typeOnly,
        moduleSpecifier: imported.source,
        defaultImport: imported.default,
        namedImports: imported.names
      });
    } else if (imported.default) {
      source.addImportDeclaration({
        isTypeOnly: imported.typeOnly,
        moduleSpecifier: imported.source,
        defaultImport: imported.default
      });
    } else if (imported.names) {
      source.addImportDeclaration({
        isTypeOnly: imported.typeOnly,
        moduleSpecifier: imported.source,
        namedImports: imported.names
      });
    }
  });

  //function refresh()
  source.addFunction({
    name: '__REFRESH__',
    statements: (`
      const { ClientRegistry, components, data } = InkAPI;
      const styles = function styles() {
        return \`${styles.join('\n').trim()}\`;
      };
      const template = function template() {
        ${scripts.length > 0 ? scripts.join('\n') : (`
          const props = this.props; 
          const children = () => this.originalChildren;
        `)}
        return () => ${transpiler.markup.trim()};
      };
      Object.values(components).filter(
        Component => Component.id === '${id}'
      ).forEach(Component => {
        //get elements and components from registry
        const components = Array
          .from(ClientRegistry.elements.keys())
          //if the component is an instance of Counter
          .filter(element => element instanceof Component)
          //if the component part of the dom
          .filter(element => !!element.parentNode);
        //for each component
        for (const component of components) {
          const prev = data.get('current');
          //replace styles() and template()
          component.styles = styles;  
          component.template = template;
          //reset initiated
          component._initiated = false;
          //set the current component
          data.set('current', component);
          //cache the template
          component._template = template.call(component);
          data.delete('current');
          try { //to re-render
            component.render();
          } catch(e) {
            //reset rendering before throwing error
            component._rendering = false;
            throw e;
          }
        };
        //last, set static class
        Component.prototype.styles = styles;
        Component.prototype.template = template;
      });
    `)
  });

  //main script
  source.addStatements(`__REFRESH__();`);

  return source;
};

export async function update(
  component: Component, 
  options: UpdateOptions
) {
  return await build('__REFRESH__', {
    minify: false,
    plugins: [ 
      esRefreshPlugin(component, options)
    ]
  });
}

export function errorMessage(error: Error) {
  return `;console.error(\`${error.message}\`);`;
}