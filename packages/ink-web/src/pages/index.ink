<link rel="import" type="template" href="@/components/html/head" name="html-head" />
<link rel="import" type="template" href="@/components/html/header" name="html-header" />
<link rel="import" type="component" href="@stackpress/ink-ui/layout/panel" name="panel-layout" />
<link rel="import" type="component" href="@stackpress/ink-ui/form/button" name="element-button" />
<link rel="import" type="component" href="@/components/ide/app" name="ide-app" />
<link rel="import" type="component" href="@/components/ide/code" name="ide-code" />
<link rel="import" type="component" href="@/components/ide/preview" name="ide-preview" />
<link rel="import" type="component" href="@/components/i18n/translate" name="i18n-translate" />
<link rel="import" type="component" href="@/components/tweet-box" />
<style>
  @ink theme;
  @ink reset;
  @ink fouc-opacity;
  @ink utilities;
</style>
<script>
  import { env } from '@stackpress/ink';
  import { _ } from '@/components/i18n';

  const url = '/ink/index.html';
  const title = _('Ink - The reactive web component template engine.');
  const description = _('Ink is a template engine that generates web components and support reactivity.');
</script>
<html>
  <html-head />
  <body class="light bg-t-0 tx-t-1 tx-arial">
    <panel-layout>
      <header><html-header /></header>
      <main class="scroll-auto">
        <section class="bg-t-1 py-40 tx-center w-full">
          <img class="h-100" src="/ink/ink-logo.png" alt="Ink Logo" />
          <i18n-translate p trim class="tx-30 py-30 tx-lh-36">
            The reactive web component template engine.
          </i18n-translate>
          <element-button 
            primary xl rounded 
            class="mr-10" 
            href="/ink/docs/getting-started.html"
          >
            {_('Get Started')}
          </element-button>
          <element-button 
            secondary xl rounded 
            class="inline-block"
            href="/ink/docs/index.html"
          >
            {_('Read the Docs')}
          </element-button>
        </section>
        <section class="m-auto mw-960 px-20">
          <i18n-translate p trim class="p-20 tx-center tx-lh-36 tx-18">
            Ink is a modern HTML markup language and a server first 
            template engine with a built-in parser/compiler that 
            generates web components and supports reactivity.
          </i18n-translate>
          <ide-app class="block" title="Basic Example">
            <div class="flex bg-white md-block">
              <ide-code numbers trim detab={16} class="basis-half">{`
                <style>
                  h1 { font-weight: bold; }
                </style>
                <script>
                  const name = 'world';
                </script>
                <h1>Hello {name}!</h1>
              `}</ide-code>
              <ide-preview class="basis-half">
                <div>
                  <h1>{_('Hello world!')}</h1>
                </div>
              </ide-preview>
            </div>
          </ide-app>
        </section>
        <section class="bg-t-1 m-auto py-40 px-20 tx-center">
          <ul class="flex flex-center list-none p-0 tx-center md-block">
            <li class="w-third mw-300 md-mw-400 md-w-auto md-m-auto">
              <div class="p-10">
                <h3 class="mb-20 tx-upper">
                  {_('Expressive Markup')}
                </h3>
                <i18n-translate p trim class="tx-16 tx-lh-24">
                  Any data type as attributes. Easily express logic with 
                  markup directives like if, each, and try catch. 
                </i18n-translate>
              </div>
            </li>
            <li class="w-third mw-300 md-mw-400 md-w-auto md-m-auto md-mt-20">
              <div class="p-10">
                <h3 class="mb-20 tx-upper">
                  {_('Reactive Signals')}
                </h3>
                <i18n-translate p trim class="tx-16 tx-lh-24">
                  Easily transition from backend logic to reactive states.
                  No Hydration and no memoization needed.
                </i18n-translate>
              </div>
            </li>
            <li class="w-third mw-300 md-mw-400 md-w-auto md-m-auto md-mt-20">
              <div class="p-10">
                <h3 class="mb-20 tx-upper">
                  {_('Bare Metal')}
                </h3>
                <i18n-translate p trim class="tx-16 tx-lh-24">
                  Work with the DOM directly. Import any web components 
                  from any source. Works with Lit, HTMX.
                </i18n-translate>
              </div>
            </li>
          </ul>
        </section>
        <section class="m-auto mw-960 px-20 py-40">
          <h3 class="mt-40 mb-20 tx-center tx-upper">
            {_('Server Setup')}
          </h3>
          <i18n-translate p trim class="tx-center tx-lh-24 mb-20">
            Ink can be used with popular server 
            frameworks in just a few lines of code.
          </i18n-translate>
          <ide-app title="Server Example">
            <ide-code lang="js" numbers trim detab={14}>{`
              import ink from '@stackpress/ink/compiler';
              //make a ink compiler
              const compiler = ink();
              //render HTML
              const results = compiler.render('./page.ink');
            `}</ide-code>
          </ide-app>

          <h3 class="mt-40 mb-20 tx-center tx-upper">
            {_('Props')}
          </h3>
          <i18n-translate p trim class="tx-center tx-lh-24 mb-20">
            Import your component props and use immediately
          </i18n-translate>
          <ide-app title="Props Example">
            <div class="flex bg-white md-block">
              <ide-code numbers trim detab={16} class="basis-half">{`
                <style>
                  h1 { font-weight: bold; }
                </style>
                <script>
                  import { props } from '@stackpress/ink';
                  const { name } = props();
                </script>
                <h1>Hello {name}!</h1>
              `}</ide-code>
              <ide-preview class="basis-half">
                <div>
                  <h1>{_('Hello world!')}</h1>
                </div>
              </ide-preview>
            </div>
          </ide-app>

          <h3 class="mt-40 mb-20 tx-center tx-upper">
            {_('Reactive Signals')}
          </h3>
          <i18n-translate p trim class="tx-center tx-lh-24 mb-20">
            Use signals to manage state changes and re-renders.
          </i18n-translate>
          <ide-app title="Signal Example">
            <div class="flex bg-white md-block">
              <ide-code numbers trim detab={16} class="basis-half">{`
                <style>
                  h1 { font-weight: bold; }
                </style>
                <script>
                  import { signal } from '@stackpress/ink';
                  const name = signal('world');
                  name.value += '!';
                </script>
                <h1>Hello {name.value}</h1>
              `}</ide-code>
              <ide-preview class="basis-half">
                <div>
                  <h1>{_('Hello world!')}</h1>
                </div>
              </ide-preview>
            </div>
          </ide-app>

          <h3 class="mt-40 mb-20 tx-center tx-upper">
            {_('Components and Templates')}
          </h3>
          <i18n-translate p trim class="tx-center tx-lh-24 mb-20">
            Import components and templates for reusability.
          </i18n-translate>
          <ide-app title="Import Example">
            <div class="flex bg-white md-block">
              <ide-code numbers trim detab={16} class="basis-half">{`
                <!-- page.html -->
                <link rel="import" href="./my-heading.html" />
                <script>
                  const name = 'world';
                </script>
                <my-heading {name}>Hello</my-heading>
              `}</ide-code>
              <ide-code class="basis-half b-t-1 b-solid by-0 bl-1 br-0 md-b-0" trim detab={16}>{`
                <!-- my-heading.html -->
                <script>
                  import { props } from '@stackpress/ink';
                  const { name, children } = props();
                </script>
                <h1>{children} {name}</h1>
              `}</ide-code>
            </div>
          </ide-app>

          <h3 class="mt-40 mb-20 tx-center tx-upper">
            {_('Conditionals and Iterations')}
          </h3>
          <i18n-translate p trim class="tx-center tx-lh-24 mb-20">
            Case for conditions and iterations in an expressive way.
          </i18n-translate>
          <ide-app title="Conditional + Iteration Example">
            <div class="flex bg-white md-block">
              <ide-code numbers trim detab={16} class="basis-half">{`
                <script>
                  const name = 'world';
                  const show = name === "world";
                </script>

                <if true=show>
                  <h1>Hello {name}</h1>
                </if>
              `}</ide-code>
              <ide-code class="basis-half b-t-1 b-solid by-0 bl-1 br-0 md-b-0" trim detab={16}>{`
                <script>
                  const list = [ 'a', 'b', 'c' ];
                </script>
                <ul>
                  <each key=i value=item from=list>
                    <li>{i}: {item}</li>
                  </each>
                </ul>
              `}</ide-code>
            </div>
          </ide-app>
        </section>
        <section class="m-auto px-20 py-40 tx-center bg-t-2">
          <h3 class="tx-h-242424 tx-30 tx-upper">
            {_('Works With Popular Server Frameworks')}
          </h3>
          <div class="flex flex-center flex-wrap mx-auto mt-40 mb-0 sm-block">
            <a class="block basis-third mb-20" href="https://expressjs.com/" target="_blank">
              <img class="h-60" src="https://upload.wikimedia.org/wikipedia/commons/6/64/Expressjs.png" alt="Express" />
            </a>
            <a class="block basis-third mb-20" href="https://fastify.dev/" target="_blank">
              <img class="h-60" src="https://upload.wikimedia.org/wikipedia/commons/0/0a/Fastify_logo.svg" alt="Fastify" />
            </a>
            <a class="block basis-third mb-20" href="https://hapi.dev/" target="_blank">
              <img class="h-60" src="https://raw.githubusercontent.com/hapijs/assets/master/images/hapi.png" alt="Hapi" />
            </a>
            <a class="block basis-third mb-20" href="https://koajs.com/" target="_blank">
              <img class="h-60" src="https://cdn.icon-icons.com/icons2/2699/PNG/512/koajs_logo_icon_168379.png" alt="Koa" />
            </a>
            <a class="block basis-third mb-20" href="https://nestjs.com/" target="_blank">
              <img class="h-60" src="https://cdn.icon-icons.com/icons2/2699/PNG/512/nestjs_logo_icon_169927.png" alt="NestJS" />
            </a>
            <a class="block basis-third mb-20" href="http://restify.com/" target="_blank">
              <img class="h-60" src="https://raw.githubusercontent.com/restify/node-restify/gh-images/logo/png/restify_logo_black_transp_288x288.png?raw=true" alt="Restify" />
            </a>
          </div>
        </section>
        <section class="bg-t-1 m-auto py-40 px-20">
          <h3 class="tx-26 tx-center">
            {_('Ink Loves Developers!')}
          </h3>
          <section class="flex flex-wrap md-block">
            <tweet-box class="block basis-third lg-basis-half" name="Joff Tiquez" handle="@jrtiquez" href="https://twitter.com/jrtiquez" src="https://github.com/jofftiquez.png">
              <p>Im a vue developer. No need for this. OSSPH does not support this project.</p>
            </tweet-box>
            <tweet-box class="block basis-third lg-basis-half" name="Primeagen" handle="@theprimeagen" href="https://twitter.com/ThePrimeagen" src="https://pbs.twimg.com/profile_images/1759330620160049152/2i_wkOoK_400x400.jpg">
              <p>Ink? Never heard of it...<br />"The Name..."</p>
            </tweet-box>
            <tweet-box class="block basis-third lg-basis-half" name="Kristian Quirapas" handle="@YourCompanyCTO" href="https://twitter.com/YourCompanyCTO" src="https://avatars.githubusercontent.com/u/85150796?v=4">
              <p>Ink is good news for Node developers. I'm a rust developer so it don't matter to me.</p>
            </tweet-box>
            <tweet-box class="block basis-third lg-basis-half" name="Drizzle Team" handle="@drizzle.team" href="https://twitter.com/DrizzleORM" src="https://pbs.twimg.com/profile_images/1767809210060877824/mAtEmNk0_400x400.jpg">
              <p>Ink copied this section from us. We are the original.</p>
            </tweet-box>
            <tweet-box class="block basis-third lg-basis-half" name="Chris B" handle="@cblanquera" href="https://twitter.com/cblanquera" src="https://avatars.githubusercontent.com/u/120378?v=4">
              <p>After creating the Ink project, I am really excited to get back to ReactJS.</p>
            </tweet-box>
            <tweet-box class="block basis-third lg-basis-half" name="Theo" handle="@t3dotgg" href="https://twitter.com/t3dotgg" src="https://yt3.googleusercontent.com/4NapxEtLcHQ6wN2zA_DMmkOk47RFb_gy6sjSmUZGg_ARHjlIUjFsrNFddrcKMkTYpBNxCp3J=s160-c-k-c0x00ffffff-no-rj">
              <p>Ink? no thanks. Keep your stack front end. App router for life.</p>
            </tweet-box>
          </section>
        </section>
        <section class="m-auto py-40 px-20 tx-center">
          <h3 class="tx-26 mb-20">
            {_('What are you waiting for?')}
          </h3>
          <element-button 
            primary xl rounded 
            class="inline-block"
            style="margin-right:10px;" 
            href="/ink/docs/getting-started.html"
          >
            {_('Get Started')}
          </element-button>
          <element-button 
            secondary xl rounded 
            class="inline-block"
            href="/ink/docs/index.html"
          >
            {_('Read the Docs')}
          </element-button>
        </section>
      </main>
    </panel-layout>
  </body>
</html>