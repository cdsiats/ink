<link rel="import" type="template" href="@/components/html/head" name="html-head" />
<link rel="import" type="template" href="@/components/html/header" name="html-header" />
<link rel="import" type="template" href="@/components/html/aside" name="html-aside" />
<link rel="import" type="component" href="@stackpress/ink-ui/layout/panel" name="panel-layout" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/tab" name="element-tab" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/icon" name="element-icon" />
<link rel="import" type="component" href="@/components/api/docs" name="api-docs" />
<link rel="import" type="component" href="@/components/ide/app/head" name="app-head" />
<link rel="import" type="component" href="@/components/ide/app/left" name="app-left" />
<link rel="import" type="component" href="@/components/ide/app/main" name="app-main" />
<link rel="import" type="component" href="@/components/ide/app" name="ide-app" />
<link rel="import" type="component" href="@/components/ide/code" name="ide-code" />
<link rel="import" type="component" href="@/components/i18n/translate" name="i18n-translate" />
<style>
  @ink theme;
  @ink reset;
  @ink fouc-opacity;
  @ink utilities;
</style>
<script>
  import { env } from '@stackpress/ink';
  import { _ } from '@/components/i18n';

  const url = '/docs/single-page.html';
  const title = _('Single Page App - Ink reactive web component template engine.');
  const description = _('How to use Ink to develop single page apps.');
  const toggle = () => {
    document.getElementsByTagName('panel-layout')[0].toggle('left');
  };
</script>
<html>
  <html-head />
  <body class="light bg-t-0 tx-t-1 tx-arial">
    <panel-layout>
      <header><html-header /></header>
      <aside left><html-aside /></aside>
      <main>
        <api-docs>
          <h1 class="tx-primary tx-upper tx-30 py-20">
            {_('Single Page App')}
          </h1>

          <i18n-translate p trim class="tx-lh-36 py-20">
            A single page application (SPA) is a website or web 
            application that dynamically rewrites a current web page with 
            new data from a web server, instead of the default method of 
            a web browser loading entire new pages. Ink is capable of 
            creating reactive SPAs using Webpack and TypeScript.
          </i18n-translate>

          <i18n-translate p trim class="tx-lh-36 py-20">
            First install the following Ink packages.
          </i18n-translate>
          <ide-code lang="bash">
            npm install --save-dev @stackpress/ink @stackpress/ink-loader
          </ide-code>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Then, install the following TypeScript packages.
          </i18n-translate>
          <ide-code lang="bash">
            npm install --save-dev @types/node ts-loader ts-node typescript
          </ide-code>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Then, install the following Webpack packages.
          </i18n-translate>
          <ide-code lang="bash">
            npm install --save-dev html-webpack-plugin webpack-dev-server webpack webpack-cli
          </ide-code>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Next create the following files and directories.
          </i18n-translate>

          <ide-app height={400} title="My Project">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="project" 
                  selector="#client-ts"
                >
                  src/client.ts
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="project" 
                  selector="#app-ink"
                >
                  src/app.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"    
                  group="project" 
                  selector="#index-html"
                >
                  index.html
                </element-tab>
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="project" 
                  selector="#webpack-js"
                >
                  webpack.config.js
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="project" 
                  selector="#tsconfig-json"
                >
                  tsconfig.json
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="project" 
                  selector="#package-json"
                >
                  package.json
                </element-tab>
              </div>
            </app-head>
            <app-left>
              <h5 class="folder">
                <element-icon name="chevron-down" />
                <span>src</span>
              </h5>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="project" 
                selector="#app-ink"
              >
                <element-icon name="file" />
                app.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="project" 
                selector="#client-ts"
              >
                <element-icon name="file" />
                client.ts
              </element-tab>
              <element-tab 
                class="pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="project" 
                selector="#index-html"
              >
                <element-icon name="file" />
                index.html
              </element-tab>
              <element-tab 
                class="pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="project" 
                selector="#package-json"
              >
                <element-icon name="file" />
                package.json
              </element-tab>
              <element-tab 
                class="pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="project" 
                selector="#tsconfig-json"
              >
                <element-icon name="file" />
                tsconfig.json
              </element-tab>
              <element-tab 
                on
                class="pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="project" 
                selector="#webpack-js"
              >
                <element-icon name="file" />
                webpack.config.js
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="client-ts" style="display:none" lang="js" numbers trim detab={16}>{`
                import InkComponent from './app.ink';

                InkComponent.register();
              `}</ide-code>
              <ide-code id="app-ink" style="display:none" numbers trim detab={16}>{`
                <script>
                  const title = 'Single Page App';
                </script>
                <h1>{title}</h1>
              `}</ide-code>
              <ide-code id="index-html" style="display:none" numbers trim detab={16}>{`
                <!DOCTYPE html>
                <html>
                  <head>
                    <style>
                      body {
                        font-family: Arial, Helvetica, sans-serif;
                        margin: 0;
                        padding: 0;
                        width: 100vw;
                        height: 100vh;
                      }
                    </style>
                  </head>
                  <body>
                    <ink-app></ink-app>
                  </body>
                </html>
              `}</ide-code>
              <ide-code id="webpack-js" lang="js" numbers trim detab={16}>{`
                const path = require('path');
                const HtmlWebpackPlugin = require('html-webpack-plugin');

                module.exports = {
                  // https://webpack.js.org/concepts/entry-points/#multi-page-application
                  entry: {
                    index: './src/client.ts'
                  },
                  output: {
                    path: path.resolve(__dirname, './dist'),
                    filename: '[name].bundle.js',
                  },
                  module: {
                    rules: [
                      {
                        test: /\.ink$/,
                        use: {
                          loader: '@stackpress/ink-loader',
                          options: { minify: false }
                        },
                        exclude: /node_modules/,
                      },
                      {
                        test: /\.ts$/,
                        use: 'ts-loader',
                        exclude: /node_modules/,
                      },
                    ],
                  },
                  resolve: {
                    extensions: ['.js', '.ts', '.ink'],
                  },
                  // https://webpack.js.org/configuration/dev-server/
                  devServer: {
                    port: 8080
                  },
                  plugins: [
                    new HtmlWebpackPlugin({
                      title: 'Ink',
                      template: "index.html",
                    })
                  ]
                };
              `}</ide-code>
              <ide-code id="tsconfig-json" style="display:none" lang="js" numbers trim detab={16}>{`
                {
                  "compilerOptions": {
                    "declaration": true,
                    "esModuleInterop": true,
                    "lib": [ "es2021", "es7", "es6", "dom" ],
                    "module": "commonjs",
                    "noUnusedLocals": true,
                    "outDir": "./dist/",
                    "preserveConstEnums": true,
                    "resolveJsonModule": true,
                    "removeComments": true,
                    "sourceMap": false,
                    "strict": true,
                    "target": "es6",
                    "skipLibCheck": true
                  },
                  "include": [ 
                    "src/**/*.ts", 
                    "@stackpress/ink/types"
                  ],
                  "exclude": [ "dist", "node_modules" ]
                }
              `}</ide-code>
              <ide-code id="package-json" style="display:none" lang="js" numbers trim detab={16}>{`
                {
                  "name": "my-spa",
                  "version": "1.0.0",
                  "private": true,
                  "scripts": {
                    "dev": "webpack-dev-server --mode development",
                    "build": "webpack --mode production"
                  },
                  "devDependencies": {
                    "@stackpress/ink": "0.4.6"
                    "@stackpress/ink-loader": "0.4.6",
                    "@types/node": "22.1.0",
                    "html-webpack-plugin": "5.6.0",
                    "webpack-dev-server": "5.0.4",
                    "ts-loader": "9.5.1",
                    "ts-node": "10.9.2",
                    "typescript": "5.4.5",
                    "webpack": "5.91.0",
                    "webpack-cli": "5.1.4"
                  }
                }
              `}</ide-code>
            </app-main>
          </ide-app>
          <i18n-translate p trim class="tx-lh-36 py-20">
            To test the SPA and see the results, run the following command in terminal.
          </i18n-translate>
          <ide-app title="Terminal">
            <ide-code lang="bash">
              npm run dev
            </ide-code>
          </ide-app>
          
          <nav class="flex">
            <a class="tx-primary py-40" href="/ink/docs/template-engine.html">
              <element-icon name="chevron-left" theme="tx-1" />
              {_('Template Engine')}
            </a>
            <a class="flex-grow tx-right tx-primary py-40" href="/ink/docs/static-site.html">
              {_('Static Site Generator')}
              <element-icon name="chevron-right" theme="tx-1" />
            </a>
          </nav>
          <footer class="foot"></footer>
        </api-docs>
      </main>
    </panel-layout>
  </body>
</html>