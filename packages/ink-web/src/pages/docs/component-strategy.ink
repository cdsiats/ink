<link rel="import" type="template" href="@/components/html/head" name="html-head" />
<link rel="import" type="template" href="@/components/html/header" name="html-header" />
<link rel="import" type="template" href="@/components/html/aside" name="html-aside" />
<link rel="import" type="component" href="@stackpress/ink-ui/layout/panel" name="panel-layout" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/alert" name="element-alert" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/icon" name="element-icon" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/tab" name="element-tab" />
<link rel="import" type="component" href="@/components/api/docs" name="api-docs" />
<link rel="import" type="component" href="@/components/api/ui" name="api-ui" />
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

  const url = '/docs/component-strategy.html';
  const title = _('Component Strategy - Ink reactive web component template engine.');
  const description = _('Learn more about web components and how they work with Ink.');
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
      <aside right>
        <menu class="m-0 px-10 py-20 h-calc-full-40 bg-t-2 scroll-auto">
          <h6 class="tx-muted tx-14 mb-0 mt-0 pb-10 tx-upper">
            {_('On this page')}
          </h6>
          <nav class="tx-14 tx-lh-32">
            <a class="block tx-t-0" href="#document">{_('Document')}</a>
            <a class="block tx-t-0" href="#template">{_('Template')}</a>
            <a class="block tx-t-0" href="#component">{_('Component')}</a>
            <nav class="pl-20">
              <a class="block tx-t-1" href="#strat-1">{_('Strategy 1')}</a>
              <a class="block tx-t-1" href="#strat-2">{_('Strategy 2')}</a>
              <a class="block tx-t-1" href="#strat-3">{_('Strategy 3')}</a>
              <a class="block tx-t-1" href="#strat-4">{_('Strategy 4')}</a>
            </nav>
            <a class="block tx-t-0" href="#fouc">{_('FOUC')}</a>
          </nav>
        </menu>
      </aside>
      <main>
        <api-docs>
          <h1 class="tx-primary tx-upper tx-30 py-20">
            {_('Component Strategy')}
          </h1>

          <i18n-translate p trim class="tx-lh-36 py-20">
            There are three types of components in Ink: Document, 
            Template, and Component. Each type of component has a 
            different strategy for rendering and updating the DOM. The 
            Document component is the root component of the application 
            and is responsible for rendering the entire application. The 
            Template component is a reusable component that can be used 
            in multiple places in the application. The Component component 
            is a custom component that can be used to create complex UI 
            elements.
          </i18n-translate>

          <a name="document"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Document')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            A document denoted by files with the 
            <ide-code inline>.ink</ide-code> extension, is the root of
            each page view that should include the document markup 
            starting with <ide-code inline>{`<html>`}</ide-code>. While 
            it looks like another Ink component, there are some key 
            differences in how it is used.
          </i18n-translate>

          <ul>
            <li>
              <i18n-translate p trim class="tx-lh-36 py-20">
                A document logic (<ide-code inline>{`<script>`}</ide-code>)
                is executed on the client side but is not a 
                <ide-code inline>InkComponent</ide-code>, which means 
                it cannot be re-rendered and does not have access to 
                <ide-code inline>this</ide-code> context.
              </i18n-translate>
            </li>
            <li>
              <i18n-translate p trim class="tx-lh-36 py-20">
                A document <ide-code inline>{`props()`}</ide-code> are the 
                server props passed down to the client.
              </i18n-translate>
            </li>
            <li>
              <i18n-translate p trim class="tx-lh-36 py-20">
                A document does not have access to NodeJS functionality. So 
                things like <ide-code inline>fs</ide-code> are not available.
              </i18n-translate>
            </li>
          </ul>

          <element-alert curved info class="py-20 tx-lh-24">
            <element-icon name="info-circle" />
            <strong>Recommendation:</strong> You should do server related
            logic on the server framework and pass the neccesary data 
            to the client.
          </element-alert>

          <ide-app height={250} title="Passing Server Props" class="py-20">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"    
                  group="server" 
                  selector="#server-index-ts"
                >
                  src/index.ts
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="server" 
                  selector="#server-page-ink"
                >
                  src/page.ink
                </element-tab>
              </div>
            </app-head>
            <app-left>
              <h5 class="p-5">
                <element-icon name="chevron-down" />
                <span>src</span>
              </h5>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="server" 
                selector="#server-index-ts"
              >
                <element-icon name="file" />
                index.ts
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="server" 
                selector="#server-page-ink"
              >
                <element-icon name="file" />
                page.ink
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="server-index-ts" lang="js" numbers trim detab={16}>{`
                import http from 'http';
                import ink from '@stackpress/ink/compiler';

                const compiler = ink({ cwd: __dirname });
                const server = http.createServer(async (req, res) => {
                  //pass server props to document
                  res.end(await compiler.render('./index.ink', {
                    title: 'Hello World'
                  }));
                });
              `}</ide-code>
              <ide-code id="server-page-ink" style="display:none" numbers trim detab={16}>{`
                <script>
                  import { props } from '@stackpress/ink';
                  //from the server
                  const { title } = props();
                </script>
                <html>
                  <body>
                    <h1 class="title">{title}</h1>
                  </body>
                </html>
              `}</ide-code>
            </app-main>
          </ide-app>

          <a name="template"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Template')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            A template is resuable partial markup that can be imported by 
            a component, document or another template. A template is 
            not is not a <ide-code inline>InkComponent</ide-code>, but 
            rather adds its markup to the parent component's final markup.
            You will not see a template in the DOM, but rather the
            markup it contains.
          </i18n-translate>

          <i18n-translate p trim class="tx-lh-36 py-20">
            For example, consider a document that contains the following 
            markup.
          </i18n-translate>

          <ide-code trim detab={12}>{`
            <script>
              const title = 'Hello World';
            </script>
            <html>
              <head>
                <meta charset="utf-8" />
                <title>{title}</title>
              </head>
              <body>
                <h1>{title}</h1>
              </body>
            </html>
          `}</ide-code>

          <i18n-translate p trim class="tx-lh-36 py-20">
            You can create a template for the head of your
            document and then import it. This allows you to
            reuse the head markup in multiple documents.
          </i18n-translate>

          <ide-app height={250} title="Using Templates" class="py-20">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="template" 
                  selector="#template-page-ink"
                >
                  src/page.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="template" 
                  selector="#template-head-ink"
                >
                  src/head.ink
                </element-tab>
              </div>
            </app-head>
            <app-left>
              <h5 class="p-5">
                <element-icon name="chevron-down" />
                <span>src</span>
              </h5>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="template" 
                selector="#template-page-ink"
              >
                <element-icon name="file" />
                page.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="template" 
                selector="#template-head-ink"
              >
                <element-icon name="file" />
                head.ink
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="template-page-ink" numbers trim detab={16}>{`
                <link rel="import" type="template" href="./head.ink" name="html-head" />
                <script>
                  const title = 'Hello World';
                </script>
                <html>
                  <html-head />
                  <body>
                    <h1>{title}</h1>
                  </body>
                </html>
              `}</ide-code>
              <ide-code id="template-head-ink" style="display:none" numbers trim detab={16}>{`
                <head>
                  <meta charset="utf-8" />
                  <title>{title}</title>
                </head>
              `}</ide-code>
            </app-main>
          </ide-app>

          <element-alert curved info class="py-20 tx-lh-24">
            <element-icon name="info-circle" />
            <strong>Note:</strong> Template partials do not process 
            attributes or children if given.
          </element-alert>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Variables used in a template should be declared in the
            parent component or document. This allows you to pass
            data to the template from the parent.
          </i18n-translate>

          <a name="component"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Component')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            All ink components are 
            <ide-code inline>InkComponent</ide-code> that extends
            <ide-code inline>HTMLElement</ide-code> and therefore is 
            both a web component and element just like any other element 
            in the browser DOM. Components that do not use the
            <ide-code inline>{`<style>`}</ide-code> tag are affected by 
            the global styles of the application. Components with the
            <ide-code inline>{`<style>`}</ide-code> tag enable the 
            component's shadow DOM and will encapsulate the styles within
            the component and not be affected by global styles. With that 
            said, there are several strategies that can be applied to 
            Ink components.
          </i18n-translate>

          <a name="strat-1"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Strategy 1: No Components')}
          </h3>

          <i18n-translate p trim class="tx-lh-36 py-20">
            This strategy uses only documents and templates. This 
            strategy is useful for simple applications that do not require 
            complex UI elements. This is the best strategy for 
            performant applications.
          </i18n-translate>

          <ide-app height={400} title="No Components" class="py-20">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-1" 
                  selector="#strat-1-page-ink"
                >
                  src/page.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-1" 
                  selector="#strat-1-head-ink"
                >
                  src/head.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-1" 
                  selector="#strat-1-header-ink"
                >
                  src/header.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"  
                  group="strat-1" 
                  selector="#strat-1-footer-ink"
                >
                  src/footer.ink
                </element-tab>
              </div>
            </app-head>
            <app-left>
              <h5 class="folder">
                <element-icon name="chevron-down" />
                <span>src</span>
              </h5>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-1" 
                selector="#strat-1-page-ink"
              >
                <element-icon name="file" />
                page.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted"  
                group="strat-1" 
                selector="#strat-1-head-ink"
              >
                <element-icon name="file" />
                head.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-1" 
                selector="#strat-1-header-ink"
              >
                <element-icon name="file" />
                header.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-1" 
                selector="#strat-1-footer-ink"
              >
                <element-icon name="file" />
                footer.ink
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="strat-1-page-ink" numbers trim detab={16}>{`
                <link rel="import" type="template" href="./head.ink" name="html-head" />
                <link rel="import" type="template" href="./header.ink" name="page-header" />
                <link rel="import" type="template" href="./footer.ink" name="page-footer" />
                <script>
                  import { env } from '@stackpress/ink';
                  const { BUILD_ID, APP_DATA } = env();
                  const title = 'Hello World';
                </script>
                <html>
                  <html-head />
                  <body>
                    <page-header />
                    <main>
                      <h1>{title}</h1>
                    </main>
                    <page-footer />
                  </body>
                </html>
              `}</ide-code>
              <ide-code id="strat-1-head-ink" style="display:none" numbers trim detab={16}>{`
                <head>
                  <meta charset="utf-8" />
                  <title>{title}</title>

                  <link rel="stylesheet" type="text/css" href={\`/build/$\{BUILD_ID}.css\`} />
                  <script data-app={APP_DATA} src={\`/build/\${BUILD_ID}.js\`}></script>
                </head>
              `}</ide-code>
              <ide-code id="strat-1-header-ink" style="display:none" numbers trim detab={16}>{`
                <header>
                  <img src="/logo.png" alt="Logo" />
                  <h6>Brand</h6>
                </header>
              `}</ide-code>
              <ide-code id="strat-1-footer-ink" style="display:none" numbers trim detab={16}>{`
                <footer>
                  <a href="/about">About</a>
                  <copy>&copy; 2025</copy>
                </footer>
              `}</ide-code>
            </app-main>
          </ide-app>

          <a name="strat-2"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Strategy 2: Shallow Components')}
          </h3>

          <i18n-translate p trim class="tx-lh-36 py-20">
            This strategy uses components that do not have a 
            <ide-code inline>{`<style>`}</ide-code> tag and is useful for 
            applications that require complex logic in components but 
            using a shared global stylesheet.
          </i18n-translate>

          <ide-app height={400} title="Shallow Components" class="py-20">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-2" 
                  selector="#strat-2-page-ink"
                >
                  src/page.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-2" 
                  selector="#strat-2-header-ink"
                >
                  src/header.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"  
                  group="strat-2" 
                  selector="#strat-2-footer-ink"
                >
                  src/footer.ink
                </element-tab>
              </div>
            </app-head>
            <app-left>
              <h5 class="folder">
                <element-icon name="chevron-down" />
                <span>src</span>
              </h5>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-2" 
                selector="#strat-2-page-ink"
              >
                <element-icon name="file" />
                page.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-2" 
                selector="#strat-2-header-ink"
              >
                <element-icon name="file" />
                header.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-2" 
                selector="#strat-2-footer-ink"
              >
                <element-icon name="file" />
                footer.ink
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="strat-2-page-ink" numbers trim detab={16}>{`
                <link rel="import" type="component" href="./header.ink" name="page-header" />
                <link rel="import" type="component" href="./footer.ink" name="page-footer" />
                <script>
                  import { env } from '@stackpress/ink';
                  const { BUILD_ID, APP_DATA } = env();
                  const title = 'Hello World';
                  const brand = 'Acme Inc.';
                  const logo = '/logo.png';
                </script>
                <html>
                  <head>
                    <meta charset="utf-8" />
                    <title>{title}</title>
                    <link rel="stylesheet" type="text/css" href="/styles.css" />

                    <link rel="stylesheet" type="text/css" href={\`/build/$\{BUILD_ID}.css\`} />
                    <script data-app={APP_DATA} src={\`/build/\${BUILD_ID}.js\`}></script>
                  </head>
                  <body>
                    <page-header {brand} {logo} />
                    <main>
                      <h1>{title}</h1>
                    </main>
                    <page-footer {brand} />
                  </body>
                </html>
              `}</ide-code>
              <ide-code id="strat-2-header-ink" style="display:none" numbers trim detab={16}>{`
                <script>
                  import { props } from '@stackpress/ink';
                  const { brand, logo } = props();
                </script>
                <header>
                  <img src={logo} alt={brand} />
                  <h6>{brand}</h6>
                </header>
              `}</ide-code>
              <ide-code id="strat-2-footer-ink" style="display:none" numbers trim detab={16}>{`
                <script>
                  import { props } from '@stackpress/ink';
                  const { brand } = props();
                </script>
                <footer>
                  <a href="/about">About</a>
                  <copy>&copy; 2025 {brand}</copy>
                </footer>
              `}</ide-code>
            </app-main>
          </ide-app>

          <a name="strat-3"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Strategy 3: Partial Styling')}
          </h3>

          <i18n-translate p trim class="tx-lh-36 py-20">
            This strategy uses components that do not have a 
            <ide-code inline>{`<style>`}</ide-code> tag,
            but imports style via the 
            <ide-code inline>{`<link>`}</ide-code> tag to utilize both 
            global styles and specific styles that are needed for the
            component. 
          </i18n-translate>

          <ide-app height={400} title="Shallow Components" class="py-20">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-3" 
                  selector="#strat-3-page-ink"
                >
                  src/page.ink
                </element-tab>
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-3" 
                  selector="#strat-3-header-ink"
                >
                  src/header.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"  
                  group="strat-3" 
                  selector="#strat-3-footer-ink"
                >
                  src/footer.ink
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
                group="strat-3" 
                selector="#strat-3-page-ink"
              >
                <element-icon name="file" />
                page.ink
              </element-tab>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-3" 
                selector="#strat-3-header-ink"
              >
                <element-icon name="file" />
                header.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-3" 
                selector="#strat-3-footer-ink"
              >
                <element-icon name="file" />
                footer.ink
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="strat-3-page-ink" style="display:none" numbers trim detab={16}>{`
                <link rel="import" type="component" href="./header.ink" name="page-header" />
                <link rel="import" type="component" href="./footer.ink" name="page-footer" />
                <script>
                  import { env } from '@stackpress/ink';
                  const { BUILD_ID, APP_DATA } = env();
                  const title = 'Hello World';
                  const brand = 'Acme Inc.';
                  const logo = '/logo.png';
                </script>
                <html>
                  <head>
                    <meta charset="utf-8" />
                    <title>{title}</title>
                    <link rel="stylesheet" type="text/css" href="/styles.css" />

                    <link rel="stylesheet" type="text/css" href={\`/build/$\{BUILD_ID}.css\`} />
                    <script data-app={APP_DATA} src={\`/build/\${BUILD_ID}.js\`}></script>
                  </head>
                  <body>
                    <page-header {brand} {logo} />
                    <main>
                      <h1>{title}</h1>
                    </main>
                    <page-footer {brand} />
                  </body>
                </html>
              `}</ide-code>
              <ide-code id="strat-3-header-ink" numbers trim detab={16}>{`
                <link rel="stylesheet" type="text/css" href="/header.css" />
                <script>
                  import { props } from '@stackpress/ink';
                  const { brand, logo } = props();
                </script>
                <header>
                  <img src={logo} alt={brand} />
                  <h6>{brand}</h6>
                </header>
              `}</ide-code>
              <ide-code id="strat-3-footer-ink" style="display:none" numbers trim detab={16}>{`
                <link rel="stylesheet" type="text/css" href="/footer.css" />
                <script>
                  import { props } from '@stackpress/ink';
                  const { brand } = props();
                </script>
                <footer>
                  <a href="/about">About</a>
                  <copy>&copy; 2025 {brand}</copy>
                </footer>
              `}</ide-code>
            </app-main>
          </ide-app>

          <a name="strat-4"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Strategy 4: Encapulation')}
          </h3>

          <i18n-translate p trim class="tx-lh-36 py-20">
            This strategy uses components that have a
            <ide-code inline>{`<style>`}</ide-code> tag and encapsulates
            the styles within the component. This strategy is useful for
            applications that require complex UI elements that need to be
            styled in a specific way. This is also useful for components 
            that are designed to be used in multiple projects.
          </i18n-translate>

          <ide-app height={400} title="Encapsulation" class="py-20">
            <app-head>
              <div class="flex scroll-x-auto pt-5 pl-5">
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-4" 
                  selector="#strat-4-page-ink"
                >
                  src/page.ink
                </element-tab>
                <element-tab 
                  on
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"   
                  group="strat-4" 
                  selector="#strat-4-header-ink"
                >
                  src/header.ink
                </element-tab>
                <element-tab 
                  class="relative ml-2 p-10 ct-sm b-solid b-t-1 bx-1 bt-1 bb-0"
                  active="bg-black tx-white"
                  inactive="bg-t-1 tx-t-1"  
                  group="strat-4" 
                  selector="#strat-4-footer-ink"
                >
                  src/footer.ink
                </element-tab>
              </div>
            </app-head>
            <app-left>
              <h5 class="folder">
                <element-icon name="chevron-down" />
                <span>src</span>
              </h5>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-4" 
                selector="#strat-4-page-ink"
              >
                <element-icon name="file" />
                page.ink
              </element-tab>
              <element-tab 
                on
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-4" 
                selector="#strat-4-header-ink"
              >
                <element-icon name="file" />
                header.ink
              </element-tab>
              <element-tab 
                class="pl-15 pt-10 block" 
                active="tx-white"
                inactive="tx-muted" 
                group="strat-4" 
                selector="#strat-4-footer-ink"
              >
                <element-icon name="file" />
                footer.ink
              </element-tab>
            </app-left>
            <app-main>
              <ide-code id="strat-4-page-ink" style="display:none" numbers trim detab={14}>{`
                <link rel="import" type="component" href="./header.ink" name="page-header" />
                <link rel="import" type="component" href="./footer.ink" name="page-footer" />
                <script>
                  import { env } from '@stackpress/ink';
                  const { BUILD_ID, APP_DATA } = env();
                  const title = 'Hello World';
                  const brand = 'Acme Inc.';
                  const logo = '/logo.png';
                </script>
                <html>
                  <head>
                    <meta charset="utf-8" />
                    <title>{title}</title>
                    <link rel="stylesheet" type="text/css" href="/styles.css" />

                    <link rel="stylesheet" type="text/css" href={\`/build/$\{BUILD_ID}.css\`} />
                    <script data-app={APP_DATA} src={\`/build/\${BUILD_ID}.js\`}></script>
                  </head>
                  <body>
                    <page-header {brand} {logo} />
                    <main>
                      <h1>{title}</h1>
                    </main>
                    <page-footer {brand} />
                  </body>
                </html>
              `}</ide-code>
              <ide-code id="strat-4-header-ink" numbers trim detab={14}>{`
                <style>
                  img { width: 100px; height: 100px; }
                  h6 { margin: 0; }
                </style>
                <script>
                  import { props } from '@stackpress/ink';
                  const { brand, logo } = props();
                </script>
                <header>
                  <img src={logo} alt={brand} />
                  <h6>{brand}</h6>
                </header>
              `}</ide-code>
              <ide-code id="strat-4-footer-ink" style="display:none" numbers trim detab={14}>{`
                <style>
                  copy { 
                    display: block; 
                    text-align: center; 
                  }
                </style>
                <script>
                  import { props } from '@stackpress/ink';
                  const { brand } = props();
                </script>
                <footer>
                  <a href="/about">About</a>
                  <copy>&copy; 2025 {brand}</copy>
                </footer>
              `}</ide-code>
            </app-main>
          </ide-app>

          <a name="fouc"></a>
          <h2>{_('Flash of Unstyled Content')}</h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Web Components (custom elements) are 100% defined in 
            JavaScript. That includes their HTML and CSS. Those are 
            programmatically added to the DOM through APIs. By the time 
            the browser has interpreted and executed that code, there is 
            a good chance that the rendering pipeline has already put the 
            custom element on the screen. Since the browser doesn't know 
            about the element the first time around it will render it 
            without the intended styling. After the JavaScript of the 
            custom element definition is executed and the browser, 
            therefore, knows about the CSS rules that apply to that 
            element it can update the view.
          </i18n-translate>

          <i18n-translate p trim class="tx-lh-36 py-20">
            A flash of unstyled content (FOUC) can cause irritating layout 
            shifts as well as reveal content that should have been 
            progressively disclosed. In order to prevent a reflow of other 
            content you can add the following general solution to your 
            global stylesheet.
          </i18n-translate>

          <ide-code lang="css" numbers detab={12}>{`
            *:not(:defined) {
              opacity: 0;
            }
          `}</ide-code>

          <i18n-translate p trim class="tx-lh-36 py-20">
            This style will apply to all elements that are not defined,
            which are usually web components and will hide the content 
            until the browser has fully rendered the component.
          </i18n-translate>

          <nav class="flex">
            <a class="tx-primary py-40" href="/ink/docs/state-management.html">
              <element-icon name="chevron-left" theme="tx-1" />
              {_('State Management')}
            </a>
            <a class="flex-grow tx-right tx-primary py-40" href="/ink/docs/compiler-api.html">
              {_('Compiler API')}
              <element-icon name="chevron-right" theme="tx-1" />
            </a>
          </nav>
          <footer class="foot"></footer>
        </api-docs>
      </main>
    </panel-layout>
  </body>
</html>