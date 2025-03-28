<link rel="import" type="template" href="@/components/html/head" name="html-head" />
<link rel="import" type="template" href="@/components/html/header" name="html-header" />
<link rel="import" type="template" href="@/components/html/aside" name="html-aside" />
<link rel="import" type="component" href="@stackpress/ink-ui/layout/panel" name="panel-layout" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/alert" name="element-alert" />
<link rel="import" type="component" href="@stackpress/ink-ui/element/icon" name="element-icon" />
<link rel="import" type="component" href="@/components/api/docs" name="api-docs" />
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

  const url = '/docs/markup-syntax.html';
  const title = _('Markup Syntax - Ink reactive web component template engine.');
  const description = _('Learn how to write markup in Ink.');
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
            <a class="block tx-t-0" href="#imports">{_('Imports')}</a>
            <a class="block tx-t-0" href="#styles">{_('Styles')}</a>
            <a class="block tx-t-0" href="#scripts">{_('Scripts')}</a>
            <a class="block tx-t-0" href="#markup">{_('Markup')}</a>
            <nav class="pl-20">
              <a class="block tx-t-1" href="#tagnames">{_('Tag Names')}</a>
              <a class="block tx-t-1" href="#attributes">{_('Attributes')}</a>
              <a class="block tx-t-1" href="#conditionals">{_('Conditionals')}</a>
              <a class="block tx-t-1" href="#iterations">{_('Iterations')}</a>
              <a class="block tx-t-1" href="#trycatch">{_('Try/Catch')}</a>
            </nav>
          </nav>
        </menu>
      </aside>
      <main>
        <api-docs>
          <h1 class="tx-primary tx-upper tx-30 py-20">
            {_('Markup Syntax')}
          </h1>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Components are the building blocks of Ink files. Documents 
            and page level markup are written in 
            <ide-code inline>.ink</ide-code> files. Components 
            and templates are written in 
            <ide-code inline>.ink</ide-code> files. In both 
            cases, the code is written in a superset of HTML.
          </i18n-translate>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The four sections that make up a ink file — imports, 
            script, styles and markup — are all optional and can be 
            used in any order.
          </i18n-translate>
          <ide-app title="Code Structure" class="py-20">
            <ide-code numbers detab={14}>{`
              <!-- imports go here -->

              <style>
                /* styles go here */
              </style>

              <script>
                // logic goes here
              </script>
              
              <!-- HTML goes here -->
            `}</ide-code>
          </ide-app>

          <a name="imports"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Imports')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Imports are used to include additional components, templates 
            and stylesheets in the current component. Components can 
            be imported as a <ide-code inline>template</ide-code> or 
            <ide-code inline>component</ide-code> type.
          </i18n-translate>

          <ide-app title="Import Examples" class="py-20">
            <ide-code class="scroll-auto" numbers trim detab={14}>{`
              <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/prism.min.css" />
              <link rel="stylesheet" type="text/css" href="/styles/layout.css" />
              <link rel="import" type="template" href="@/components/html-head.ink" />
              <link rel="import" type="component" href="@/components/i18n/translate.ink" name="i18n-translate" />

              <style>
                /* styles go here */
              </style>

              <script>
                // logic goes here
              </script>
              
              <!-- HTML goes here -->
            `}</ide-code>
          </ide-app>
          
          <i18n-translate p trim class="tx-lh-36 py-20">
            The <ide-code inline>rel</ide-code> attribute 
            specifies the relationship between the current document and 
            the linked resource. 
            
            <ide-code inline>rel="import"</ide-code> denotes
            that the imported resource is a component or template.
          </i18n-translate>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The <ide-code inline>type</ide-code> 
            attribute specifies the type of the linked resource. 
            
            <ide-code inline>type="component"</ide-code> 
            imports a web component that can be used as regular markup
            with attributes and children. 
            
            <ide-code inline>type="template"</ide-code> 
            imports a template partial that can be included in the current 
            markup. Template partials do not process attributes or children
            if given.
          </i18n-translate>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The 
            <ide-code inline>href</ide-code> attribute specifies
            the URL of the linked resource. The 
            <ide-code inline>name</ide-code>
            attribute specifies the tag name of the imported component or template.
          </i18n-translate>

          <a name="styles"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Styles')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            CSS styles inside a <ide-code inline>{`<style>`}</ide-code> 
            block enables the native <a 
              target="_blank" 
              href="https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_shadow_DOM"
            >shadow DOM</a> and will be scoped only to that component. 
            Additionally styles defined outside of the component such as 
            global styles will not affect the component.
          </i18n-translate>

          <i18n-translate p trim class="tx-lh-36 py-20">
            External stylesheets can be imported using the 
            <ide-code inline>{`<link>`}</ide-code> tag or using 
            <ide-code inline>{`@import()`}</ide-code> CSS directive. 
          </i18n-translate>

          <i18n-translate p trim class="tx-lh-36 py-20">
            You can use host selectors to style an element from within 
            a component. The <ide-code inline>{`:host`}</ide-code> 
            pseudo-class always applies styles to the root element of the 
            web component.
          </i18n-translate>

          <ide-app title="Using :host" class="py-20">
            <ide-code numbers trim detab={14}>{`
              <style>
                :host {
                  display: block;
                }
              </style>
            `}</ide-code>
          </ide-app>

          <i18n-translate p trim class="tx-lh-36 py-20">
            You can also add conditional styles using the 
            <ide-code inline>{`:host`}</ide-code> selector function. 
            This can be used to style the host so long as it matches the 
            given selector. For example, it can be used to select for 
            hosts that have a given attribute or class.
          </i18n-translate>

          <ide-app title=":host Conditionals" class="py-20">
            <ide-code numbers trim detab={14}>{`
              <style>
                :host([active]) {
                  background-color: #333;
                  color: #FFF;
                }
                :host(.active) {
                  background-color: #333;
                  color: #FFF;
                }
              </style>
            `}</ide-code>
          </ide-app>

          <a name="scripts"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Scripts')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            The <ide-code inline>{`<script>`}</ide-code> block is used 
            to write TypeScript logic for the component. The script block 
            can be used to define variables, functions, and event listeners.
            Variables declared (or imported) at the top level are 
            'visible' from the component's markup. 
          </i18n-translate>

          <ide-app title="Top-Level Variables" class="py-20">
            <ide-code numbers trim detab={14}>{`
              <script>
                const title = 'Hello World';
              </script>

              <h1>{title}</h1>
            `}</ide-code>
          </ide-app>

          <i18n-translate p trim class="tx-lh-36 py-20">
            The <ide-code inline>{`<script>`}</ide-code> block can also 
            be used to import variables from other components to be used
            in the markup.
          </i18n-translate>

          <ide-app title="Importing Files" class="py-20">
            <ide-code class="scroll-auto" numbers trim detab={14}>{`
              <script>
                import getTitle from './getTitle';
                const title = getTitle();
              </script>

              <h1 title={title}>{title}</h1>
            `}</ide-code>
          </ide-app>

          <i18n-translate p trim class="tx-lh-36 py-20">
            You can use <ide-code inline>{`@/`}</ide-code> to prefix the 
            current working directory. This is useful when importing
            files completely in a separate directory in your project
          </i18n-translate>

          <ide-app title="@ Imports" class="py-20">
            <ide-code class="scroll-auto" numbers trim detab={14}>{`
              <script>
                import getTitle from '@/data/getTitle';
                const title = getTitle();
              </script>

              <h1 title={title}>{title}</h1>
            `}</ide-code>
          </ide-app>

          <a name="markup"></a>
          <h2 class="tx-primary tx-upper tx-26 pt-40 pb-10 mb-20 b-solid b-t-1 bb-1 bt-0 bx-0">
            {_('Markup')}
          </h2>

          <i18n-translate p trim class="tx-lh-36 py-20">
            In order to be closer to the native, Ink follows the same 
            standards and conventions as HTML5 web components. Ink 
            components are compiled to native web components that possibly 
            can be used in other projects any modern browser.
          </i18n-translate>

          <a name="tagnames"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Tag Names')}
          </h3>

          <i18n-translate p trim class="tx-lh-36 py-20">
            For web components it's recommended that tag names must have 
            at least one dash (-) in them. As such you probably want to 
            name your element with two distinct words like 
            <ide-code inline>{`i18n-translate`}</ide-code>. You can 
            use as many dashes as you want, you're not limited to one. 
            Some specific rules to follow in order to make a valid tag 
            name:
          </i18n-translate>

          <ul>
            <i18n-translate li trim class="my-10 tx-lh-24">
              It must use all lowercase characters of the alphabet (a-z).
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              It must contain at least one dash (-). Ink will 
              auto prefix component names based on your configuration.
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              It must not be an already reserved tag name including 
              <ide-code inline>annotation-xml</ide-code>,
              <ide-code inline>color-profile</ide-code>,
              <ide-code inline>font-face</ide-code>,
              <ide-code inline>font-face-src</ide-code>,
              <ide-code inline>font-face-uri</ide-code>,
              <ide-code inline>font-face-format</ide-code>,
              <ide-code inline>font-face-name</ide-code>, and 
              <ide-code inline>missing-glyph</ide-code>.
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              It must not contain symbols, like =, @, $.
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              It can contain underscores, and numbers.
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              It can contain characters from different alphabets, 
              such as é, ð, ö, 爱.
            </i18n-translate>
          </ul>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Additionally, Ink works best with correct markup. The 
            following standards should be followed:
          </i18n-translate>

          <ul>
            <i18n-translate li trim class="my-10 tx-lh-24">
              Self closing tags like 
              <ide-code inline>{`<img />`}</ide-code>,
              <ide-code inline>{`<link />`}</ide-code>,
              <ide-code inline>{`<meta />`}</ide-code>,
              <ide-code inline>{`<input />`}</ide-code>
              must have a slash before the closing.
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              When using tables, rows should be wrapped in a 
              <ide-code inline>{`<tbody>`}</ide-code> tag and cells
              should be wrapped in a <ide-code inline>{`<tr>`}</ide-code> 
              tag. ie. <ide-code inline>{`<table><tbody><tr><td>`}</ide-code>
            </i18n-translate>
            <i18n-translate li trim class="my-10 tx-lh-24">
              When using lists, items should be wrapped in a 
              <ide-code inline>{`<ul>`}</ide-code> or 
              <ide-code inline>{`<ol>`}</ide-code> tags.
              ie. <ide-code inline>{`<ul><li>`}</ide-code>
            </i18n-translate>
          </ul>

          <element-alert solid curved secondary class="my-20 tx-lh-24">
            <element-icon name="exclamation-triangle" />
            <strong>Warning:</strong> Any markup auto corrected by browser will cause data syncing 
            issues with Ink.
          </element-alert>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Ink components can loosely be self closing
            <ide-code inline>{`<i18n-translate />`}</ide-code>
            or expressed as a block
            <ide-code inline>{`<i18n-translate></i18n-translate>`}</ide-code>.
          </i18n-translate>

          <a name="attributes"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Attributes')}
          </h3>

          <ide-app title="Markup Expressions">
            <ide-code class="scroll-auto" numbers trim detab={14}>{`
              <a title={title} {href} {...attributes}>
                {title}
              </a>
              <i18n-translate title=title>
                {detail}
              </i18n-translate>
            `}</ide-code>
          </ide-app>

          <i18n-translate p trim class="tx-lh-36 py-20">
            Attributes can be bound to expressions using the 
            <ide-code inline>{`{}`}</ide-code> syntax. 
            Expressions can be variables, functions, or any valid 
            JavaScript expression. By default, attributes work exactly 
            like their HTML counterparts.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code trim>{`
              <button type="button" disabled>Submit</button>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            Traditional HTML attributes can be assigned string values or 
            no value evaluates as <ide-code inline>{`true`}</ide-code>.
          </i18n-translate>

          <ide-code trim>{`
            <a title={title}>Click</a>
          `}</ide-code>
          <i18n-translate p trim class="tx-lh-36 py-20">
            Attributes can be assigned variable names.
          </i18n-translate>

          <ide-code trim>{`
            <a title=title>Click</a>
          `}</ide-code>
          <i18n-translate p trim class="tx-lh-36 py-20">
            Variable names do not need to be wrapped in curly braces
            <ide-code inline>{`{}`}</ide-code>.
          </i18n-translate>

          <ide-code trim>{`
            <a {title}>Click</a>
          `}</ide-code>
          <i18n-translate p trim class="tx-lh-36 py-20">
            Attributes with the same name as a variable can be assigned
            by just wrapping curly braces. ie. 
            <ide-code inline>{`{title}`}</ide-code>.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code trim detab={14}>{`
              <script>
                const attributes = { target: '_blank' };
              </script>
              <a {...attributes}>Click</a>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            Spread operators can be used to assign multiple attributes.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code numbers trim detab={14}>{`
              <script>
                let count = 10
                const metadata = { foo: 'bar', baz: 1, qux: true };
                const data = () => metadata
              </script>
              <a {count} get={data} data-meta={metadata} disable={count < 10}>
                Click
              </a>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            You can assign any valid JavaScript expression to an attribute.
          </i18n-translate>

          <a name="conditionals"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Conditionals')}
          </h3>

          <ide-app title="Conditionals" class="py-20">
            <ide-code class="scroll-auto" numbers trim detab={14}>{`
              <if true={count > 10}>
                <p>Count is greater than 10</p>
              <elif true={count < 5} />
                <p>Count is less than 5</p>
              <else />
                <p>Count is between 5 and 10</p>
              </if>
            `}</ide-code>
          </ide-app>
          <i18n-translate p trim class="tx-lh-36 py-20">
            Conditionals can be used to show or hide elements based on 
            the value of a variable.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code numbers trim detab={14}>{`
              <if true={count > 10}>
                <p>Count is greater than 10</p>
              </if>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The basic syntax for an if statement looks like this and can be 
            <ide-code inline>{`truesy`}</ide-code> or 
            <ide-code inline>{`falsey`}</ide-code>.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code numbers trim detab={14}>{`
              <if false={count > 10}>
                <p>Count is not greater than 10</p>
              </if>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            You can also use the <ide-code inline>{`false`}</ide-code>
            attribute to negate the condition.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code numbers trim detab={14}>{`
              <if true={count > 10}>
                <p>Count is greater than 10</p>
              <else />
                <p>Count is less than or equal to 10</p>
              </if>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            You can use the <ide-code inline>{`else`}</ide-code> block to 
            show content when the condition is false.
          </i18n-translate>

          <ide-code numbers trim detab={12}>{`
            <if true={count > 10}>
              <p>Count is greater than 10</p>
            <elif true={count < 5} />
              <p>Count is less than 5</p>
            </if>
          `}</ide-code>
          <i18n-translate p trim class="tx-lh-36 py-20">
            You can use the <ide-code inline>{`elif`}</ide-code> block to 
            show content when the previous condition is false.
          </i18n-translate>

          <a name="iterations"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Iterations')}
          </h3>

          <ide-app title="Each" class="py-20">
            <ide-code class="scroll-auto" numbers trim detab={14}>{`
              <each key=index value=article from=articles>
                <h1>#{index + 1} {article.title}</h1>
                <p>{article.body}</p>
              </each>
            `}</ide-code>
          </ide-app>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The <ide-code inline>{`<each>`}</ide-code> block can be used 
            to iterate over an array of items or objects.
            The <ide-code inline>{`from`}</ide-code> attribute value is 
            required and can be an array, object or JavaScript expression 
            that evaluates to an array or object. Both the 
            <ide-code inline>{`key`}</ide-code> and 
            <ide-code inline>{`value`}</ide-code> attributes are optional.
          </i18n-translate>

          <div class="scroll-auto bg-black">
            <ide-code numbers trim detab={14}>{`
              <each value={article} from={articles}>
                <h1>{article.title}</h1>
                <p>{article.body}</p>
              </each>
            `}</ide-code>
          </div>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The value of <ide-code inline>{`value`}</ide-code>, in this 
            case <ide-code inline>{`article`}</ide-code> can be used 
            only with in the block. This can be any valid JavaScript 
            variable name.
          </i18n-translate>

          <ide-code numbers trim detab={12}>{`
            <each key={index} from={[1, 2, 3]}>
              <h1>#{index} ???</h1>
            </each>
          `}</ide-code>
          <i18n-translate p trim class="tx-lh-36 py-20">
            The value of <ide-code inline>{`key`}</ide-code>, in this 
            case <ide-code inline>{`index`}</ide-code> can be used 
            only with in the block. This can be any valid JavaScript 
            variable name.
          </i18n-translate>

          <a name="trycatch"></a>
          <h3 class="tx-t-1 tx-upper tx-22 pt-40 pb-20">
            {_('Try/Catch')}
          </h3>

          <ide-app title="Try/Catch Example" class="py-20">
            <ide-code numbers trim detab={14}>{`
              <try>
                <p>{mayCauseError()}</p>
              <catch error={e} />
                <p>Error: {e.message}</p>
              </try>
            `}</ide-code>
          </ide-app>

          <i18n-translate p trim class="tx-lh-36 py-20">
            The <ide-code inline>{`<try><catch>`}</ide-code> block can 
            be used to catch errors that occur in the block. The 
            <ide-code inline>{`<catch>`}</ide-code> block is required and 
            can be used to handle the error.

            The value of <ide-code inline>{`error`}</ide-code>, in the  
            <ide-code inline>{`<catch>`}</ide-code> block in this case
            <ide-code inline>{`e`}</ide-code> is an 
            <ide-code lang="js" inline>{`Error`}</ide-code> object
            that can only be used with in the block. 
          </i18n-translate>

          <nav class="flex">
            <a class="tx-primary py-40" href="/ink/docs/getting-started.html">
              <element-icon name="chevron-left" theme="tx-1" />
              {_('Getting Started')}
            </a>
            <a class="flex-grow tx-right tx-primary py-40" href="/ink/docs/state-management.html">
              {_('State Management')}
              <element-icon name="chevron-right" theme="tx-1" />
            </a>
          </nav>
          <footer class="foot"></footer>
        </api-docs>
      </main>
    </panel-layout>
  </body>
</html>