var InkAPI=(()=>{var fe=Object.create;var v=Object.defineProperty;var de=Object.getOwnPropertyDescriptor;var pe=Object.getOwnPropertyNames;var _e=Object.getPrototypeOf,he=Object.prototype.hasOwnProperty;var o=(t,e)=>()=>(e||t((e={exports:{}}).exports,e),e.exports),me=(t,e)=>{for(var r in e)v(t,r,{get:e[r],enumerable:!0})},J=(t,e,r,n)=>{if(e&&typeof e=="object"||typeof e=="function")for(let a of pe(e))!he.call(t,a)&&a!==r&&v(t,a,{get:()=>e[a],enumerable:!(n=de(e,a))||n.enumerable});return t};var X=(t,e,r)=>(r=t!=null?fe(_e(t)):{},J(e||!t||!t.__esModule?v(r,"default",{value:t,enumerable:!0}):r,t)),ge=t=>J(v({},"__esModule",{value:!0}),t);var A=o(R=>{"use strict";Object.defineProperty(R,"__esModule",{value:!0});var x=class{get length(){return this._elements.size}constructor(e=[]){this._elements=new Set,e.forEach(r=>this._elements.add(r))}add(e){this._elements.add(e)}toArray(){return Array.from(this._elements)}toString(){return Array.from(this._elements).filter(Boolean).map(e=>e.toString()).join("")}};R.default=x});var ee=o(I=>{"use strict";Object.defineProperty(I,"__esModule",{value:!0});I.getStatus=Ee;var Z={CONTINUE:{code:100,status:"Continue"},PROCESSING:{code:102,status:"Processing"},OK:{code:200,status:"OK"},CREATED:{code:201,status:"Created"},ACCEPTED:{code:202,status:"Accepted"},EMPTY:{code:204,status:"No Content"},RESET:{code:205,status:"Reset Content"},PARTIAL:{code:206,status:"Partial Content"},MOVED:{code:301,status:"Moved Permanently"},FOUND:{code:302,status:"Found"},REDIRECT:{code:303,status:"See Other"},CACHE:{code:304,status:"Not Modified"},TEMPORARY:{code:307,status:"Temporary Redirect"},PERMANENT:{code:308,status:"Permanent Redirect"},ABORT:{code:309,status:"Aborted"},BAD_REQUEST:{code:400,status:"Bad Request"},UNAUTHORIZED:{code:401,status:"Unauthorized"},FORBIDDEN:{code:403,status:"Forbidden"},NOT_FOUND:{code:404,status:"Not Found"},BAD_METHOD:{code:405,status:"Method Not Allowed"},NOT_ACCEPTABLE:{code:406,status:"Not Acceptable"},REQUEST_TIMEOUT:{code:408,status:"Request Timeout"},CONFLICT:{code:409,status:"Conflict"},GONE:{code:410,status:"Gone"},LENGTH_REQUIRED:{code:411,status:"Length Required"},TOO_LARGE:{code:413,status:"Payload Too Large"},TOO_LONG:{code:414,status:"URI Too Long"},UNSUPPORTED_TYPE:{code:415,status:"Unsupported Media Type"},BAD_RANGE:{code:416,status:"Range Not Satisfiable"},BAD_EXPECTATION:{code:417,status:"Expectation Failed"},MISDIRECTED:{code:421,status:"Misdirected Request"},UNPROCESSABLE:{code:422,status:"Unprocessable Content"},LOCKED:{code:423,status:"Locked"},BAD_DEPENDENCY:{code:424,status:"Failed Dependency"},UPGRADE_REQUIRED:{code:426,status:"Upgrade Required"},BAD_PRECONDITION:{code:428,status:"Precondition Required"},TOO_MANY:{code:429,status:"Too Many Requests"},HEADER_TOO_LARGE:{code:431,status:"Request Header Fields Too Large"},LEGAL_REASONS:{code:451,status:"Unavailable For Legal Reasons"},ERROR:{code:500,status:"Internal Server Error"},NOT_IMPLEMENTED:{code:501,status:"Not Implemented"},BAD_GATEWAY:{code:502,status:"Bad Gateway"},UNAVAILABLE:{code:503,status:"Service Unavailable"},RESPONSE_TIMEOUT:{code:504,status:"Gateway Timeout"},BAD_VERSION:{code:505,status:"HTTP Version Not Supported"},INSUFFICIENT_STORAGE:{code:507,status:"Insufficient Storage"},INFINITE_LOOP:{code:508,status:"Loop Detected"},NETWORK_AUTHENTICATION_REQUIRED:{code:511,status:"Network Authentication Required"}};I.default=Z;function Ee(t){return Object.values(Z).find(e=>e.code===t)}});var te=o(w=>{"use strict";Object.defineProperty(w,"__esModule",{value:!0});var Te=ee(),N=class t extends Error{static for(e,...r){return r.forEach(function(n){e=e.replace("%s",String(n))}),new this(e)}static forErrors(e){let r=new this("Invalid Parameters");return r.withErrors(e),r}static require(e,r,...n){if(!e){for(let a of n)r=r.replace("%s",a);throw new this(r)}}static try(e){return{catch:r=>{try{return e()}catch(n){if(n instanceof t)return r(n,n.type);if(n instanceof Error){let a=t.upgrade(n);return r(a,a.type)}else if(typeof n=="string"){let a=t.for(n);return r(a,a.type)}return r(n,"unknown")}}}}static upgrade(e,r=500){if(e instanceof t)return e;let n=new this(e.message,r);return n.name=e.name,n.stack=e.stack,n}get code(){return this._code}get end(){return this._end}get errors(){return Object.assign({},this._errors)}get start(){return this._start}get type(){return this._type}constructor(e,r=500){var n;super(e),this._errors={},this._start=0,this._end=0,this.name=this.constructor.name,this._type=this.constructor.name,this._code=r,this._status=((n=(0,Te.getStatus)(r))===null||n===void 0?void 0:n.status)||"Unknown"}toJSON(){return JSON.stringify(this.toResponse(),null,2)}toResponse(e=0,r=0){let n={code:this._code,status:this._status,error:this.message,start:this._start,end:this._end,stack:this.trace(e,r)};return Object.keys(this._errors).length>0&&(n.errors=this._errors),n}trace(e=0,r=0){return typeof this.stack!="string"?[]:this.stack.split(`
`).slice(e,r||this.stack.length).map(a=>a.trim()).map(a=>{if(!a.startsWith("at"))return!1;let[c,u,f]=a.split(" ");f||(f=`(${u})`,u="<none>");let[K,W,Q]=f.substring(1,f.length-1).split(":");return{method:u,file:K,line:parseInt(W)||0,char:parseInt(Q)||0}}).filter(Boolean)}withCode(e){return this._code=e,this}withErrors(e){return this._errors=e,this}withPosition(e,r){return this._start=e,this._end=r,this}};w.default=N});var P=o(_=>{"use strict";var ye=_&&_.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(_,"__esModule",{value:!0});var be=ye(te()),j=class extends be.default{};_.default=j});var h=o(S=>{"use strict";Object.defineProperty(S,"__esModule",{value:!0});var Oe=new Map;S.default=Oe});var L=o(C=>{"use strict";Object.defineProperty(C,"__esModule",{value:!0});var M=class{get value(){return this._escape?this._value.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;"):this._value}constructor(e,r=!1){this._escape=r,this._value=e}toString(){return this.value}};C.default=M});var q=o(m=>{"use strict";var ve=m&&m.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(m,"__esModule",{value:!0});var Ie=ve(A()),De=["area","base","br","col","embed","hr","img","input","link","meta","param","source","track","wbr"],U=class{get attributes(){return this._attributes}get children(){return this._children}get name(){return this._name}get props(){return this._props}constructor(e,r={},n="",a=[]){this._attributes={},this._name=e,this._attributes=r,this._props=n,this._children=new Ie.default(a)}toString(){let e=Object.entries(this._attributes),r=e.length>0?" "+e.map(([a,c])=>{if(typeof c=="string"&&!/["<>\n]/.test(c))return`${a}="${c}"`;if(typeof c=="boolean")return c?a:""}).join(" "):"";if(De.includes(this._name))return`<${this._name}${r} />`;let n=this._children.toString();return`<${this._name}${r}>${n}</${this._name}>`}};m.default=U});var $=o(g=>{"use strict";var se=g&&g.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(g,"__esModule",{value:!0});var ke=se(L()),re=se(q()),B=class{static render(e){return e.filter(Boolean).map(r=>r.toString()).join("")}static registry(e,r=new Set){return e.forEach(n=>{n instanceof re.default&&(["html","head","body"].includes(n.name)||r.add(n),n.name!=="head"&&n.children.length>0&&this.registry(n.children.toArray(),r))}),r}static createElement(e,r,n,a=[]){return new re.default(e,r,n,a)}static createText(e,r=!0){return new ke.default(e,r)}};g.default=B});var ne=o(E=>{"use strict";var H=E&&E.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(E,"__esModule",{value:!0});var xe=H(P()),d=H(h()),F=H($()),G=class{bindings(e={}){d.default.set("props",e||{});let r=Object.fromEntries(Object.entries(process.env||{}).filter(c=>c[0].startsWith("PUBLIC_")));d.default.set("env",Object.assign(Object.assign({},r),{BUILD_ID:this.id()}));let n=F.default.registry(this.template()),a={};return Array.from(n.values()).forEach((c,u)=>{a[String(u)]=c.attributes}),a}render(e={}){d.default.set("props",e||{}),d.default.set("bindings",this.bindings(e));let r=Object.fromEntries(Object.entries(process.env||{}).filter(f=>f[0].startsWith("PUBLIC_")));d.default.set("env",Object.assign(Object.assign({},r),{BUILD_ID:this.id()}));let n=this.template(),a=F.default.render(n).trim();if(!a.toLowerCase().startsWith("<html"))throw xe.default.for("Document must start with an <html> tag.");let c=Object.fromEntries(d.default.entries()),u=JSON.stringify(c).replace(/\n/g,`
  `);return`<!DOCTYPE html>
${a.replace("__CLIENT_DATA__",u)}`}_toNodeList(e){return typeof e=="object"&&typeof e.nodeType=="number"?[e]:Array.isArray(e)&&e.every(r=>typeof r=="object"&&typeof r.nodeType=="number")?e:[F.default.createText(String(e))]}};E.default=G});var ae=o(T=>{"use strict";Object.defineProperty(T,"__esModule",{value:!0});T.InkEmitter=void 0;var D=class{emit(e,r){return this}on(e,r){return this}once(e,r){return this}unbind(e,r){return this}};T.InkEmitter=D;var Re=new D;T.default=Re});var ie=o(y=>{"use strict";var Ae=y&&y.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(y,"__esModule",{value:!0});var Ne=Ae(h());function we(t){let e=Ne.default.get("env")||{};return t?e[t]||null:e}y.default=we});var ce=o(b=>{"use strict";var je=b&&b.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(b,"__esModule",{value:!0});b.default=Se;var Pe=je(h());function Se(){return Pe.default.get("props")||{}}});var le=o(i=>{"use strict";var Me=i&&i.__createBinding||(Object.create?function(t,e,r,n){n===void 0&&(n=r);var a=Object.getOwnPropertyDescriptor(e,r);(!a||("get"in a?!e.__esModule:a.writable||a.configurable))&&(a={enumerable:!0,get:function(){return e[r]}}),Object.defineProperty(t,n,a)}:function(t,e,r,n){n===void 0&&(n=r),t[n]=e[r]}),Ce=i&&i.__setModuleDefault||(Object.create?function(t,e){Object.defineProperty(t,"default",{enumerable:!0,value:e})}:function(t,e){t.default=e}),Le=i&&i.__importStar||function(){var t=function(e){return t=Object.getOwnPropertyNames||function(r){var n=[];for(var a in r)Object.prototype.hasOwnProperty.call(r,a)&&(n[n.length]=a);return n},t(e)};return function(e){if(e&&e.__esModule)return e;var r={};if(e!=null)for(var n=t(e),a=0;a<n.length;a++)n[a]!=="default"&&Me(r,e,n[a]);return Ce(r,e),r}}(),l=i&&i.__importDefault||function(t){return t&&t.__esModule?t:{default:t}};Object.defineProperty(i,"__esModule",{value:!0});i.InkText=i.InkException=i.InkEmitter=i.InkElement=i.InkRegistry=i.InkDocument=i.InkCollection=i.props=i.emitter=i.env=i.data=void 0;var Ue=l(A());i.InkCollection=Ue.default;var qe=l(ne());i.InkDocument=qe.default;var Be=l($());i.InkRegistry=Be.default;var $e=l(q());i.InkElement=$e.default;var oe=Le(ae());i.emitter=oe.default;Object.defineProperty(i,"InkEmitter",{enumerable:!0,get:function(){return oe.InkEmitter}});var Fe=l(L());i.InkText=Fe.default;var Ge=l(h());i.data=Ge.default;var He=l(ie());i.env=He.default;var Ye=l(ce());i.props=Ye.default;var Ke=l(P());i.InkException=Ke.default});var Y=o((lt,ue)=>{ue.exports={...le()}});var We={};me(We,{default:()=>k});var s=X(Y()),p=X(Y()),k=class extends s.InkDocument{id(){return"e2ed1d881a734c4684b9"}styles(){return`@ink theme;
  @ink reset;
  @ink fouc-opacity;
  @ink utilities;`}template(){let{q:e,code:r=200,status:n="OK",span:a={},filter:c={},results:u=[],settings:f={menu:[]},total:K=0,skip:W=0,take:Q=50}=(0,p.props)("document"),V="/ink/index.html",O="Profile Search",z="Search for profiles in the system.",Qe=[{icon:"home",label:"Home",href:"/admin"},{icon:"user",label:"Profiles"}];return[s.InkRegistry.createText(`
`,!1),s.InkRegistry.createElement("html",{},"{ }",[s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("head",{},"{ }",[s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{charset:"utf-8"},'{ "charset": "utf-8" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"viewport",content:"width=device-width, initial-scale=1"},'{ "name": "viewport", "content": "width=device-width, initial-scale=1" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("title",{},"{ }",[...this._toNodeList(O)]),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"url",property:"og:url",content:`https://stackpress.github.io/ink${V}`},'{ "name": "url", "property": "og:url", "content": `https://stackpress.github.io/ink${url}` }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"type",property:"og:type",content:"website"},'{ "name": "type", "property": "og:type", "content": "website" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"image",property:"og:image",content:"https://stackpress.github.io/ink/ink-logo.png"},'{ "name": "image", "property": "og:image", "content": "https://stackpress.github.io/ink/ink-logo.png" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"title",property:"og:title",content:O},'{ "name": "title", "property": "og:title", "content": title }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"description",property:"og:description",content:z},'{ "name": "description", "property": "og:description", "content": description }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"twitter:card",content:"summary"},'{ "name": "twitter:card", "content": "summary" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"twitter:site",content:"@stackpress"},'{ "name": "twitter:site", "content": "@stackpress" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"twitter:title",content:O},'{ "name": "twitter:title", "content": title }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"twitter:description",content:z},'{ "name": "twitter:description", "content": description }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("meta",{name:"twitter:image",content:"https://stackpress.github.io/ink/ink-logo.png"},'{ "name": "twitter:image", "content": "https://stackpress.github.io/ink/ink-logo.png" }'),s.InkRegistry.createText(`
  
  `,!1),s.InkRegistry.createElement("link",{rel:"favicon",href:"/ink/favicon.ico"},'{ "rel": "favicon", "href": "/ink/favicon.ico" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("link",{rel:"shortcut icon",type:"image/png",href:"/ink/favicon.png"},'{ "rel": "shortcut icon", "type": "image/png", "href": "/ink/favicon.png" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("link",{rel:"stylesheet",type:"text/css",href:"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"},'{ "rel": "stylesheet", "type": "text/css", "href": "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("link",{rel:"stylesheet",type:"text/css",href:"/ink/styles/global.css"},'{ "rel": "stylesheet", "type": "text/css", "href": "/ink/styles/global.css" }'),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("link",{rel:"stylesheet",type:"text/css",href:`/ink/build/client/${(0,p.env)("BUILD_ID")}.css`},'{ "rel": "stylesheet", "type": "text/css", "href": `/ink/build/client/${env(\'BUILD_ID\')}.css` }'),s.InkRegistry.createElement("script",{id:"CLIENT_DATA",type:"text/json"},'{ "id": "CLIENT_DATA", "type": "text/json" }',[s.InkRegistry.createText("__CLIENT_DATA__",!0)]),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("script",{type:"text/javascript",src:`/ink/build/client/${(0,p.env)("BUILD_ID")}.js`},'{ "type": "text/javascript", "src": `/ink/build/client/${env(\'BUILD_ID\')}.js` }'),s.InkRegistry.createText(`
  `,!1),...(0,p.env)("PUBLIC_ENV")==="development"?[s.InkRegistry.createElement("script",{src:"/dev.js"},'{ "src": "/dev.js" }')]:[],s.InkRegistry.createText(`
`,!1)]),s.InkRegistry.createText(`
  `,!1),s.InkRegistry.createElement("body",{class:"relative dark bg-t-0 tx-t-1 tx-arial"},'{ "class": "relative dark bg-t-0 tx-t-1 tx-arial" }',[s.InkRegistry.createText(`
    `,!1),s.InkRegistry.createElement("admin-app",{settings:f,url:V,title:O,code:r,status:n},'{ "settings": settings, "url": url, "title": title, "code": code, "status": status }',[s.InkRegistry.createText(`
      `,!1),s.InkRegistry.createElement("aside",{class:"absolute z-5 bottom-0 top-0 right-0 w-360 flex flex-col"},'{ "class": "absolute z-5 bottom-0 top-0 right-0 w-360 flex flex-col" }',[s.InkRegistry.createText(`
        `,!1),s.InkRegistry.createElement("header",{class:"flex flex-center-y bg-t-0 px-5 py-8"},'{ "class": "flex flex-center-y bg-t-0 px-5 py-8" }',[s.InkRegistry.createText(`
          `,!1),s.InkRegistry.createElement("element-icon",{name:"chevron-left",class:"pr-10"},'{ "name": "chevron-left", "class": "pr-10" }'),s.InkRegistry.createText(`
          `,!1),s.InkRegistry.createElement("h3",{class:"tx-upper"},'{ "class": "tx-upper" }',[s.InkRegistry.createText("Filters",!1)]),s.InkRegistry.createText(`
        `,!1)]),s.InkRegistry.createText(`
        `,!1),s.InkRegistry.createElement("main",{class:"flex-grow bg-t-1"},'{ "class": "flex-grow bg-t-1" }',[s.InkRegistry.createText(`
          `,!1),s.InkRegistry.createElement("profile-filters",{filter:c,span:a},'{ "filter": filter, "span": span }'),s.InkRegistry.createText(`
        `,!1)]),s.InkRegistry.createText(`
      `,!1)]),s.InkRegistry.createText(`
    `,!1)]),s.InkRegistry.createText(`
  `,!1)]),s.InkRegistry.createText(`
`,!1)])]}};return ge(We);})();
;
;module.exports = InkAPI;;
;module.exports = InkAPI;;
;module.exports = InkAPI;;
;module.exports = InkAPI;;
;module.exports = InkAPI;;
;module.exports = InkAPI;