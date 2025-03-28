//modules
import path from 'node:path';
//stackpress
import type { FileSystem } from '@stackpress/lib/dist/types';
import NodeFS from '@stackpress/lib/dist/system/NodeFS';
import FileLoader from '@stackpress/lib/dist/system/FileLoader';
//common
import type { AST, ComponentType, ComponentOptions } from '../types';
import Exception from '../Exception';
import { camelize, serialize, slugify } from '../helpers';
//local
import Tokenizer from './Tokenizer';

/**
 * The Ink Compiler
 * 
 * Provides various methods to compile Ink source code to be used
 * as a template engine or a static site generator.
 */
export default class Component {
  //cached AST
  protected _ast: AST|null = null;
  //brand name used to prefix component names
  protected _brand: string;
  //cache of component instances
  protected _components: Component[]|undefined;
  //current working directory
  protected _cwd: string;
  //the default extname for components without an extension
  protected _extname: string;
  //filesystem to use
  protected _fs: FileSystem;
  //the name of the component
  protected _name: string;
  //file loader helper
  protected _loader: FileLoader;
  //parent compoent
  protected _parent: Component|null;
  //the source file
  protected _source: string;
  //the component type
  protected _type: ComponentType;

  /**
   * Returns the absolute path to the file
   */
  public get absolute() {
    const pwd: string = this._parent ? this._parent.dirname : this._cwd;
    return this._loader.absolute(this._source, pwd, true);
  }
  
  /**
   * Returns abstract syntax tree
   */
  public get ast() {
    return this.tokenize();
  }

  /**
   * Gets the brand prefix
   */
  public get brand() {
    return this._brand;
  }

  /**
   * Returns the class name (ie. PascalCase)
   */
  public get classname() {
    if (/^[0-9]/.test(this._name)) {
      return `N${this._name}_${this.id}`;
    }
    return `${camelize(this._name)}_${this.id}`;
  }

  /**
   * Returns the imported components
   */
  public get components() {
    //if external component
    if (this._type === 'external') {
      //no components here...
      return [];
    }
    if (!this._components) {
      this._components = this.ast.components.map(component => {
        //get property attributes
        const properties = component.attributes.properties;
        //find type property 
        // ie. <link type="component" />
        // ie. <link type="template" />
        const typeProperty = properties.find(
          property => property.key.name === 'type'
        );
        //determine the type of component
        const type = typeProperty?.value.type === 'Literal'
          ? (typeProperty?.value.value === 'document' ? 'document' 
            : typeProperty?.value.value === 'component' ? 'component' 
            : typeProperty?.value.value === 'template' ? 'template' 
            : typeProperty?.value.value === 'external' ? 'external' 
            : 'component'
          ) 
          : 'component';

        //find name property
        // ie. <link name="foo-bar" />
        const nameProperty = properties.find(
          property => property.key.name === 'name'
        );
        //determine the type of component
        const name = (
          //if property is found
          nameProperty 
          //and the value type is a literal
          && nameProperty.value.type === 'Literal'
          //and type of value is string
          && typeof nameProperty.value.value === 'string'
        ) ? nameProperty.value.value : undefined;
          
        return new Component(component.source.value, {
          brand: this._brand,
          cwd: this._cwd,
          extname: this._extname,
          fs: this._fs,
          name: name,
          type: type
        }, this);
      });
    }
    return this._components;
  }

  /**
   * Returns the source file contents
   */
  public get contents() {
    return this._fs.readFileSync(this.absolute, 'utf-8');
  }

  /**
   * Returns the current working directory
   */
  public get cwd() {
    return this._cwd;
  }

  /**
   * Returns a raw list of dependencies
   * this component imports
   * Used fast refresh
   */
  public get dependencies() {
    //if external component
    if (this._type === 'external') {
      //no dependencies here...
      return [];
    }
    //this should be imports from the <script>
    //could be js or json
    const imports = this.imports.map(token => ({
      path: this._loader.resolve(
        token.source, 
        this.dirname, 
        [ '.js', '.json', '.ts' ], 
        true
      ) as string,
      type: 'file'
    }));
    const components = this.components.map(component => ({
      path: component.absolute,
      type: component.type
    }));

    return [ ...components, ...imports ];
  }

  /**
   * Returns the dirname of the source file
   */
  public get dirname() {
    return path.dirname(this.absolute);
  }

  /**
   * Returns true if the component should be treated as a field
   */
  public get field() {
    //if external component
    if (this._type === 'external') {
      //no sure...
      return false;
    }
    return this.ast.scripts.some(
      script => script.attributes?.properties.some(
        property => property.key.name === 'form'
      )
    );
  }

  /**
   * Returns the filesystem being used
   */
  public get fs() {
    return this._fs;
  }

  /**
   * Returns the unique hash of the source file.
   * This is like id but cannot be decoded and 
   * is fixed length.
   */
  public get id() {
    //get the relative path
    let relative = this.relative;
    //if this is a node modules
    if (relative.includes('node_modules/')) {
      //remove the left side of the path
      relative = relative.split('node_modules/')[1];
    }
    return serialize(relative);
  }

  /**
   * Returns the ink imports information
   * these imports are extracted from the <script>
   */
  public get imports() {
    //if external component
    if (this._type === 'external') {
      //no imports here...
      return [];
    }
    return this.ast.imports.map(token => ({
      typeOnly: token.typeOnly,
      names: token.names?.map(name => name.value),
      default: token.default?.value,
      source: token.source.value
    }));
  }

  /**
   * Returns the markup tokens
   */
  public get markup() {
    //if external component
    if (this._type === 'external') {
      //no markup...
      return [];
    }
    return this.ast.markup;
  }

  /**
   * Returns the file loader
   */
  public get loader() {
    return this._loader;
  }

  /**
   * Returns attributes that should be observed
   */
  public get observe() {
    //if external component
    if (this._type === 'external') {
      //no observables here...
      return [];
    }
    const observables = new Set<string>();
    for (const script of this.ast.scripts) {
      if (script.attributes) {
        for (const property of script.attributes.properties) {
          const { key, value } = property;
          if (key.name === 'observe' 
            && value.type === 'Literal'
            && typeof value.value === 'string'
          ) {
            value.value.split(',').forEach(
              attribute => observables.add(attribute.trim())
            );
          }
        }
      }
    }
    return Array.from(observables);
  }

  /**
   * Returns the parent component
   */
  public get parent() {
    return this._parent;
  }

  /**
   * Returns all child components and subcomponents
   */
  public get registry() {
    const registry: Record<string, Component> = {};
    for (const component of this.components) {
      registry[component.classname] = component;
      Object.assign(registry, component.registry);
    }
    return registry;
  }

  /**
   * Returns the path relative to cwd
   */
  public get relative() {
    const relative = path.relative(this._cwd, this.absolute);
    if (relative.startsWith('.')) {
      return relative;
    }
    return `./${relative}`;
  }
  
  /**
   * Returns the original source path
   */
  public get source() {
    return this._source;
  }

  /**
   * Returns the compiled scripts
   */
  public get scripts() {
    //if external component
    if (this._type === 'external') {
      //no scripts here...
      return [];
    }
    return this.ast.scripts.map(script => script.source);
  }

  /**
   * Returns the compiled styles
   */
  public get styles() {
    //if external component
    if (this._type === 'external') {
      //no styles here...
      return [];
    }
    return this.ast.styles.map(style => style.source);
  }

  /**
   * Returns the tag name (ie. kebab-case)
   */
  public get tagname() {
    return slugify(this._name);
  }

  /**
   * Returns the component type
   */
  public get type() {
    return this._type;
  }

  /**
   * Sets the source code to compile
   */
  public constructor(
    source: string, 
    options: ComponentOptions = {}, 
    parent: Component|null = null
  ) {
    //brand name used to prefix component names
    this._brand = typeof options.brand === 'string' 
      ? options.brand 
      : 'ink';
    //current working directory
    this._cwd = options.cwd || process.cwd();
    this._extname = options.extname || '.ink';
    //filesystem to use
    this._fs = options.fs || new NodeFS();
    //file loader helper
    this._loader = new FileLoader(this._fs, this._cwd);
    //the name of the component
    const extname = path.extname(source);
    this._name = options.name || path.basename(
      source, 
      extname
    );
    //ex. /path/to/component.ink
    //ex. ./path/to/component.ink
    //ex. ../path/to/component.ink
    //ex. @/path/to/component.ink
    //ex. path/to/component.ink
    this._source = extname.length > 0 
      ? source
      : `${source}${this._extname}`;
    //the component type
    this._type = options.type || 'component';
    //parent component
    this._parent = parent;
  }

  /**
   * Tokenenizes the source code and returns the AST
   */
  public tokenize(cache = true) {
    //throw if the type is not tokenizable
    if (this._type === 'external') {
      throw Exception.for('No tokenizer for external: %s', this.source);
    }
    //if cache is disabled or ast is not cached
    if (!cache || !this._ast) {
      //parse the source code
      this._ast = Tokenizer.tokenize(
        this._fs.readFileSync(this.absolute, 'utf-8')
      );
      //also reset components cache
      this._components = undefined;
    }

    return this._ast;
  }
}