<link rel="import" type="component" href="@/components/ide/code" name="api-ide-code" />
<script>
  import { signal, props, classlist } from '@stackpress/ink';
  import types from './types.json';

  classlist().add(
    'block', 
    'my-40', 
    'scroll-hidden', 
    'curved', 
    'shadow-0-0-10-0-0-0-5'
  );

  const { start = 'InkCompiler' } = props();

  const paths = signal<string[]>([ start ]);
  const active = signal<string>(start);

  const next = e => {
    const type = e.target.getAttribute('data-type');
    paths.value = [ ...paths.value, type ];
    active.value = type;
  };

  const prev = () => {
    paths.value = paths.value.slice(0, paths.value.length - 1);
    active.value = paths.value[paths.value.length - 1];
  };
</script>
<h3 class="tx-secondary bg-t-2 tx-16 m-0 p-10">
  <if true={paths.value.length > 1}>
    <a class="tx-t-1 cursor-pointer" click=prev>
      <i class="fas fa-arrow-left"></i>
    </a>
  </if>
  API: {active.value}
</h3>
<div class="bg-t-0 p-10">
  <div class="relative mb-20 scroll-auto">
    <table class="w-full b-collapse">
      <thead>
        <th class="p-10 tx-left tx-upper">Property</th>
        <if false={active.value.includes('Emitter')}>
          <th class="p-10 tx-left tx-upper">Returns</th>
        </if>
        <th class="p-10 tx-left tx-upper">Description</th>
      </thead>
      <tbody>
        <each key=key value=prop from={types[active.value]}>
          <tr>
            <if true={prop.kind === 'property'}>
              <td class="tx-primary tx-top tx-nowrap b-solid b-t-2 bx-0 bb-0 bt-1 p-10">
                {key}
              </td>
              <if true={types[prop.type]}>
                <td class="tx-top tx-nowrap b-solid b-t-2 bx-0 bb-0 bt-1 p-10">
                  <a class="tx-underline tx-info cursor-pointer" data-type={prop.type} click=next>
                    {prop.type}
                  </a>{prop.list ? '[]' :''}
                </td>
              <else />
                <td class="tx-top tx-nowrap b-solid b-t-2 bx-0 bb-0 bt-1 p-10">
                  {prop.type}{prop.list ? '[]' :''}
                </td>
              </if>
            <elif true={prop.kind === 'function'} />
              <td class="tx-primary tx-top b-solid b-t-2 bx-0 bb-0 bt-1 p-10" nowrap>
                {key}(
                  <each key=index value=arg from={prop.args}>
                    <if true={index > 0}>, </if>
                    {arg.name}: 
                    <if true={types[arg.type]}>
                      <a class="tx-underline tx-info cursor-pointer" data-type={arg.type} click=next>
                        {arg.type}
                      </a>{arg.list ? '[]' :''}
                    <else />
                      {arg.type}{arg.list ? '[]' :''}
                    </if>
                  </each>
                )
              </td>
              <if true={types[prop.returns.type]}>
                <td class="tx-top tx-nowrap b-solid b-t-2 bx-0 bb-0 bt-1 p-10">
                  <a class="tx-underline tx-info cursor-pointer" data-type={prop.returns.type} click=next>
                    {prop.returns.type}
                  </a>{prop.returns.list ? '[]' :''}
                </td>
              <else />
                <td class="tx-top tx-nowrap b-solid b-t-2 bx-0 bb-0 bt-1 p-10">
                  {prop.returns.type}{prop.returns.list ? '[]' :''}
                </td>
              </if>
            <elif true={prop.kind === 'event'} />
              <td 
                class="tx-primary tx-top b-solid b-t-2 bx-0 bb-0 bt-1 p-10" 
                nowrap
              >
                {`on('${key}', (event: Event) => void)`}
              </td>
            </if>
            <td class="tx-top tx-lh-24 b-solid b-t-2 bx-0 bb-0 bt-1 p-10">
              <if true={prop.description}>
                <p class="pb-10">{prop.description}</p>
                <if true={prop.example}>
                  <h5>Example</h5>
                  <api-ide-code lang="js">{prop.example}</api-ide-code> 
                </if>
              </if>
            </td>
          </tr>
        </each>
      </tbody>
    </table>
  </div>
</div>