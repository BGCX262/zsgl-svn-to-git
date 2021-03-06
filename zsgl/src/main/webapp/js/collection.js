/* jquery 1.7.2 */
/*! jQuery v1.7.2 jquery.com | jquery.org/license */
(function(a,b){function cy(a){return f.isWindow(a)?a:a.nodeType===9?a.defaultView||a.parentWindow:!1}function cu(a){if(!cj[a]){var b=c.body,d=f("<"+a+">").appendTo(b),e=d.css("display");d.remove();if(e==="none"||e===""){ck||(ck=c.createElement("iframe"),ck.frameBorder=ck.width=ck.height=0),b.appendChild(ck);if(!cl||!ck.createElement)cl=(ck.contentWindow||ck.contentDocument).document,cl.write((f.support.boxModel?"<!doctype html>":"")+"<html><body>"),cl.close();d=cl.createElement(a),cl.body.appendChild(d),e=f.css(d,"display"),b.removeChild(ck)}cj[a]=e}return cj[a]}function ct(a,b){var c={};f.each(cp.concat.apply([],cp.slice(0,b)),function(){c[this]=a});return c}function cs(){cq=b}function cr(){setTimeout(cs,0);return cq=f.now()}function ci(){try{return new a.ActiveXObject("Microsoft.XMLHTTP")}catch(b){}}function ch(){try{return new a.XMLHttpRequest}catch(b){}}function cb(a,c){a.dataFilter&&(c=a.dataFilter(c,a.dataType));var d=a.dataTypes,e={},g,h,i=d.length,j,k=d[0],l,m,n,o,p;for(g=1;g<i;g++){if(g===1)for(h in a.converters)typeof h=="string"&&(e[h.toLowerCase()]=a.converters[h]);l=k,k=d[g];if(k==="*")k=l;else if(l!=="*"&&l!==k){m=l+" "+k,n=e[m]||e["* "+k];if(!n){p=b;for(o in e){j=o.split(" ");if(j[0]===l||j[0]==="*"){p=e[j[1]+" "+k];if(p){o=e[o],o===!0?n=p:p===!0&&(n=o);break}}}}!n&&!p&&f.error("No conversion from "+m.replace(" "," to ")),n!==!0&&(c=n?n(c):p(o(c)))}}return c}function ca(a,c,d){var e=a.contents,f=a.dataTypes,g=a.responseFields,h,i,j,k;for(i in g)i in d&&(c[g[i]]=d[i]);while(f[0]==="*")f.shift(),h===b&&(h=a.mimeType||c.getResponseHeader("content-type"));if(h)for(i in e)if(e[i]&&e[i].test(h)){f.unshift(i);break}if(f[0]in d)j=f[0];else{for(i in d){if(!f[0]||a.converters[i+" "+f[0]]){j=i;break}k||(k=i)}j=j||k}if(j){j!==f[0]&&f.unshift(j);return d[j]}}function b_(a,b,c,d){if(f.isArray(b))f.each(b,function(b,e){c||bD.test(a)?d(a,e):b_(a+"["+(typeof e=="object"?b:"")+"]",e,c,d)});else if(!c&&f.type(b)==="object")for(var e in b)b_(a+"["+e+"]",b[e],c,d);else d(a,b)}function b$(a,c){var d,e,g=f.ajaxSettings.flatOptions||{};for(d in c)c[d]!==b&&((g[d]?a:e||(e={}))[d]=c[d]);e&&f.extend(!0,a,e)}function bZ(a,c,d,e,f,g){f=f||c.dataTypes[0],g=g||{},g[f]=!0;var h=a[f],i=0,j=h?h.length:0,k=a===bS,l;for(;i<j&&(k||!l);i++)l=h[i](c,d,e),typeof l=="string"&&(!k||g[l]?l=b:(c.dataTypes.unshift(l),l=bZ(a,c,d,e,l,g)));(k||!l)&&!g["*"]&&(l=bZ(a,c,d,e,"*",g));return l}function bY(a){return function(b,c){typeof b!="string"&&(c=b,b="*");if(f.isFunction(c)){var d=b.toLowerCase().split(bO),e=0,g=d.length,h,i,j;for(;e<g;e++)h=d[e],j=/^\+/.test(h),j&&(h=h.substr(1)||"*"),i=a[h]=a[h]||[],i[j?"unshift":"push"](c)}}}function bB(a,b,c){var d=b==="width"?a.offsetWidth:a.offsetHeight,e=b==="width"?1:0,g=4;if(d>0){if(c!=="border")for(;e<g;e+=2)c||(d-=parseFloat(f.css(a,"padding"+bx[e]))||0),c==="margin"?d+=parseFloat(f.css(a,c+bx[e]))||0:d-=parseFloat(f.css(a,"border"+bx[e]+"Width"))||0;return d+"px"}d=by(a,b);if(d<0||d==null)d=a.style[b];if(bt.test(d))return d;d=parseFloat(d)||0;if(c)for(;e<g;e+=2)d+=parseFloat(f.css(a,"padding"+bx[e]))||0,c!=="padding"&&(d+=parseFloat(f.css(a,"border"+bx[e]+"Width"))||0),c==="margin"&&(d+=parseFloat(f.css(a,c+bx[e]))||0);return d+"px"}function bo(a){var b=c.createElement("div");bh.appendChild(b),b.innerHTML=a.outerHTML;return b.firstChild}function bn(a){var b=(a.nodeName||"").toLowerCase();b==="input"?bm(a):b!=="script"&&typeof a.getElementsByTagName!="undefined"&&f.grep(a.getElementsByTagName("input"),bm)}function bm(a){if(a.type==="checkbox"||a.type==="radio")a.defaultChecked=a.checked}function bl(a){return typeof a.getElementsByTagName!="undefined"?a.getElementsByTagName("*"):typeof a.querySelectorAll!="undefined"?a.querySelectorAll("*"):[]}function bk(a,b){var c;b.nodeType===1&&(b.clearAttributes&&b.clearAttributes(),b.mergeAttributes&&b.mergeAttributes(a),c=b.nodeName.toLowerCase(),c==="object"?b.outerHTML=a.outerHTML:c!=="input"||a.type!=="checkbox"&&a.type!=="radio"?c==="option"?b.selected=a.defaultSelected:c==="input"||c==="textarea"?b.defaultValue=a.defaultValue:c==="script"&&b.text!==a.text&&(b.text=a.text):(a.checked&&(b.defaultChecked=b.checked=a.checked),b.value!==a.value&&(b.value=a.value)),b.removeAttribute(f.expando),b.removeAttribute("_submit_attached"),b.removeAttribute("_change_attached"))}function bj(a,b){if(b.nodeType===1&&!!f.hasData(a)){var c,d,e,g=f._data(a),h=f._data(b,g),i=g.events;if(i){delete h.handle,h.events={};for(c in i)for(d=0,e=i[c].length;d<e;d++)f.event.add(b,c,i[c][d])}h.data&&(h.data=f.extend({},h.data))}}function bi(a,b){return f.nodeName(a,"table")?a.getElementsByTagName("tbody")[0]||a.appendChild(a.ownerDocument.createElement("tbody")):a}function U(a){var b=V.split("|"),c=a.createDocumentFragment();if(c.createElement)while(b.length)c.createElement(b.pop());return c}function T(a,b,c){b=b||0;if(f.isFunction(b))return f.grep(a,function(a,d){var e=!!b.call(a,d,a);return e===c});if(b.nodeType)return f.grep(a,function(a,d){return a===b===c});if(typeof b=="string"){var d=f.grep(a,function(a){return a.nodeType===1});if(O.test(b))return f.filter(b,d,!c);b=f.filter(b,d)}return f.grep(a,function(a,d){return f.inArray(a,b)>=0===c})}function S(a){return!a||!a.parentNode||a.parentNode.nodeType===11}function K(){return!0}function J(){return!1}function n(a,b,c){var d=b+"defer",e=b+"queue",g=b+"mark",h=f._data(a,d);h&&(c==="queue"||!f._data(a,e))&&(c==="mark"||!f._data(a,g))&&setTimeout(function(){!f._data(a,e)&&!f._data(a,g)&&(f.removeData(a,d,!0),h.fire())},0)}function m(a){for(var b in a){if(b==="data"&&f.isEmptyObject(a[b]))continue;if(b!=="toJSON")return!1}return!0}function l(a,c,d){if(d===b&&a.nodeType===1){var e="data-"+c.replace(k,"-$1").toLowerCase();d=a.getAttribute(e);if(typeof d=="string"){try{d=d==="true"?!0:d==="false"?!1:d==="null"?null:f.isNumeric(d)?+d:j.test(d)?f.parseJSON(d):d}catch(g){}f.data(a,c,d)}else d=b}return d}function h(a){var b=g[a]={},c,d;a=a.split(/\s+/);for(c=0,d=a.length;c<d;c++)b[a[c]]=!0;return b}var c=a.document,d=a.navigator,e=a.location,f=function(){function J(){if(!e.isReady){try{c.documentElement.doScroll("left")}catch(a){setTimeout(J,1);return}e.ready()}}var e=function(a,b){return new e.fn.init(a,b,h)},f=a.jQuery,g=a.$,h,i=/^(?:[^#<]*(<[\w\W]+>)[^>]*$|#([\w\-]*)$)/,j=/\S/,k=/^\s+/,l=/\s+$/,m=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,n=/^[\],:{}\s]*$/,o=/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,p=/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,q=/(?:^|:|,)(?:\s*\[)+/g,r=/(webkit)[ \/]([\w.]+)/,s=/(opera)(?:.*version)?[ \/]([\w.]+)/,t=/(msie) ([\w.]+)/,u=/(mozilla)(?:.*? rv:([\w.]+))?/,v=/-([a-z]|[0-9])/ig,w=/^-ms-/,x=function(a,b){return(b+"").toUpperCase()},y=d.userAgent,z,A,B,C=Object.prototype.toString,D=Object.prototype.hasOwnProperty,E=Array.prototype.push,F=Array.prototype.slice,G=String.prototype.trim,H=Array.prototype.indexOf,I={};e.fn=e.prototype={constructor:e,init:function(a,d,f){var g,h,j,k;if(!a)return this;if(a.nodeType){this.context=this[0]=a,this.length=1;return this}if(a==="body"&&!d&&c.body){this.context=c,this[0]=c.body,this.selector=a,this.length=1;return this}if(typeof a=="string"){a.charAt(0)!=="<"||a.charAt(a.length-1)!==">"||a.length<3?g=i.exec(a):g=[null,a,null];if(g&&(g[1]||!d)){if(g[1]){d=d instanceof e?d[0]:d,k=d?d.ownerDocument||d:c,j=m.exec(a),j?e.isPlainObject(d)?(a=[c.createElement(j[1])],e.fn.attr.call(a,d,!0)):a=[k.createElement(j[1])]:(j=e.buildFragment([g[1]],[k]),a=(j.cacheable?e.clone(j.fragment):j.fragment).childNodes);return e.merge(this,a)}h=c.getElementById(g[2]);if(h&&h.parentNode){if(h.id!==g[2])return f.find(a);this.length=1,this[0]=h}this.context=c,this.selector=a;return this}return!d||d.jquery?(d||f).find(a):this.constructor(d).find(a)}if(e.isFunction(a))return f.ready(a);a.selector!==b&&(this.selector=a.selector,this.context=a.context);return e.makeArray(a,this)},selector:"",jquery:"1.7.2",length:0,size:function(){return this.length},toArray:function(){return F.call(this,0)},get:function(a){return a==null?this.toArray():a<0?this[this.length+a]:this[a]},pushStack:function(a,b,c){var d=this.constructor();e.isArray(a)?E.apply(d,a):e.merge(d,a),d.prevObject=this,d.context=this.context,b==="find"?d.selector=this.selector+(this.selector?" ":"")+c:b&&(d.selector=this.selector+"."+b+"("+c+")");return d},each:function(a,b){return e.each(this,a,b)},ready:function(a){e.bindReady(),A.add(a);return this},eq:function(a){a=+a;return a===-1?this.slice(a):this.slice(a,a+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(F.apply(this,arguments),"slice",F.call(arguments).join(","))},map:function(a){return this.pushStack(e.map(this,function(b,c){return a.call(b,c,b)}))},end:function(){return this.prevObject||this.constructor(null)},push:E,sort:[].sort,splice:[].splice},e.fn.init.prototype=e.fn,e.extend=e.fn.extend=function(){var a,c,d,f,g,h,i=arguments[0]||{},j=1,k=arguments.length,l=!1;typeof i=="boolean"&&(l=i,i=arguments[1]||{},j=2),typeof i!="object"&&!e.isFunction(i)&&(i={}),k===j&&(i=this,--j);for(;j<k;j++)if((a=arguments[j])!=null)for(c in a){d=i[c],f=a[c];if(i===f)continue;l&&f&&(e.isPlainObject(f)||(g=e.isArray(f)))?(g?(g=!1,h=d&&e.isArray(d)?d:[]):h=d&&e.isPlainObject(d)?d:{},i[c]=e.extend(l,h,f)):f!==b&&(i[c]=f)}return i},e.extend({noConflict:function(b){a.$===e&&(a.$=g),b&&a.jQuery===e&&(a.jQuery=f);return e},isReady:!1,readyWait:1,holdReady:function(a){a?e.readyWait++:e.ready(!0)},ready:function(a){if(a===!0&&!--e.readyWait||a!==!0&&!e.isReady){if(!c.body)return setTimeout(e.ready,1);e.isReady=!0;if(a!==!0&&--e.readyWait>0)return;A.fireWith(c,[e]),e.fn.trigger&&e(c).trigger("ready").off("ready")}},bindReady:function(){if(!A){A=e.Callbacks("once memory");if(c.readyState==="complete")return setTimeout(e.ready,1);if(c.addEventListener)c.addEventListener("DOMContentLoaded",B,!1),a.addEventListener("load",e.ready,!1);else if(c.attachEvent){c.attachEvent("onreadystatechange",B),a.attachEvent("onload",e.ready);var b=!1;try{b=a.frameElement==null}catch(d){}c.documentElement.doScroll&&b&&J()}}},isFunction:function(a){return e.type(a)==="function"},isArray:Array.isArray||function(a){return e.type(a)==="array"},isWindow:function(a){return a!=null&&a==a.window},isNumeric:function(a){return!isNaN(parseFloat(a))&&isFinite(a)},type:function(a){return a==null?String(a):I[C.call(a)]||"object"},isPlainObject:function(a){if(!a||e.type(a)!=="object"||a.nodeType||e.isWindow(a))return!1;try{if(a.constructor&&!D.call(a,"constructor")&&!D.call(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}var d;for(d in a);return d===b||D.call(a,d)},isEmptyObject:function(a){for(var b in a)return!1;return!0},error:function(a){throw new Error(a)},parseJSON:function(b){if(typeof b!="string"||!b)return null;b=e.trim(b);if(a.JSON&&a.JSON.parse)return a.JSON.parse(b);if(n.test(b.replace(o,"@").replace(p,"]").replace(q,"")))return(new Function("return "+b))();e.error("Invalid JSON: "+b)},parseXML:function(c){if(typeof c!="string"||!c)return null;var d,f;try{a.DOMParser?(f=new DOMParser,d=f.parseFromString(c,"text/xml")):(d=new ActiveXObject("Microsoft.XMLDOM"),d.async="false",d.loadXML(c))}catch(g){d=b}(!d||!d.documentElement||d.getElementsByTagName("parsererror").length)&&e.error("Invalid XML: "+c);return d},noop:function(){},globalEval:function(b){b&&j.test(b)&&(a.execScript||function(b){a.eval.call(a,b)})(b)},camelCase:function(a){return a.replace(w,"ms-").replace(v,x)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toUpperCase()===b.toUpperCase()},each:function(a,c,d){var f,g=0,h=a.length,i=h===b||e.isFunction(a);if(d){if(i){for(f in a)if(c.apply(a[f],d)===!1)break}else for(;g<h;)if(c.apply(a[g++],d)===!1)break}else if(i){for(f in a)if(c.call(a[f],f,a[f])===!1)break}else for(;g<h;)if(c.call(a[g],g,a[g++])===!1)break;return a},trim:G?function(a){return a==null?"":G.call(a)}:function(a){return a==null?"":(a+"").replace(k,"").replace(l,"")},makeArray:function(a,b){var c=b||[];if(a!=null){var d=e.type(a);a.length==null||d==="string"||d==="function"||d==="regexp"||e.isWindow(a)?E.call(c,a):e.merge(c,a)}return c},inArray:function(a,b,c){var d;if(b){if(H)return H.call(b,a,c);d=b.length,c=c?c<0?Math.max(0,d+c):c:0;for(;c<d;c++)if(c in b&&b[c]===a)return c}return-1},merge:function(a,c){var d=a.length,e=0;if(typeof c.length=="number")for(var f=c.length;e<f;e++)a[d++]=c[e];else while(c[e]!==b)a[d++]=c[e++];a.length=d;return a},grep:function(a,b,c){var d=[],e;c=!!c;for(var f=0,g=a.length;f<g;f++)e=!!b(a[f],f),c!==e&&d.push(a[f]);return d},map:function(a,c,d){var f,g,h=[],i=0,j=a.length,k=a instanceof e||j!==b&&typeof j=="number"&&(j>0&&a[0]&&a[j-1]||j===0||e.isArray(a));if(k)for(;i<j;i++)f=c(a[i],i,d),f!=null&&(h[h.length]=f);else for(g in a)f=c(a[g],g,d),f!=null&&(h[h.length]=f);return h.concat.apply([],h)},guid:1,proxy:function(a,c){if(typeof c=="string"){var d=a[c];c=a,a=d}if(!e.isFunction(a))return b;var f=F.call(arguments,2),g=function(){return a.apply(c,f.concat(F.call(arguments)))};g.guid=a.guid=a.guid||g.guid||e.guid++;return g},access:function(a,c,d,f,g,h,i){var j,k=d==null,l=0,m=a.length;if(d&&typeof d=="object"){for(l in d)e.access(a,c,l,d[l],1,h,f);g=1}else if(f!==b){j=i===b&&e.isFunction(f),k&&(j?(j=c,c=function(a,b,c){return j.call(e(a),c)}):(c.call(a,f),c=null));if(c)for(;l<m;l++)c(a[l],d,j?f.call(a[l],l,c(a[l],d)):f,i);g=1}return g?a:k?c.call(a):m?c(a[0],d):h},now:function(){return(new Date).getTime()},uaMatch:function(a){a=a.toLowerCase();var b=r.exec(a)||s.exec(a)||t.exec(a)||a.indexOf("compatible")<0&&u.exec(a)||[];return{browser:b[1]||"",version:b[2]||"0"}},sub:function(){function a(b,c){return new a.fn.init(b,c)}e.extend(!0,a,this),a.superclass=this,a.fn=a.prototype=this(),a.fn.constructor=a,a.sub=this.sub,a.fn.init=function(d,f){f&&f instanceof e&&!(f instanceof a)&&(f=a(f));return e.fn.init.call(this,d,f,b)},a.fn.init.prototype=a.fn;var b=a(c);return a},browser:{}}),e.each("Boolean Number String Function Array Date RegExp Object".split(" "),function(a,b){I["[object "+b+"]"]=b.toLowerCase()}),z=e.uaMatch(y),z.browser&&(e.browser[z.browser]=!0,e.browser.version=z.version),e.browser.webkit&&(e.browser.safari=!0),j.test(" ")&&(k=/^[\s\xA0]+/,l=/[\s\xA0]+$/),h=e(c),c.addEventListener?B=function(){c.removeEventListener("DOMContentLoaded",B,!1),e.ready()}:c.attachEvent&&(B=function(){c.readyState==="complete"&&(c.detachEvent("onreadystatechange",B),e.ready())});return e}(),g={};f.Callbacks=function(a){a=a?g[a]||h(a):{};var c=[],d=[],e,i,j,k,l,m,n=function(b){var d,e,g,h,i;for(d=0,e=b.length;d<e;d++)g=b[d],h=f.type(g),h==="array"?n(g):h==="function"&&(!a.unique||!p.has(g))&&c.push(g)},o=function(b,f){f=f||[],e=!a.memory||[b,f],i=!0,j=!0,m=k||0,k=0,l=c.length;for(;c&&m<l;m++)if(c[m].apply(b,f)===!1&&a.stopOnFalse){e=!0;break}j=!1,c&&(a.once?e===!0?p.disable():c=[]:d&&d.length&&(e=d.shift(),p.fireWith(e[0],e[1])))},p={add:function(){if(c){var a=c.length;n(arguments),j?l=c.length:e&&e!==!0&&(k=a,o(e[0],e[1]))}return this},remove:function(){if(c){var b=arguments,d=0,e=b.length;for(;d<e;d++)for(var f=0;f<c.length;f++)if(b[d]===c[f]){j&&f<=l&&(l--,f<=m&&m--),c.splice(f--,1);if(a.unique)break}}return this},has:function(a){if(c){var b=0,d=c.length;for(;b<d;b++)if(a===c[b])return!0}return!1},empty:function(){c=[];return this},disable:function(){c=d=e=b;return this},disabled:function(){return!c},lock:function(){d=b,(!e||e===!0)&&p.disable();return this},locked:function(){return!d},fireWith:function(b,c){d&&(j?a.once||d.push([b,c]):(!a.once||!e)&&o(b,c));return this},fire:function(){p.fireWith(this,arguments);return this},fired:function(){return!!i}};return p};var i=[].slice;f.extend({Deferred:function(a){var b=f.Callbacks("once memory"),c=f.Callbacks("once memory"),d=f.Callbacks("memory"),e="pending",g={resolve:b,reject:c,notify:d},h={done:b.add,fail:c.add,progress:d.add,state:function(){return e},isResolved:b.fired,isRejected:c.fired,then:function(a,b,c){i.done(a).fail(b).progress(c);return this},always:function(){i.done.apply(i,arguments).fail.apply(i,arguments);return this},pipe:function(a,b,c){return f.Deferred(function(d){f.each({done:[a,"resolve"],fail:[b,"reject"],progress:[c,"notify"]},function(a,b){var c=b[0],e=b[1],g;f.isFunction(c)?i[a](function(){g=c.apply(this,arguments),g&&f.isFunction(g.promise)?g.promise().then(d.resolve,d.reject,d.notify):d[e+"With"](this===i?d:this,[g])}):i[a](d[e])})}).promise()},promise:function(a){if(a==null)a=h;else for(var b in h)a[b]=h[b];return a}},i=h.promise({}),j;for(j in g)i[j]=g[j].fire,i[j+"With"]=g[j].fireWith;i.done(function(){e="resolved"},c.disable,d.lock).fail(function(){e="rejected"},b.disable,d.lock),a&&a.call(i,i);return i},when:function(a){function m(a){return function(b){e[a]=arguments.length>1?i.call(arguments,0):b,j.notifyWith(k,e)}}function l(a){return function(c){b[a]=arguments.length>1?i.call(arguments,0):c,--g||j.resolveWith(j,b)}}var b=i.call(arguments,0),c=0,d=b.length,e=Array(d),g=d,h=d,j=d<=1&&a&&f.isFunction(a.promise)?a:f.Deferred(),k=j.promise();if(d>1){for(;c<d;c++)b[c]&&b[c].promise&&f.isFunction(b[c].promise)?b[c].promise().then(l(c),j.reject,m(c)):--g;g||j.resolveWith(j,b)}else j!==a&&j.resolveWith(j,d?[a]:[]);return k}}),f.support=function(){var b,d,e,g,h,i,j,k,l,m,n,o,p=c.createElement("div"),q=c.documentElement;p.setAttribute("className","t"),p.innerHTML="   <link/><table></table><a href='/a' style='top:1px;float:left;opacity:.55;'>a</a><input type='checkbox'/>",d=p.getElementsByTagName("*"),e=p.getElementsByTagName("a")[0];if(!d||!d.length||!e)return{};g=c.createElement("select"),h=g.appendChild(c.createElement("option")),i=p.getElementsByTagName("input")[0],b={leadingWhitespace:p.firstChild.nodeType===3,tbody:!p.getElementsByTagName("tbody").length,htmlSerialize:!!p.getElementsByTagName("link").length,style:/top/.test(e.getAttribute("style")),hrefNormalized:e.getAttribute("href")==="/a",opacity:/^0.55/.test(e.style.opacity),cssFloat:!!e.style.cssFloat,checkOn:i.value==="on",optSelected:h.selected,getSetAttribute:p.className!=="t",enctype:!!c.createElement("form").enctype,html5Clone:c.createElement("nav").cloneNode(!0).outerHTML!=="<:nav></:nav>",submitBubbles:!0,changeBubbles:!0,focusinBubbles:!1,deleteExpando:!0,noCloneEvent:!0,inlineBlockNeedsLayout:!1,shrinkWrapBlocks:!1,reliableMarginRight:!0,pixelMargin:!0},f.boxModel=b.boxModel=c.compatMode==="CSS1Compat",i.checked=!0,b.noCloneChecked=i.cloneNode(!0).checked,g.disabled=!0,b.optDisabled=!h.disabled;try{delete p.test}catch(r){b.deleteExpando=!1}!p.addEventListener&&p.attachEvent&&p.fireEvent&&(p.attachEvent("onclick",function(){b.noCloneEvent=!1}),p.cloneNode(!0).fireEvent("onclick")),i=c.createElement("input"),i.value="t",i.setAttribute("type","radio"),b.radioValue=i.value==="t",i.setAttribute("checked","checked"),i.setAttribute("name","t"),p.appendChild(i),j=c.createDocumentFragment(),j.appendChild(p.lastChild),b.checkClone=j.cloneNode(!0).cloneNode(!0).lastChild.checked,b.appendChecked=i.checked,j.removeChild(i),j.appendChild(p);if(p.attachEvent)for(n in{submit:1,change:1,focusin:1})m="on"+n,o=m in p,o||(p.setAttribute(m,"return;"),o=typeof p[m]=="function"),b[n+"Bubbles"]=o;j.removeChild(p),j=g=h=p=i=null,f(function(){var d,e,g,h,i,j,l,m,n,q,r,s,t,u=c.getElementsByTagName("body")[0];!u||(m=1,t="padding:0;margin:0;border:",r="position:absolute;top:0;left:0;width:1px;height:1px;",s=t+"0;visibility:hidden;",n="style='"+r+t+"5px solid #000;",q="<div "+n+"display:block;'><div style='"+t+"0;display:block;overflow:hidden;'></div></div>"+"<table "+n+"' cellpadding='0' cellspacing='0'>"+"<tr><td></td></tr></table>",d=c.createElement("div"),d.style.cssText=s+"width:0;height:0;position:static;top:0;margin-top:"+m+"px",u.insertBefore(d,u.firstChild),p=c.createElement("div"),d.appendChild(p),p.innerHTML="<table><tr><td style='"+t+"0;display:none'></td><td>t</td></tr></table>",k=p.getElementsByTagName("td"),o=k[0].offsetHeight===0,k[0].style.display="",k[1].style.display="none",b.reliableHiddenOffsets=o&&k[0].offsetHeight===0,a.getComputedStyle&&(p.innerHTML="",l=c.createElement("div"),l.style.width="0",l.style.marginRight="0",p.style.width="2px",p.appendChild(l),b.reliableMarginRight=(parseInt((a.getComputedStyle(l,null)||{marginRight:0}).marginRight,10)||0)===0),typeof p.style.zoom!="undefined"&&(p.innerHTML="",p.style.width=p.style.padding="1px",p.style.border=0,p.style.overflow="hidden",p.style.display="inline",p.style.zoom=1,b.inlineBlockNeedsLayout=p.offsetWidth===3,p.style.display="block",p.style.overflow="visible",p.innerHTML="<div style='width:5px;'></div>",b.shrinkWrapBlocks=p.offsetWidth!==3),p.style.cssText=r+s,p.innerHTML=q,e=p.firstChild,g=e.firstChild,i=e.nextSibling.firstChild.firstChild,j={doesNotAddBorder:g.offsetTop!==5,doesAddBorderForTableAndCells:i.offsetTop===5},g.style.position="fixed",g.style.top="20px",j.fixedPosition=g.offsetTop===20||g.offsetTop===15,g.style.position=g.style.top="",e.style.overflow="hidden",e.style.position="relative",j.subtractsBorderForOverflowNotVisible=g.offsetTop===-5,j.doesNotIncludeMarginInBodyOffset=u.offsetTop!==m,a.getComputedStyle&&(p.style.marginTop="1%",b.pixelMargin=(a.getComputedStyle(p,null)||{marginTop:0}).marginTop!=="1%"),typeof d.style.zoom!="undefined"&&(d.style.zoom=1),u.removeChild(d),l=p=d=null,f.extend(b,j))});return b}();var j=/^(?:\{.*\}|\[.*\])$/,k=/([A-Z])/g;f.extend({cache:{},uuid:0,expando:"jQuery"+(f.fn.jquery+Math.random()).replace(/\D/g,""),noData:{embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",applet:!0},hasData:function(a){a=a.nodeType?f.cache[a[f.expando]]:a[f.expando];return!!a&&!m(a)},data:function(a,c,d,e){if(!!f.acceptData(a)){var g,h,i,j=f.expando,k=typeof c=="string",l=a.nodeType,m=l?f.cache:a,n=l?a[j]:a[j]&&j,o=c==="events";if((!n||!m[n]||!o&&!e&&!m[n].data)&&k&&d===b)return;n||(l?a[j]=n=++f.uuid:n=j),m[n]||(m[n]={},l||(m[n].toJSON=f.noop));if(typeof c=="object"||typeof c=="function")e?m[n]=f.extend(m[n],c):m[n].data=f.extend(m[n].data,c);g=h=m[n],e||(h.data||(h.data={}),h=h.data),d!==b&&(h[f.camelCase(c)]=d);if(o&&!h[c])return g.events;k?(i=h[c],i==null&&(i=h[f.camelCase(c)])):i=h;return i}},removeData:function(a,b,c){if(!!f.acceptData(a)){var d,e,g,h=f.expando,i=a.nodeType,j=i?f.cache:a,k=i?a[h]:h;if(!j[k])return;if(b){d=c?j[k]:j[k].data;if(d){f.isArray(b)||(b in d?b=[b]:(b=f.camelCase(b),b in d?b=[b]:b=b.split(" ")));for(e=0,g=b.length;e<g;e++)delete d[b[e]];if(!(c?m:f.isEmptyObject)(d))return}}if(!c){delete j[k].data;if(!m(j[k]))return}f.support.deleteExpando||!j.setInterval?delete j[k]:j[k]=null,i&&(f.support.deleteExpando?delete a[h]:a.removeAttribute?a.removeAttribute(h):a[h]=null)}},_data:function(a,b,c){return f.data(a,b,c,!0)},acceptData:function(a){if(a.nodeName){var b=f.noData[a.nodeName.toLowerCase()];if(b)return b!==!0&&a.getAttribute("classid")===b}return!0}}),f.fn.extend({data:function(a,c){var d,e,g,h,i,j=this[0],k=0,m=null;if(a===b){if(this.length){m=f.data(j);if(j.nodeType===1&&!f._data(j,"parsedAttrs")){g=j.attributes;for(i=g.length;k<i;k++)h=g[k].name,h.indexOf("data-")===0&&(h=f.camelCase(h.substring(5)),l(j,h,m[h]));f._data(j,"parsedAttrs",!0)}}return m}if(typeof a=="object")return this.each(function(){f.data(this,a)});d=a.split(".",2),d[1]=d[1]?"."+d[1]:"",e=d[1]+"!";return f.access(this,function(c){if(c===b){m=this.triggerHandler("getData"+e,[d[0]]),m===b&&j&&(m=f.data(j,a),m=l(j,a,m));return m===b&&d[1]?this.data(d[0]):m}d[1]=c,this.each(function(){var b=f(this);b.triggerHandler("setData"+e,d),f.data(this,a,c),b.triggerHandler("changeData"+e,d)})},null,c,arguments.length>1,null,!1)},removeData:function(a){return this.each(function(){f.removeData(this,a)})}}),f.extend({_mark:function(a,b){a&&(b=(b||"fx")+"mark",f._data(a,b,(f._data(a,b)||0)+1))},_unmark:function(a,b,c){a!==!0&&(c=b,b=a,a=!1);if(b){c=c||"fx";var d=c+"mark",e=a?0:(f._data(b,d)||1)-1;e?f._data(b,d,e):(f.removeData(b,d,!0),n(b,c,"mark"))}},queue:function(a,b,c){var d;if(a){b=(b||"fx")+"queue",d=f._data(a,b),c&&(!d||f.isArray(c)?d=f._data(a,b,f.makeArray(c)):d.push(c));return d||[]}},dequeue:function(a,b){b=b||"fx";var c=f.queue(a,b),d=c.shift(),e={};d==="inprogress"&&(d=c.shift()),d&&(b==="fx"&&c.unshift("inprogress"),f._data(a,b+".run",e),d.call(a,function(){f.dequeue(a,b)},e)),c.length||(f.removeData(a,b+"queue "+b+".run",!0),n(a,b,"queue"))}}),f.fn.extend({queue:function(a,c){var d=2;typeof a!="string"&&(c=a,a="fx",d--);if(arguments.length<d)return f.queue(this[0],a);return c===b?this:this.each(function(){var b=f.queue(this,a,c);a==="fx"&&b[0]!=="inprogress"&&f.dequeue(this,a)})},dequeue:function(a){return this.each(function(){f.dequeue(this,a)})},delay:function(a,b){a=f.fx?f.fx.speeds[a]||a:a,b=b||"fx";return this.queue(b,function(b,c){var d=setTimeout(b,a);c.stop=function(){clearTimeout(d)}})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,c){function m(){--h||d.resolveWith(e,[e])}typeof a!="string"&&(c=a,a=b),a=a||"fx";var d=f.Deferred(),e=this,g=e.length,h=1,i=a+"defer",j=a+"queue",k=a+"mark",l;while(g--)if(l=f.data(e[g],i,b,!0)||(f.data(e[g],j,b,!0)||f.data(e[g],k,b,!0))&&f.data(e[g],i,f.Callbacks("once memory"),!0))h++,l.add(m);m();return d.promise(c)}});var o=/[\n\t\r]/g,p=/\s+/,q=/\r/g,r=/^(?:button|input)$/i,s=/^(?:button|input|object|select|textarea)$/i,t=/^a(?:rea)?$/i,u=/^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,v=f.support.getSetAttribute,w,x,y;f.fn.extend({attr:function(a,b){return f.access(this,f.attr,a,b,arguments.length>1)},removeAttr:function(a){return this.each(function(){f.removeAttr(this,a)})},prop:function(a,b){return f.access(this,f.prop,a,b,arguments.length>1)},removeProp:function(a){a=f.propFix[a]||a;return this.each(function(){try{this[a]=b,delete this[a]}catch(c){}})},addClass:function(a){var b,c,d,e,g,h,i;if(f.isFunction(a))return this.each(function(b){f(this).addClass(a.call(this,b,this.className))});if(a&&typeof a=="string"){b=a.split(p);for(c=0,d=this.length;c<d;c++){e=this[c];if(e.nodeType===1)if(!e.className&&b.length===1)e.className=a;else{g=" "+e.className+" ";for(h=0,i=b.length;h<i;h++)~g.indexOf(" "+b[h]+" ")||(g+=b[h]+" ");e.className=f.trim(g)}}}return this},removeClass:function(a){var c,d,e,g,h,i,j;if(f.isFunction(a))return this.each(function(b){f(this).removeClass(a.call(this,b,this.className))});if(a&&typeof a=="string"||a===b){c=(a||"").split(p);for(d=0,e=this.length;d<e;d++){g=this[d];if(g.nodeType===1&&g.className)if(a){h=(" "+g.className+" ").replace(o," ");for(i=0,j=c.length;i<j;i++)h=h.replace(" "+c[i]+" "," ");g.className=f.trim(h)}else g.className=""}}return this},toggleClass:function(a,b){var c=typeof a,d=typeof b=="boolean";if(f.isFunction(a))return this.each(function(c){f(this).toggleClass(a.call(this,c,this.className,b),b)});return this.each(function(){if(c==="string"){var e,g=0,h=f(this),i=b,j=a.split(p);while(e=j[g++])i=d?i:!h.hasClass(e),h[i?"addClass":"removeClass"](e)}else if(c==="undefined"||c==="boolean")this.className&&f._data(this,"__className__",this.className),this.className=this.className||a===!1?"":f._data(this,"__className__")||""})},hasClass:function(a){var b=" "+a+" ",c=0,d=this.length;for(;c<d;c++)if(this[c].nodeType===1&&(" "+this[c].className+" ").replace(o," ").indexOf(b)>-1)return!0;return!1},val:function(a){var c,d,e,g=this[0];{if(!!arguments.length){e=f.isFunction(a);return this.each(function(d){var g=f(this),h;if(this.nodeType===1){e?h=a.call(this,d,g.val()):h=a,h==null?h="":typeof h=="number"?h+="":f.isArray(h)&&(h=f.map(h,function(a){return a==null?"":a+""})),c=f.valHooks[this.type]||f.valHooks[this.nodeName.toLowerCase()];if(!c||!("set"in c)||c.set(this,h,"value")===b)this.value=h}})}if(g){c=f.valHooks[g.type]||f.valHooks[g.nodeName.toLowerCase()];if(c&&"get"in c&&(d=c.get(g,"value"))!==b)return d;d=g.value;return typeof d=="string"?d.replace(q,""):d==null?"":d}}}}),f.extend({valHooks:{option:{get:function(a){var b=a.attributes.value;return!b||b.specified?a.value:a.text}},select:{get:function(a){var b,c,d,e,g=a.selectedIndex,h=[],i=a.options,j=a.type==="select-one";if(g<0)return null;c=j?g:0,d=j?g+1:i.length;for(;c<d;c++){e=i[c];if(e.selected&&(f.support.optDisabled?!e.disabled:e.getAttribute("disabled")===null)&&(!e.parentNode.disabled||!f.nodeName(e.parentNode,"optgroup"))){b=f(e).val();if(j)return b;h.push(b)}}if(j&&!h.length&&i.length)return f(i[g]).val();return h},set:function(a,b){var c=f.makeArray(b);f(a).find("option").each(function(){this.selected=f.inArray(f(this).val(),c)>=0}),c.length||(a.selectedIndex=-1);return c}}},attrFn:{val:!0,css:!0,html:!0,text:!0,data:!0,width:!0,height:!0,offset:!0},attr:function(a,c,d,e){var g,h,i,j=a.nodeType;if(!!a&&j!==3&&j!==8&&j!==2){if(e&&c in f.attrFn)return f(a)[c](d);if(typeof a.getAttribute=="undefined")return f.prop(a,c,d);i=j!==1||!f.isXMLDoc(a),i&&(c=c.toLowerCase(),h=f.attrHooks[c]||(u.test(c)?x:w));if(d!==b){if(d===null){f.removeAttr(a,c);return}if(h&&"set"in h&&i&&(g=h.set(a,d,c))!==b)return g;a.setAttribute(c,""+d);return d}if(h&&"get"in h&&i&&(g=h.get(a,c))!==null)return g;g=a.getAttribute(c);return g===null?b:g}},removeAttr:function(a,b){var c,d,e,g,h,i=0;if(b&&a.nodeType===1){d=b.toLowerCase().split(p),g=d.length;for(;i<g;i++)e=d[i],e&&(c=f.propFix[e]||e,h=u.test(e),h||f.attr(a,e,""),a.removeAttribute(v?e:c),h&&c in a&&(a[c]=!1))}},attrHooks:{type:{set:function(a,b){if(r.test(a.nodeName)&&a.parentNode)f.error("type property can't be changed");else if(!f.support.radioValue&&b==="radio"&&f.nodeName(a,"input")){var c=a.value;a.setAttribute("type",b),c&&(a.value=c);return b}}},value:{get:function(a,b){if(w&&f.nodeName(a,"button"))return w.get(a,b);return b in a?a.value:null},set:function(a,b,c){if(w&&f.nodeName(a,"button"))return w.set(a,b,c);a.value=b}}},propFix:{tabindex:"tabIndex",readonly:"readOnly","for":"htmlFor","class":"className",maxlength:"maxLength",cellspacing:"cellSpacing",cellpadding:"cellPadding",rowspan:"rowSpan",colspan:"colSpan",usemap:"useMap",frameborder:"frameBorder",contenteditable:"contentEditable"},prop:function(a,c,d){var e,g,h,i=a.nodeType;if(!!a&&i!==3&&i!==8&&i!==2){h=i!==1||!f.isXMLDoc(a),h&&(c=f.propFix[c]||c,g=f.propHooks[c]);return d!==b?g&&"set"in g&&(e=g.set(a,d,c))!==b?e:a[c]=d:g&&"get"in g&&(e=g.get(a,c))!==null?e:a[c]}},propHooks:{tabIndex:{get:function(a){var c=a.getAttributeNode("tabindex");return c&&c.specified?parseInt(c.value,10):s.test(a.nodeName)||t.test(a.nodeName)&&a.href?0:b}}}}),f.attrHooks.tabindex=f.propHooks.tabIndex,x={get:function(a,c){var d,e=f.prop(a,c);return e===!0||typeof e!="boolean"&&(d=a.getAttributeNode(c))&&d.nodeValue!==!1?c.toLowerCase():b},set:function(a,b,c){var d;b===!1?f.removeAttr(a,c):(d=f.propFix[c]||c,d in a&&(a[d]=!0),a.setAttribute(c,c.toLowerCase()));return c}},v||(y={name:!0,id:!0,coords:!0},w=f.valHooks.button={get:function(a,c){var d;d=a.getAttributeNode(c);return d&&(y[c]?d.nodeValue!=="":d.specified)?d.nodeValue:b},set:function(a,b,d){var e=a.getAttributeNode(d);e||(e=c.createAttribute(d),a.setAttributeNode(e));return e.nodeValue=b+""}},f.attrHooks.tabindex.set=w.set,f.each(["width","height"],function(a,b){f.attrHooks[b]=f.extend(f.attrHooks[b],{set:function(a,c){if(c===""){a.setAttribute(b,"auto");return c}}})}),f.attrHooks.contenteditable={get:w.get,set:function(a,b,c){b===""&&(b="false"),w.set(a,b,c)}}),f.support.hrefNormalized||f.each(["href","src","width","height"],function(a,c){f.attrHooks[c]=f.extend(f.attrHooks[c],{get:function(a){var d=a.getAttribute(c,2);return d===null?b:d}})}),f.support.style||(f.attrHooks.style={get:function(a){return a.style.cssText.toLowerCase()||b},set:function(a,b){return a.style.cssText=""+b}}),f.support.optSelected||(f.propHooks.selected=f.extend(f.propHooks.selected,{get:function(a){var b=a.parentNode;b&&(b.selectedIndex,b.parentNode&&b.parentNode.selectedIndex);return null}})),f.support.enctype||(f.propFix.enctype="encoding"),f.support.checkOn||f.each(["radio","checkbox"],function(){f.valHooks[this]={get:function(a){return a.getAttribute("value")===null?"on":a.value}}}),f.each(["radio","checkbox"],function(){f.valHooks[this]=f.extend(f.valHooks[this],{set:function(a,b){if(f.isArray(b))return a.checked=f.inArray(f(a).val(),b)>=0}})});var z=/^(?:textarea|input|select)$/i,A=/^([^\.]*)?(?:\.(.+))?$/,B=/(?:^|\s)hover(\.\S+)?\b/,C=/^key/,D=/^(?:mouse|contextmenu)|click/,E=/^(?:focusinfocus|focusoutblur)$/,F=/^(\w*)(?:#([\w\-]+))?(?:\.([\w\-]+))?$/,G=function(
a){var b=F.exec(a);b&&(b[1]=(b[1]||"").toLowerCase(),b[3]=b[3]&&new RegExp("(?:^|\\s)"+b[3]+"(?:\\s|$)"));return b},H=function(a,b){var c=a.attributes||{};return(!b[1]||a.nodeName.toLowerCase()===b[1])&&(!b[2]||(c.id||{}).value===b[2])&&(!b[3]||b[3].test((c["class"]||{}).value))},I=function(a){return f.event.special.hover?a:a.replace(B,"mouseenter$1 mouseleave$1")};f.event={add:function(a,c,d,e,g){var h,i,j,k,l,m,n,o,p,q,r,s;if(!(a.nodeType===3||a.nodeType===8||!c||!d||!(h=f._data(a)))){d.handler&&(p=d,d=p.handler,g=p.selector),d.guid||(d.guid=f.guid++),j=h.events,j||(h.events=j={}),i=h.handle,i||(h.handle=i=function(a){return typeof f!="undefined"&&(!a||f.event.triggered!==a.type)?f.event.dispatch.apply(i.elem,arguments):b},i.elem=a),c=f.trim(I(c)).split(" ");for(k=0;k<c.length;k++){l=A.exec(c[k])||[],m=l[1],n=(l[2]||"").split(".").sort(),s=f.event.special[m]||{},m=(g?s.delegateType:s.bindType)||m,s=f.event.special[m]||{},o=f.extend({type:m,origType:l[1],data:e,handler:d,guid:d.guid,selector:g,quick:g&&G(g),namespace:n.join(".")},p),r=j[m];if(!r){r=j[m]=[],r.delegateCount=0;if(!s.setup||s.setup.call(a,e,n,i)===!1)a.addEventListener?a.addEventListener(m,i,!1):a.attachEvent&&a.attachEvent("on"+m,i)}s.add&&(s.add.call(a,o),o.handler.guid||(o.handler.guid=d.guid)),g?r.splice(r.delegateCount++,0,o):r.push(o),f.event.global[m]=!0}a=null}},global:{},remove:function(a,b,c,d,e){var g=f.hasData(a)&&f._data(a),h,i,j,k,l,m,n,o,p,q,r,s;if(!!g&&!!(o=g.events)){b=f.trim(I(b||"")).split(" ");for(h=0;h<b.length;h++){i=A.exec(b[h])||[],j=k=i[1],l=i[2];if(!j){for(j in o)f.event.remove(a,j+b[h],c,d,!0);continue}p=f.event.special[j]||{},j=(d?p.delegateType:p.bindType)||j,r=o[j]||[],m=r.length,l=l?new RegExp("(^|\\.)"+l.split(".").sort().join("\\.(?:.*\\.)?")+"(\\.|$)"):null;for(n=0;n<r.length;n++)s=r[n],(e||k===s.origType)&&(!c||c.guid===s.guid)&&(!l||l.test(s.namespace))&&(!d||d===s.selector||d==="**"&&s.selector)&&(r.splice(n--,1),s.selector&&r.delegateCount--,p.remove&&p.remove.call(a,s));r.length===0&&m!==r.length&&((!p.teardown||p.teardown.call(a,l)===!1)&&f.removeEvent(a,j,g.handle),delete o[j])}f.isEmptyObject(o)&&(q=g.handle,q&&(q.elem=null),f.removeData(a,["events","handle"],!0))}},customEvent:{getData:!0,setData:!0,changeData:!0},trigger:function(c,d,e,g){if(!e||e.nodeType!==3&&e.nodeType!==8){var h=c.type||c,i=[],j,k,l,m,n,o,p,q,r,s;if(E.test(h+f.event.triggered))return;h.indexOf("!")>=0&&(h=h.slice(0,-1),k=!0),h.indexOf(".")>=0&&(i=h.split("."),h=i.shift(),i.sort());if((!e||f.event.customEvent[h])&&!f.event.global[h])return;c=typeof c=="object"?c[f.expando]?c:new f.Event(h,c):new f.Event(h),c.type=h,c.isTrigger=!0,c.exclusive=k,c.namespace=i.join("."),c.namespace_re=c.namespace?new RegExp("(^|\\.)"+i.join("\\.(?:.*\\.)?")+"(\\.|$)"):null,o=h.indexOf(":")<0?"on"+h:"";if(!e){j=f.cache;for(l in j)j[l].events&&j[l].events[h]&&f.event.trigger(c,d,j[l].handle.elem,!0);return}c.result=b,c.target||(c.target=e),d=d!=null?f.makeArray(d):[],d.unshift(c),p=f.event.special[h]||{};if(p.trigger&&p.trigger.apply(e,d)===!1)return;r=[[e,p.bindType||h]];if(!g&&!p.noBubble&&!f.isWindow(e)){s=p.delegateType||h,m=E.test(s+h)?e:e.parentNode,n=null;for(;m;m=m.parentNode)r.push([m,s]),n=m;n&&n===e.ownerDocument&&r.push([n.defaultView||n.parentWindow||a,s])}for(l=0;l<r.length&&!c.isPropagationStopped();l++)m=r[l][0],c.type=r[l][1],q=(f._data(m,"events")||{})[c.type]&&f._data(m,"handle"),q&&q.apply(m,d),q=o&&m[o],q&&f.acceptData(m)&&q.apply(m,d)===!1&&c.preventDefault();c.type=h,!g&&!c.isDefaultPrevented()&&(!p._default||p._default.apply(e.ownerDocument,d)===!1)&&(h!=="click"||!f.nodeName(e,"a"))&&f.acceptData(e)&&o&&e[h]&&(h!=="focus"&&h!=="blur"||c.target.offsetWidth!==0)&&!f.isWindow(e)&&(n=e[o],n&&(e[o]=null),f.event.triggered=h,e[h](),f.event.triggered=b,n&&(e[o]=n));return c.result}},dispatch:function(c){c=f.event.fix(c||a.event);var d=(f._data(this,"events")||{})[c.type]||[],e=d.delegateCount,g=[].slice.call(arguments,0),h=!c.exclusive&&!c.namespace,i=f.event.special[c.type]||{},j=[],k,l,m,n,o,p,q,r,s,t,u;g[0]=c,c.delegateTarget=this;if(!i.preDispatch||i.preDispatch.call(this,c)!==!1){if(e&&(!c.button||c.type!=="click")){n=f(this),n.context=this.ownerDocument||this;for(m=c.target;m!=this;m=m.parentNode||this)if(m.disabled!==!0){p={},r=[],n[0]=m;for(k=0;k<e;k++)s=d[k],t=s.selector,p[t]===b&&(p[t]=s.quick?H(m,s.quick):n.is(t)),p[t]&&r.push(s);r.length&&j.push({elem:m,matches:r})}}d.length>e&&j.push({elem:this,matches:d.slice(e)});for(k=0;k<j.length&&!c.isPropagationStopped();k++){q=j[k],c.currentTarget=q.elem;for(l=0;l<q.matches.length&&!c.isImmediatePropagationStopped();l++){s=q.matches[l];if(h||!c.namespace&&!s.namespace||c.namespace_re&&c.namespace_re.test(s.namespace))c.data=s.data,c.handleObj=s,o=((f.event.special[s.origType]||{}).handle||s.handler).apply(q.elem,g),o!==b&&(c.result=o,o===!1&&(c.preventDefault(),c.stopPropagation()))}}i.postDispatch&&i.postDispatch.call(this,c);return c.result}},props:"attrChange attrName relatedNode srcElement altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){a.which==null&&(a.which=b.charCode!=null?b.charCode:b.keyCode);return a}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(a,d){var e,f,g,h=d.button,i=d.fromElement;a.pageX==null&&d.clientX!=null&&(e=a.target.ownerDocument||c,f=e.documentElement,g=e.body,a.pageX=d.clientX+(f&&f.scrollLeft||g&&g.scrollLeft||0)-(f&&f.clientLeft||g&&g.clientLeft||0),a.pageY=d.clientY+(f&&f.scrollTop||g&&g.scrollTop||0)-(f&&f.clientTop||g&&g.clientTop||0)),!a.relatedTarget&&i&&(a.relatedTarget=i===a.target?d.toElement:i),!a.which&&h!==b&&(a.which=h&1?1:h&2?3:h&4?2:0);return a}},fix:function(a){if(a[f.expando])return a;var d,e,g=a,h=f.event.fixHooks[a.type]||{},i=h.props?this.props.concat(h.props):this.props;a=f.Event(g);for(d=i.length;d;)e=i[--d],a[e]=g[e];a.target||(a.target=g.srcElement||c),a.target.nodeType===3&&(a.target=a.target.parentNode),a.metaKey===b&&(a.metaKey=a.ctrlKey);return h.filter?h.filter(a,g):a},special:{ready:{setup:f.bindReady},load:{noBubble:!0},focus:{delegateType:"focusin"},blur:{delegateType:"focusout"},beforeunload:{setup:function(a,b,c){f.isWindow(this)&&(this.onbeforeunload=c)},teardown:function(a,b){this.onbeforeunload===b&&(this.onbeforeunload=null)}}},simulate:function(a,b,c,d){var e=f.extend(new f.Event,c,{type:a,isSimulated:!0,originalEvent:{}});d?f.event.trigger(e,null,b):f.event.dispatch.call(b,e),e.isDefaultPrevented()&&c.preventDefault()}},f.event.handle=f.event.dispatch,f.removeEvent=c.removeEventListener?function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c,!1)}:function(a,b,c){a.detachEvent&&a.detachEvent("on"+b,c)},f.Event=function(a,b){if(!(this instanceof f.Event))return new f.Event(a,b);a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||a.returnValue===!1||a.getPreventDefault&&a.getPreventDefault()?K:J):this.type=a,b&&f.extend(this,b),this.timeStamp=a&&a.timeStamp||f.now(),this[f.expando]=!0},f.Event.prototype={preventDefault:function(){this.isDefaultPrevented=K;var a=this.originalEvent;!a||(a.preventDefault?a.preventDefault():a.returnValue=!1)},stopPropagation:function(){this.isPropagationStopped=K;var a=this.originalEvent;!a||(a.stopPropagation&&a.stopPropagation(),a.cancelBubble=!0)},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=K,this.stopPropagation()},isDefaultPrevented:J,isPropagationStopped:J,isImmediatePropagationStopped:J},f.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){f.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c=this,d=a.relatedTarget,e=a.handleObj,g=e.selector,h;if(!d||d!==c&&!f.contains(c,d))a.type=e.origType,h=e.handler.apply(this,arguments),a.type=b;return h}}}),f.support.submitBubbles||(f.event.special.submit={setup:function(){if(f.nodeName(this,"form"))return!1;f.event.add(this,"click._submit keypress._submit",function(a){var c=a.target,d=f.nodeName(c,"input")||f.nodeName(c,"button")?c.form:b;d&&!d._submit_attached&&(f.event.add(d,"submit._submit",function(a){a._submit_bubble=!0}),d._submit_attached=!0)})},postDispatch:function(a){a._submit_bubble&&(delete a._submit_bubble,this.parentNode&&!a.isTrigger&&f.event.simulate("submit",this.parentNode,a,!0))},teardown:function(){if(f.nodeName(this,"form"))return!1;f.event.remove(this,"._submit")}}),f.support.changeBubbles||(f.event.special.change={setup:function(){if(z.test(this.nodeName)){if(this.type==="checkbox"||this.type==="radio")f.event.add(this,"propertychange._change",function(a){a.originalEvent.propertyName==="checked"&&(this._just_changed=!0)}),f.event.add(this,"click._change",function(a){this._just_changed&&!a.isTrigger&&(this._just_changed=!1,f.event.simulate("change",this,a,!0))});return!1}f.event.add(this,"beforeactivate._change",function(a){var b=a.target;z.test(b.nodeName)&&!b._change_attached&&(f.event.add(b,"change._change",function(a){this.parentNode&&!a.isSimulated&&!a.isTrigger&&f.event.simulate("change",this.parentNode,a,!0)}),b._change_attached=!0)})},handle:function(a){var b=a.target;if(this!==b||a.isSimulated||a.isTrigger||b.type!=="radio"&&b.type!=="checkbox")return a.handleObj.handler.apply(this,arguments)},teardown:function(){f.event.remove(this,"._change");return z.test(this.nodeName)}}),f.support.focusinBubbles||f.each({focus:"focusin",blur:"focusout"},function(a,b){var d=0,e=function(a){f.event.simulate(b,a.target,f.event.fix(a),!0)};f.event.special[b]={setup:function(){d++===0&&c.addEventListener(a,e,!0)},teardown:function(){--d===0&&c.removeEventListener(a,e,!0)}}}),f.fn.extend({on:function(a,c,d,e,g){var h,i;if(typeof a=="object"){typeof c!="string"&&(d=d||c,c=b);for(i in a)this.on(i,c,d,a[i],g);return this}d==null&&e==null?(e=c,d=c=b):e==null&&(typeof c=="string"?(e=d,d=b):(e=d,d=c,c=b));if(e===!1)e=J;else if(!e)return this;g===1&&(h=e,e=function(a){f().off(a);return h.apply(this,arguments)},e.guid=h.guid||(h.guid=f.guid++));return this.each(function(){f.event.add(this,a,e,d,c)})},one:function(a,b,c,d){return this.on(a,b,c,d,1)},off:function(a,c,d){if(a&&a.preventDefault&&a.handleObj){var e=a.handleObj;f(a.delegateTarget).off(e.namespace?e.origType+"."+e.namespace:e.origType,e.selector,e.handler);return this}if(typeof a=="object"){for(var g in a)this.off(g,c,a[g]);return this}if(c===!1||typeof c=="function")d=c,c=b;d===!1&&(d=J);return this.each(function(){f.event.remove(this,a,d,c)})},bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},live:function(a,b,c){f(this.context).on(a,this.selector,b,c);return this},die:function(a,b){f(this.context).off(a,this.selector||"**",b);return this},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return arguments.length==1?this.off(a,"**"):this.off(b,a,c)},trigger:function(a,b){return this.each(function(){f.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0])return f.event.trigger(a,b,this[0],!0)},toggle:function(a){var b=arguments,c=a.guid||f.guid++,d=0,e=function(c){var e=(f._data(this,"lastToggle"+a.guid)||0)%d;f._data(this,"lastToggle"+a.guid,e+1),c.preventDefault();return b[e].apply(this,arguments)||!1};e.guid=c;while(d<b.length)b[d++].guid=c;return this.click(e)},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}}),f.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(a,b){f.fn[b]=function(a,c){c==null&&(c=a,a=null);return arguments.length>0?this.on(b,null,a,c):this.trigger(b)},f.attrFn&&(f.attrFn[b]=!0),C.test(b)&&(f.event.fixHooks[b]=f.event.keyHooks),D.test(b)&&(f.event.fixHooks[b]=f.event.mouseHooks)}),function(){function x(a,b,c,e,f,g){for(var h=0,i=e.length;h<i;h++){var j=e[h];if(j){var k=!1;j=j[a];while(j){if(j[d]===c){k=e[j.sizset];break}if(j.nodeType===1){g||(j[d]=c,j.sizset=h);if(typeof b!="string"){if(j===b){k=!0;break}}else if(m.filter(b,[j]).length>0){k=j;break}}j=j[a]}e[h]=k}}}function w(a,b,c,e,f,g){for(var h=0,i=e.length;h<i;h++){var j=e[h];if(j){var k=!1;j=j[a];while(j){if(j[d]===c){k=e[j.sizset];break}j.nodeType===1&&!g&&(j[d]=c,j.sizset=h);if(j.nodeName.toLowerCase()===b){k=j;break}j=j[a]}e[h]=k}}}var a=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,d="sizcache"+(Math.random()+"").replace(".",""),e=0,g=Object.prototype.toString,h=!1,i=!0,j=/\\/g,k=/\r\n/g,l=/\W/;[0,0].sort(function(){i=!1;return 0});var m=function(b,d,e,f){e=e||[],d=d||c;var h=d;if(d.nodeType!==1&&d.nodeType!==9)return[];if(!b||typeof b!="string")return e;var i,j,k,l,n,q,r,t,u=!0,v=m.isXML(d),w=[],x=b;do{a.exec(""),i=a.exec(x);if(i){x=i[3],w.push(i[1]);if(i[2]){l=i[3];break}}}while(i);if(w.length>1&&p.exec(b))if(w.length===2&&o.relative[w[0]])j=y(w[0]+w[1],d,f);else{j=o.relative[w[0]]?[d]:m(w.shift(),d);while(w.length)b=w.shift(),o.relative[b]&&(b+=w.shift()),j=y(b,j,f)}else{!f&&w.length>1&&d.nodeType===9&&!v&&o.match.ID.test(w[0])&&!o.match.ID.test(w[w.length-1])&&(n=m.find(w.shift(),d,v),d=n.expr?m.filter(n.expr,n.set)[0]:n.set[0]);if(d){n=f?{expr:w.pop(),set:s(f)}:m.find(w.pop(),w.length===1&&(w[0]==="~"||w[0]==="+")&&d.parentNode?d.parentNode:d,v),j=n.expr?m.filter(n.expr,n.set):n.set,w.length>0?k=s(j):u=!1;while(w.length)q=w.pop(),r=q,o.relative[q]?r=w.pop():q="",r==null&&(r=d),o.relative[q](k,r,v)}else k=w=[]}k||(k=j),k||m.error(q||b);if(g.call(k)==="[object Array]")if(!u)e.push.apply(e,k);else if(d&&d.nodeType===1)for(t=0;k[t]!=null;t++)k[t]&&(k[t]===!0||k[t].nodeType===1&&m.contains(d,k[t]))&&e.push(j[t]);else for(t=0;k[t]!=null;t++)k[t]&&k[t].nodeType===1&&e.push(j[t]);else s(k,e);l&&(m(l,h,e,f),m.uniqueSort(e));return e};m.uniqueSort=function(a){if(u){h=i,a.sort(u);if(h)for(var b=1;b<a.length;b++)a[b]===a[b-1]&&a.splice(b--,1)}return a},m.matches=function(a,b){return m(a,null,null,b)},m.matchesSelector=function(a,b){return m(b,null,null,[a]).length>0},m.find=function(a,b,c){var d,e,f,g,h,i;if(!a)return[];for(e=0,f=o.order.length;e<f;e++){h=o.order[e];if(g=o.leftMatch[h].exec(a)){i=g[1],g.splice(1,1);if(i.substr(i.length-1)!=="\\"){g[1]=(g[1]||"").replace(j,""),d=o.find[h](g,b,c);if(d!=null){a=a.replace(o.match[h],"");break}}}}d||(d=typeof b.getElementsByTagName!="undefined"?b.getElementsByTagName("*"):[]);return{set:d,expr:a}},m.filter=function(a,c,d,e){var f,g,h,i,j,k,l,n,p,q=a,r=[],s=c,t=c&&c[0]&&m.isXML(c[0]);while(a&&c.length){for(h in o.filter)if((f=o.leftMatch[h].exec(a))!=null&&f[2]){k=o.filter[h],l=f[1],g=!1,f.splice(1,1);if(l.substr(l.length-1)==="\\")continue;s===r&&(r=[]);if(o.preFilter[h]){f=o.preFilter[h](f,s,d,r,e,t);if(!f)g=i=!0;else if(f===!0)continue}if(f)for(n=0;(j=s[n])!=null;n++)j&&(i=k(j,f,n,s),p=e^i,d&&i!=null?p?g=!0:s[n]=!1:p&&(r.push(j),g=!0));if(i!==b){d||(s=r),a=a.replace(o.match[h],"");if(!g)return[];break}}if(a===q)if(g==null)m.error(a);else break;q=a}return s},m.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)};var n=m.getText=function(a){var b,c,d=a.nodeType,e="";if(d){if(d===1||d===9||d===11){if(typeof a.textContent=="string")return a.textContent;if(typeof a.innerText=="string")return a.innerText.replace(k,"");for(a=a.firstChild;a;a=a.nextSibling)e+=n(a)}else if(d===3||d===4)return a.nodeValue}else for(b=0;c=a[b];b++)c.nodeType!==8&&(e+=n(c));return e},o=m.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,CLASS:/\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(?:(['"])(.*?)\3|(#?(?:[\w\u00c0-\uFFFF\-]|\\.)*)|)|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\(\s*(even|odd|(?:[+\-]?\d+|(?:[+\-]?\d*)?n\s*(?:[+\-]\s*\d+)?))\s*\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(a){return a.getAttribute("href")},type:function(a){return a.getAttribute("type")}},relative:{"+":function(a,b){var c=typeof b=="string",d=c&&!l.test(b),e=c&&!d;d&&(b=b.toLowerCase());for(var f=0,g=a.length,h;f<g;f++)if(h=a[f]){while((h=h.previousSibling)&&h.nodeType!==1);a[f]=e||h&&h.nodeName.toLowerCase()===b?h||!1:h===b}e&&m.filter(b,a,!0)},">":function(a,b){var c,d=typeof b=="string",e=0,f=a.length;if(d&&!l.test(b)){b=b.toLowerCase();for(;e<f;e++){c=a[e];if(c){var g=c.parentNode;a[e]=g.nodeName.toLowerCase()===b?g:!1}}}else{for(;e<f;e++)c=a[e],c&&(a[e]=d?c.parentNode:c.parentNode===b);d&&m.filter(b,a,!0)}},"":function(a,b,c){var d,f=e++,g=x;typeof b=="string"&&!l.test(b)&&(b=b.toLowerCase(),d=b,g=w),g("parentNode",b,f,a,d,c)},"~":function(a,b,c){var d,f=e++,g=x;typeof b=="string"&&!l.test(b)&&(b=b.toLowerCase(),d=b,g=w),g("previousSibling",b,f,a,d,c)}},find:{ID:function(a,b,c){if(typeof b.getElementById!="undefined"&&!c){var d=b.getElementById(a[1]);return d&&d.parentNode?[d]:[]}},NAME:function(a,b){if(typeof b.getElementsByName!="undefined"){var c=[],d=b.getElementsByName(a[1]);for(var e=0,f=d.length;e<f;e++)d[e].getAttribute("name")===a[1]&&c.push(d[e]);return c.length===0?null:c}},TAG:function(a,b){if(typeof b.getElementsByTagName!="undefined")return b.getElementsByTagName(a[1])}},preFilter:{CLASS:function(a,b,c,d,e,f){a=" "+a[1].replace(j,"")+" ";if(f)return a;for(var g=0,h;(h=b[g])!=null;g++)h&&(e^(h.className&&(" "+h.className+" ").replace(/[\t\n\r]/g," ").indexOf(a)>=0)?c||d.push(h):c&&(b[g]=!1));return!1},ID:function(a){return a[1].replace(j,"")},TAG:function(a,b){return a[1].replace(j,"").toLowerCase()},CHILD:function(a){if(a[1]==="nth"){a[2]||m.error(a[0]),a[2]=a[2].replace(/^\+|\s*/g,"");var b=/(-?)(\d*)(?:n([+\-]?\d*))?/.exec(a[2]==="even"&&"2n"||a[2]==="odd"&&"2n+1"||!/\D/.test(a[2])&&"0n+"+a[2]||a[2]);a[2]=b[1]+(b[2]||1)-0,a[3]=b[3]-0}else a[2]&&m.error(a[0]);a[0]=e++;return a},ATTR:function(a,b,c,d,e,f){var g=a[1]=a[1].replace(j,"");!f&&o.attrMap[g]&&(a[1]=o.attrMap[g]),a[4]=(a[4]||a[5]||"").replace(j,""),a[2]==="~="&&(a[4]=" "+a[4]+" ");return a},PSEUDO:function(b,c,d,e,f){if(b[1]==="not")if((a.exec(b[3])||"").length>1||/^\w/.test(b[3]))b[3]=m(b[3],null,null,c);else{var g=m.filter(b[3],c,d,!0^f);d||e.push.apply(e,g);return!1}else if(o.match.POS.test(b[0])||o.match.CHILD.test(b[0]))return!0;return b},POS:function(a){a.unshift(!0);return a}},filters:{enabled:function(a){return a.disabled===!1&&a.type!=="hidden"},disabled:function(a){return a.disabled===!0},checked:function(a){return a.checked===!0},selected:function(a){a.parentNode&&a.parentNode.selectedIndex;return a.selected===!0},parent:function(a){return!!a.firstChild},empty:function(a){return!a.firstChild},has:function(a,b,c){return!!m(c[3],a).length},header:function(a){return/h\d/i.test(a.nodeName)},text:function(a){var b=a.getAttribute("type"),c=a.type;return a.nodeName.toLowerCase()==="input"&&"text"===c&&(b===c||b===null)},radio:function(a){return a.nodeName.toLowerCase()==="input"&&"radio"===a.type},checkbox:function(a){return a.nodeName.toLowerCase()==="input"&&"checkbox"===a.type},file:function(a){return a.nodeName.toLowerCase()==="input"&&"file"===a.type},password:function(a){return a.nodeName.toLowerCase()==="input"&&"password"===a.type},submit:function(a){var b=a.nodeName.toLowerCase();return(b==="input"||b==="button")&&"submit"===a.type},image:function(a){return a.nodeName.toLowerCase()==="input"&&"image"===a.type},reset:function(a){var b=a.nodeName.toLowerCase();return(b==="input"||b==="button")&&"reset"===a.type},button:function(a){var b=a.nodeName.toLowerCase();return b==="input"&&"button"===a.type||b==="button"},input:function(a){return/input|select|textarea|button/i.test(a.nodeName)},focus:function(a){return a===a.ownerDocument.activeElement}},setFilters:{first:function(a,b){return b===0},last:function(a,b,c,d){return b===d.length-1},even:function(a,b){return b%2===0},odd:function(a,b){return b%2===1},lt:function(a,b,c){return b<c[3]-0},gt:function(a,b,c){return b>c[3]-0},nth:function(a,b,c){return c[3]-0===b},eq:function(a,b,c){return c[3]-0===b}},filter:{PSEUDO:function(a,b,c,d){var e=b[1],f=o.filters[e];if(f)return f(a,c,b,d);if(e==="contains")return(a.textContent||a.innerText||n([a])||"").indexOf(b[3])>=0;if(e==="not"){var g=b[3];for(var h=0,i=g.length;h<i;h++)if(g[h]===a)return!1;return!0}m.error(e)},CHILD:function(a,b){var c,e,f,g,h,i,j,k=b[1],l=a;switch(k){case"only":case"first":while(l=l.previousSibling)if(l.nodeType===1)return!1;if(k==="first")return!0;l=a;case"last":while(l=l.nextSibling)if(l.nodeType===1)return!1;return!0;case"nth":c=b[2],e=b[3];if(c===1&&e===0)return!0;f=b[0],g=a.parentNode;if(g&&(g[d]!==f||!a.nodeIndex)){i=0;for(l=g.firstChild;l;l=l.nextSibling)l.nodeType===1&&(l.nodeIndex=++i);g[d]=f}j=a.nodeIndex-e;return c===0?j===0:j%c===0&&j/c>=0}},ID:function(a,b){return a.nodeType===1&&a.getAttribute("id")===b},TAG:function(a,b){return b==="*"&&a.nodeType===1||!!a.nodeName&&a.nodeName.toLowerCase()===b},CLASS:function(a,b){return(" "+(a.className||a.getAttribute("class"))+" ").indexOf(b)>-1},ATTR:function(a,b){var c=b[1],d=m.attr?m.attr(a,c):o.attrHandle[c]?o.attrHandle[c](a):a[c]!=null?a[c]:a.getAttribute(c),e=d+"",f=b[2],g=b[4];return d==null?f==="!=":!f&&m.attr?d!=null:f==="="?e===g:f==="*="?e.indexOf(g)>=0:f==="~="?(" "+e+" ").indexOf(g)>=0:g?f==="!="?e!==g:f==="^="?e.indexOf(g)===0:f==="$="?e.substr(e.length-g.length)===g:f==="|="?e===g||e.substr(0,g.length+1)===g+"-":!1:e&&d!==!1},POS:function(a,b,c,d){var e=b[2],f=o.setFilters[e];if(f)return f(a,c,b,d)}}},p=o.match.POS,q=function(a,b){return"\\"+(b-0+1)};for(var r in o.match)o.match[r]=new RegExp(o.match[r].source+/(?![^\[]*\])(?![^\(]*\))/.source),o.leftMatch[r]=new RegExp(/(^(?:.|\r|\n)*?)/.source+o.match[r].source.replace(/\\(\d+)/g,q));o.match.globalPOS=p;var s=function(a,b){a=Array.prototype.slice.call(a,0);if(b){b.push.apply(b,a);return b}return a};try{Array.prototype.slice.call(c.documentElement.childNodes,0)[0].nodeType}catch(t){s=function(a,b){var c=0,d=b||[];if(g.call(a)==="[object Array]")Array.prototype.push.apply(d,a);else if(typeof a.length=="number")for(var e=a.length;c<e;c++)d.push(a[c]);else for(;a[c];c++)d.push(a[c]);return d}}var u,v;c.documentElement.compareDocumentPosition?u=function(a,b){if(a===b){h=!0;return 0}if(!a.compareDocumentPosition||!b.compareDocumentPosition)return a.compareDocumentPosition?-1:1;return a.compareDocumentPosition(b)&4?-1:1}:(u=function(a,b){if(a===b){h=!0;return 0}if(a.sourceIndex&&b.sourceIndex)return a.sourceIndex-b.sourceIndex;var c,d,e=[],f=[],g=a.parentNode,i=b.parentNode,j=g;if(g===i)return v(a,b);if(!g)return-1;if(!i)return 1;while(j)e.unshift(j),j=j.parentNode;j=i;while(j)f.unshift(j),j=j.parentNode;c=e.length,d=f.length;for(var k=0;k<c&&k<d;k++)if(e[k]!==f[k])return v(e[k],f[k]);return k===c?v(a,f[k],-1):v(e[k],b,1)},v=function(a,b,c){if(a===b)return c;var d=a.nextSibling;while(d){if(d===b)return-1;d=d.nextSibling}return 1}),function(){var a=c.createElement("div"),d="script"+(new Date).getTime(),e=c.documentElement;a.innerHTML="<a name='"+d+"'/>",e.insertBefore(a,e.firstChild),c.getElementById(d)&&(o.find.ID=function(a,c,d){if(typeof c.getElementById!="undefined"&&!d){var e=c.getElementById(a[1]);return e?e.id===a[1]||typeof e.getAttributeNode!="undefined"&&e.getAttributeNode("id").nodeValue===a[1]?[e]:b:[]}},o.filter.ID=function(a,b){var c=typeof a.getAttributeNode!="undefined"&&a.getAttributeNode("id");return a.nodeType===1&&c&&c.nodeValue===b}),e.removeChild(a),e=a=null}(),function(){var a=c.createElement("div");a.appendChild(c.createComment("")),a.getElementsByTagName("*").length>0&&(o.find.TAG=function(a,b){var c=b.getElementsByTagName(a[1]);if(a[1]==="*"){var d=[];for(var e=0;c[e];e++)c[e].nodeType===1&&d.push(c[e]);c=d}return c}),a.innerHTML="<a href='#'></a>",a.firstChild&&typeof a.firstChild.getAttribute!="undefined"&&a.firstChild.getAttribute("href")!=="#"&&(o.attrHandle.href=function(a){return a.getAttribute("href",2)}),a=null}(),c.querySelectorAll&&function(){var a=m,b=c.createElement("div"),d="__sizzle__";b.innerHTML="<p class='TEST'></p>";if(!b.querySelectorAll||b.querySelectorAll(".TEST").length!==0){m=function(b,e,f,g){e=e||c;if(!g&&!m.isXML(e)){var h=/^(\w+$)|^\.([\w\-]+$)|^#([\w\-]+$)/.exec(b);if(h&&(e.nodeType===1||e.nodeType===9)){if(h[1])return s(e.getElementsByTagName(b),f);if(h[2]&&o.find.CLASS&&e.getElementsByClassName)return s(e.getElementsByClassName(h[2]),f)}if(e.nodeType===9){if(b==="body"&&e.body)return s([e.body],f);if(h&&h[3]){var i=e.getElementById(h[3]);if(!i||!i.parentNode)return s([],f);if(i.id===h[3])return s([i],f)}try{return s(e.querySelectorAll(b),f)}catch(j){}}else if(e.nodeType===1&&e.nodeName.toLowerCase()!=="object"){var k=e,l=e.getAttribute("id"),n=l||d,p=e.parentNode,q=/^\s*[+~]/.test(b);l?n=n.replace(/'/g,"\\$&"):e.setAttribute("id",n),q&&p&&(e=e.parentNode);try{if(!q||p)return s(e.querySelectorAll("[id='"+n+"'] "+b),f)}catch(r){}finally{l||k.removeAttribute("id")}}}return a(b,e,f,g)};for(var e in a)m[e]=a[e];b=null}}(),function(){var a=c.documentElement,b=a.matchesSelector||a.mozMatchesSelector||a.webkitMatchesSelector||a.msMatchesSelector;if(b){var d=!b.call(c.createElement("div"),"div"),e=!1;try{b.call(c.documentElement,"[test!='']:sizzle")}catch(f){e=!0}m.matchesSelector=function(a,c){c=c.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");if(!m.isXML(a))try{if(e||!o.match.PSEUDO.test(c)&&!/!=/.test(c)){var f=b.call(a,c);if(f||!d||a.document&&a.document.nodeType!==11)return f}}catch(g){}return m(c,null,null,[a]).length>0}}}(),function(){var a=c.createElement("div");a.innerHTML="<div class='test e'></div><div class='test'></div>";if(!!a.getElementsByClassName&&a.getElementsByClassName("e").length!==0){a.lastChild.className="e";if(a.getElementsByClassName("e").length===1)return;o.order.splice(1,0,"CLASS"),o.find.CLASS=function(a,b,c){if(typeof b.getElementsByClassName!="undefined"&&!c)return b.getElementsByClassName(a[1])},a=null}}(),c.documentElement.contains?m.contains=function(a,b){return a!==b&&(a.contains?a.contains(b):!0)}:c.documentElement.compareDocumentPosition?m.contains=function(a,b){return!!(a.compareDocumentPosition(b)&16)}:m.contains=function(){return!1},m.isXML=function(a){var b=(a?a.ownerDocument||a:0).documentElement;return b?b.nodeName!=="HTML":!1};var y=function(a,b,c){var d,e=[],f="",g=b.nodeType?[b]:b;while(d=o.match.PSEUDO.exec(a))f+=d[0],a=a.replace(o.match.PSEUDO,"");a=o.relative[a]?a+"*":a;for(var h=0,i=g.length;h<i;h++)m(a,g[h],e,c);return m.filter(f,e)};m.attr=f.attr,m.selectors.attrMap={},f.find=m,f.expr=m.selectors,f.expr[":"]=f.expr.filters,f.unique=m.uniqueSort,f.text=m.getText,f.isXMLDoc=m.isXML,f.contains=m.contains}();var L=/Until$/,M=/^(?:parents|prevUntil|prevAll)/,N=/,/,O=/^.[^:#\[\.,]*$/,P=Array.prototype.slice,Q=f.expr.match.globalPOS,R={children:!0,contents:!0,next:!0,prev:!0};f.fn.extend({find:function(a){var b=this,c,d;if(typeof a!="string")return f(a).filter(function(){for(c=0,d=b.length;c<d;c++)if(f.contains(b[c],this))return!0});var e=this.pushStack("","find",a),g,h,i;for(c=0,d=this.length;c<d;c++){g=e.length,f.find(a,this[c],e);if(c>0)for(h=g;h<e.length;h++)for(i=0;i<g;i++)if(e[i]===e[h]){e.splice(h--,1);break}}return e},has:function(a){var b=f(a);return this.filter(function(){for(var a=0,c=b.length;a<c;a++)if(f.contains(this,b[a]))return!0})},not:function(a){return this.pushStack(T(this,a,!1),"not",a)},filter:function(a){return this.pushStack(T(this,a,!0),"filter",a)},is:function(a){return!!a&&(typeof a=="string"?Q.test(a)?f(a,this.context).index(this[0])>=0:f.filter(a,this).length>0:this.filter(a).length>0)},closest:function(a,b){var c=[],d,e,g=this[0];if(f.isArray(a)){var h=1;while(g&&g.ownerDocument&&g!==b){for(d=0;d<a.length;d++)f(g).is(a[d])&&c.push({selector:a[d],elem:g,level:h});g=g.parentNode,h++}return c}var i=Q.test(a)||typeof a!="string"?f(a,b||this.context):0;for(d=0,e=this.length;d<e;d++){g=this[d];while(g){if(i?i.index(g)>-1:f.find.matchesSelector(g,a)){c.push(g);break}g=g.parentNode;if(!g||!g.ownerDocument||g===b||g.nodeType===11)break}}c=c.length>1?f.unique(c):c;return this.pushStack(c,"closest",a)},index:function(a){if(!a)return this[0]&&this[0].parentNode?this.prevAll().length:-1;if(typeof a=="string")return f.inArray(this[0],f(a));return f.inArray(a.jquery?a[0]:a,this)},add:function(a,b){var c=typeof a=="string"?f(a,b):f.makeArray(a&&a.nodeType?[a]:a),d=f.merge(this.get(),c);return this.pushStack(S(c[0])||S(d[0])?d:f.unique(d))},andSelf:function(){return this.add(this.prevObject)}}),f.each({parent:function(a){var b=a.parentNode;return b&&b.nodeType!==11?b:null},parents:function(a){return f.dir(a,"parentNode")},parentsUntil:function(a,b,c){return f.dir(a,"parentNode",c)},next:function(a){return f.nth(a,2,"nextSibling")},prev:function(a){return f.nth(a,2,"previousSibling")},nextAll:function(a){return f.dir(a,"nextSibling")},prevAll:function(a){return f.dir(a,"previousSibling")},nextUntil:function(a,b,c){return f.dir(a,"nextSibling",c)},prevUntil:function(a,b,c){return f.dir(a,"previousSibling",c)},siblings:function(a){return f.sibling((a.parentNode||{}).firstChild,a)},children:function(a){return f.sibling(a.firstChild)},contents:function(a){return f.nodeName(a,"iframe")?a.contentDocument||a.contentWindow.document:f.makeArray(a.childNodes)}},function(a,b){f.fn[a]=function(c,d){var e=f.map(this,b,c);L.test(a)||(d=c),d&&typeof d=="string"&&(e=f.filter(d,e)),e=this.length>1&&!R[a]?f.unique(e):e,(this.length>1||N.test(d))&&M.test(a)&&(e=e.reverse());return this.pushStack(e,a,P.call(arguments).join(","))}}),f.extend({filter:function(a,b,c){c&&(a=":not("+a+")");return b.length===1?f.find.matchesSelector(b[0],a)?[b[0]]:[]:f.find.matches(a,b)},dir:function(a,c,d){var e=[],g=a[c];while(g&&g.nodeType!==9&&(d===b||g.nodeType!==1||!f(g).is(d)))g.nodeType===1&&e.push(g),g=g[c];return e},nth:function(a,b,c,d){b=b||1;var e=0;for(;a;a=a[c])if(a.nodeType===1&&++e===b)break;return a},sibling:function(a,b){var c=[];for(;a;a=a.nextSibling)a.nodeType===1&&a!==b&&c.push(a);return c}});var V="abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",W=/ jQuery\d+="(?:\d+|null)"/g,X=/^\s+/,Y=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/ig,Z=/<([\w:]+)/,$=/<tbody/i,_=/<|&#?\w+;/,ba=/<(?:script|style)/i,bb=/<(?:script|object|embed|option|style)/i,bc=new RegExp("<(?:"+V+")[\\s/>]","i"),bd=/checked\s*(?:[^=]|=\s*.checked.)/i,be=/\/(java|ecma)script/i,bf=/^\s*<!(?:\[CDATA\[|\-\-)/,bg={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]},bh=U(c);bg.optgroup=bg.option,bg.tbody=bg.tfoot=bg.colgroup=bg.caption=bg.thead,bg.th=bg.td,f.support.htmlSerialize||(bg._default=[1,"div<div>","</div>"]),f.fn.extend({text:function(a){return f.access(this,function(a){return a===b?f.text(this):this.empty().append((this[0]&&this[0].ownerDocument||c).createTextNode(a))},null,a,arguments.length)},wrapAll:function(a){if(f.isFunction(a))return this.each(function(b){f(this).wrapAll(a.call(this,b))});if(this[0]){var b=f(a,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstChild&&a.firstChild.nodeType===1)a=a.firstChild;return a}).append(this)}return this},wrapInner:function(a){if(f.isFunction(a))return this.each(function(b){f(this).wrapInner(a.call(this,b))});return this.each(function(){var b=f(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=f.isFunction(a);return this.each(function(c){f(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(){return this.parent().each(function(){f.nodeName(this,"body")||f(this).replaceWith(this.childNodes)}).end()},append:function(){return this.domManip(arguments,!0,function(a){this.nodeType===1&&this.appendChild(a)})},prepend:function(){return this.domManip(arguments,!0,function(a){this.nodeType===1&&this.insertBefore(a,this.firstChild)})},before:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this)});if(arguments.length){var a=f
.clean(arguments);a.push.apply(a,this.toArray());return this.pushStack(a,"before",arguments)}},after:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this.nextSibling)});if(arguments.length){var a=this.pushStack(this,"after",arguments);a.push.apply(a,f.clean(arguments));return a}},remove:function(a,b){for(var c=0,d;(d=this[c])!=null;c++)if(!a||f.filter(a,[d]).length)!b&&d.nodeType===1&&(f.cleanData(d.getElementsByTagName("*")),f.cleanData([d])),d.parentNode&&d.parentNode.removeChild(d);return this},empty:function(){for(var a=0,b;(b=this[a])!=null;a++){b.nodeType===1&&f.cleanData(b.getElementsByTagName("*"));while(b.firstChild)b.removeChild(b.firstChild)}return this},clone:function(a,b){a=a==null?!1:a,b=b==null?a:b;return this.map(function(){return f.clone(this,a,b)})},html:function(a){return f.access(this,function(a){var c=this[0]||{},d=0,e=this.length;if(a===b)return c.nodeType===1?c.innerHTML.replace(W,""):null;if(typeof a=="string"&&!ba.test(a)&&(f.support.leadingWhitespace||!X.test(a))&&!bg[(Z.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(Y,"<$1></$2>");try{for(;d<e;d++)c=this[d]||{},c.nodeType===1&&(f.cleanData(c.getElementsByTagName("*")),c.innerHTML=a);c=0}catch(g){}}c&&this.empty().append(a)},null,a,arguments.length)},replaceWith:function(a){if(this[0]&&this[0].parentNode){if(f.isFunction(a))return this.each(function(b){var c=f(this),d=c.html();c.replaceWith(a.call(this,b,d))});typeof a!="string"&&(a=f(a).detach());return this.each(function(){var b=this.nextSibling,c=this.parentNode;f(this).remove(),b?f(b).before(a):f(c).append(a)})}return this.length?this.pushStack(f(f.isFunction(a)?a():a),"replaceWith",a):this},detach:function(a){return this.remove(a,!0)},domManip:function(a,c,d){var e,g,h,i,j=a[0],k=[];if(!f.support.checkClone&&arguments.length===3&&typeof j=="string"&&bd.test(j))return this.each(function(){f(this).domManip(a,c,d,!0)});if(f.isFunction(j))return this.each(function(e){var g=f(this);a[0]=j.call(this,e,c?g.html():b),g.domManip(a,c,d)});if(this[0]){i=j&&j.parentNode,f.support.parentNode&&i&&i.nodeType===11&&i.childNodes.length===this.length?e={fragment:i}:e=f.buildFragment(a,this,k),h=e.fragment,h.childNodes.length===1?g=h=h.firstChild:g=h.firstChild;if(g){c=c&&f.nodeName(g,"tr");for(var l=0,m=this.length,n=m-1;l<m;l++)d.call(c?bi(this[l],g):this[l],e.cacheable||m>1&&l<n?f.clone(h,!0,!0):h)}k.length&&f.each(k,function(a,b){b.src?f.ajax({type:"GET",global:!1,url:b.src,async:!1,dataType:"script"}):f.globalEval((b.text||b.textContent||b.innerHTML||"").replace(bf,"/*$0*/")),b.parentNode&&b.parentNode.removeChild(b)})}return this}}),f.buildFragment=function(a,b,d){var e,g,h,i,j=a[0];b&&b[0]&&(i=b[0].ownerDocument||b[0]),i.createDocumentFragment||(i=c),a.length===1&&typeof j=="string"&&j.length<512&&i===c&&j.charAt(0)==="<"&&!bb.test(j)&&(f.support.checkClone||!bd.test(j))&&(f.support.html5Clone||!bc.test(j))&&(g=!0,h=f.fragments[j],h&&h!==1&&(e=h)),e||(e=i.createDocumentFragment(),f.clean(a,i,e,d)),g&&(f.fragments[j]=h?e:1);return{fragment:e,cacheable:g}},f.fragments={},f.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){f.fn[a]=function(c){var d=[],e=f(c),g=this.length===1&&this[0].parentNode;if(g&&g.nodeType===11&&g.childNodes.length===1&&e.length===1){e[b](this[0]);return this}for(var h=0,i=e.length;h<i;h++){var j=(h>0?this.clone(!0):this).get();f(e[h])[b](j),d=d.concat(j)}return this.pushStack(d,a,e.selector)}}),f.extend({clone:function(a,b,c){var d,e,g,h=f.support.html5Clone||f.isXMLDoc(a)||!bc.test("<"+a.nodeName+">")?a.cloneNode(!0):bo(a);if((!f.support.noCloneEvent||!f.support.noCloneChecked)&&(a.nodeType===1||a.nodeType===11)&&!f.isXMLDoc(a)){bk(a,h),d=bl(a),e=bl(h);for(g=0;d[g];++g)e[g]&&bk(d[g],e[g])}if(b){bj(a,h);if(c){d=bl(a),e=bl(h);for(g=0;d[g];++g)bj(d[g],e[g])}}d=e=null;return h},clean:function(a,b,d,e){var g,h,i,j=[];b=b||c,typeof b.createElement=="undefined"&&(b=b.ownerDocument||b[0]&&b[0].ownerDocument||c);for(var k=0,l;(l=a[k])!=null;k++){typeof l=="number"&&(l+="");if(!l)continue;if(typeof l=="string")if(!_.test(l))l=b.createTextNode(l);else{l=l.replace(Y,"<$1></$2>");var m=(Z.exec(l)||["",""])[1].toLowerCase(),n=bg[m]||bg._default,o=n[0],p=b.createElement("div"),q=bh.childNodes,r;b===c?bh.appendChild(p):U(b).appendChild(p),p.innerHTML=n[1]+l+n[2];while(o--)p=p.lastChild;if(!f.support.tbody){var s=$.test(l),t=m==="table"&&!s?p.firstChild&&p.firstChild.childNodes:n[1]==="<table>"&&!s?p.childNodes:[];for(i=t.length-1;i>=0;--i)f.nodeName(t[i],"tbody")&&!t[i].childNodes.length&&t[i].parentNode.removeChild(t[i])}!f.support.leadingWhitespace&&X.test(l)&&p.insertBefore(b.createTextNode(X.exec(l)[0]),p.firstChild),l=p.childNodes,p&&(p.parentNode.removeChild(p),q.length>0&&(r=q[q.length-1],r&&r.parentNode&&r.parentNode.removeChild(r)))}var u;if(!f.support.appendChecked)if(l[0]&&typeof (u=l.length)=="number")for(i=0;i<u;i++)bn(l[i]);else bn(l);l.nodeType?j.push(l):j=f.merge(j,l)}if(d){g=function(a){return!a.type||be.test(a.type)};for(k=0;j[k];k++){h=j[k];if(e&&f.nodeName(h,"script")&&(!h.type||be.test(h.type)))e.push(h.parentNode?h.parentNode.removeChild(h):h);else{if(h.nodeType===1){var v=f.grep(h.getElementsByTagName("script"),g);j.splice.apply(j,[k+1,0].concat(v))}d.appendChild(h)}}}return j},cleanData:function(a){var b,c,d=f.cache,e=f.event.special,g=f.support.deleteExpando;for(var h=0,i;(i=a[h])!=null;h++){if(i.nodeName&&f.noData[i.nodeName.toLowerCase()])continue;c=i[f.expando];if(c){b=d[c];if(b&&b.events){for(var j in b.events)e[j]?f.event.remove(i,j):f.removeEvent(i,j,b.handle);b.handle&&(b.handle.elem=null)}g?delete i[f.expando]:i.removeAttribute&&i.removeAttribute(f.expando),delete d[c]}}}});var bp=/alpha\([^)]*\)/i,bq=/opacity=([^)]*)/,br=/([A-Z]|^ms)/g,bs=/^[\-+]?(?:\d*\.)?\d+$/i,bt=/^-?(?:\d*\.)?\d+(?!px)[^\d\s]+$/i,bu=/^([\-+])=([\-+.\de]+)/,bv=/^margin/,bw={position:"absolute",visibility:"hidden",display:"block"},bx=["Top","Right","Bottom","Left"],by,bz,bA;f.fn.css=function(a,c){return f.access(this,function(a,c,d){return d!==b?f.style(a,c,d):f.css(a,c)},a,c,arguments.length>1)},f.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=by(a,"opacity");return c===""?"1":c}return a.style.opacity}}},cssNumber:{fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":f.support.cssFloat?"cssFloat":"styleFloat"},style:function(a,c,d,e){if(!!a&&a.nodeType!==3&&a.nodeType!==8&&!!a.style){var g,h,i=f.camelCase(c),j=a.style,k=f.cssHooks[i];c=f.cssProps[i]||i;if(d===b){if(k&&"get"in k&&(g=k.get(a,!1,e))!==b)return g;return j[c]}h=typeof d,h==="string"&&(g=bu.exec(d))&&(d=+(g[1]+1)*+g[2]+parseFloat(f.css(a,c)),h="number");if(d==null||h==="number"&&isNaN(d))return;h==="number"&&!f.cssNumber[i]&&(d+="px");if(!k||!("set"in k)||(d=k.set(a,d))!==b)try{j[c]=d}catch(l){}}},css:function(a,c,d){var e,g;c=f.camelCase(c),g=f.cssHooks[c],c=f.cssProps[c]||c,c==="cssFloat"&&(c="float");if(g&&"get"in g&&(e=g.get(a,!0,d))!==b)return e;if(by)return by(a,c)},swap:function(a,b,c){var d={},e,f;for(f in b)d[f]=a.style[f],a.style[f]=b[f];e=c.call(a);for(f in b)a.style[f]=d[f];return e}}),f.curCSS=f.css,c.defaultView&&c.defaultView.getComputedStyle&&(bz=function(a,b){var c,d,e,g,h=a.style;b=b.replace(br,"-$1").toLowerCase(),(d=a.ownerDocument.defaultView)&&(e=d.getComputedStyle(a,null))&&(c=e.getPropertyValue(b),c===""&&!f.contains(a.ownerDocument.documentElement,a)&&(c=f.style(a,b))),!f.support.pixelMargin&&e&&bv.test(b)&&bt.test(c)&&(g=h.width,h.width=c,c=e.width,h.width=g);return c}),c.documentElement.currentStyle&&(bA=function(a,b){var c,d,e,f=a.currentStyle&&a.currentStyle[b],g=a.style;f==null&&g&&(e=g[b])&&(f=e),bt.test(f)&&(c=g.left,d=a.runtimeStyle&&a.runtimeStyle.left,d&&(a.runtimeStyle.left=a.currentStyle.left),g.left=b==="fontSize"?"1em":f,f=g.pixelLeft+"px",g.left=c,d&&(a.runtimeStyle.left=d));return f===""?"auto":f}),by=bz||bA,f.each(["height","width"],function(a,b){f.cssHooks[b]={get:function(a,c,d){if(c)return a.offsetWidth!==0?bB(a,b,d):f.swap(a,bw,function(){return bB(a,b,d)})},set:function(a,b){return bs.test(b)?b+"px":b}}}),f.support.opacity||(f.cssHooks.opacity={get:function(a,b){return bq.test((b&&a.currentStyle?a.currentStyle.filter:a.style.filter)||"")?parseFloat(RegExp.$1)/100+"":b?"1":""},set:function(a,b){var c=a.style,d=a.currentStyle,e=f.isNumeric(b)?"alpha(opacity="+b*100+")":"",g=d&&d.filter||c.filter||"";c.zoom=1;if(b>=1&&f.trim(g.replace(bp,""))===""){c.removeAttribute("filter");if(d&&!d.filter)return}c.filter=bp.test(g)?g.replace(bp,e):g+" "+e}}),f(function(){f.support.reliableMarginRight||(f.cssHooks.marginRight={get:function(a,b){return f.swap(a,{display:"inline-block"},function(){return b?by(a,"margin-right"):a.style.marginRight})}})}),f.expr&&f.expr.filters&&(f.expr.filters.hidden=function(a){var b=a.offsetWidth,c=a.offsetHeight;return b===0&&c===0||!f.support.reliableHiddenOffsets&&(a.style&&a.style.display||f.css(a,"display"))==="none"},f.expr.filters.visible=function(a){return!f.expr.filters.hidden(a)}),f.each({margin:"",padding:"",border:"Width"},function(a,b){f.cssHooks[a+b]={expand:function(c){var d,e=typeof c=="string"?c.split(" "):[c],f={};for(d=0;d<4;d++)f[a+bx[d]+b]=e[d]||e[d-2]||e[0];return f}}});var bC=/%20/g,bD=/\[\]$/,bE=/\r?\n/g,bF=/#.*$/,bG=/^(.*?):[ \t]*([^\r\n]*)\r?$/mg,bH=/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,bI=/^(?:about|app|app\-storage|.+\-extension|file|res|widget):$/,bJ=/^(?:GET|HEAD)$/,bK=/^\/\//,bL=/\?/,bM=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,bN=/^(?:select|textarea)/i,bO=/\s+/,bP=/([?&])_=[^&]*/,bQ=/^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+))?)?/,bR=f.fn.load,bS={},bT={},bU,bV,bW=["*/"]+["*"];try{bU=e.href}catch(bX){bU=c.createElement("a"),bU.href="",bU=bU.href}bV=bQ.exec(bU.toLowerCase())||[],f.fn.extend({load:function(a,c,d){if(typeof a!="string"&&bR)return bR.apply(this,arguments);if(!this.length)return this;var e=a.indexOf(" ");if(e>=0){var g=a.slice(e,a.length);a=a.slice(0,e)}var h="GET";c&&(f.isFunction(c)?(d=c,c=b):typeof c=="object"&&(c=f.param(c,f.ajaxSettings.traditional),h="POST"));var i=this;f.ajax({url:a,type:h,dataType:"html",data:c,complete:function(a,b,c){c=a.responseText,a.isResolved()&&(a.done(function(a){c=a}),i.html(g?f("<div>").append(c.replace(bM,"")).find(g):c)),d&&i.each(d,[c,b,a])}});return this},serialize:function(){return f.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?f.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||bN.test(this.nodeName)||bH.test(this.type))}).map(function(a,b){var c=f(this).val();return c==null?null:f.isArray(c)?f.map(c,function(a,c){return{name:b.name,value:a.replace(bE,"\r\n")}}):{name:b.name,value:c.replace(bE,"\r\n")}}).get()}}),f.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(a,b){f.fn[b]=function(a){return this.on(b,a)}}),f.each(["get","post"],function(a,c){f[c]=function(a,d,e,g){f.isFunction(d)&&(g=g||e,e=d,d=b);return f.ajax({type:c,url:a,data:d,success:e,dataType:g})}}),f.extend({getScript:function(a,c){return f.get(a,b,c,"script")},getJSON:function(a,b,c){return f.get(a,b,c,"json")},ajaxSetup:function(a,b){b?b$(a,f.ajaxSettings):(b=a,a=f.ajaxSettings),b$(a,b);return a},ajaxSettings:{url:bU,isLocal:bI.test(bV[1]),global:!0,type:"GET",contentType:"application/x-www-form-urlencoded; charset=UTF-8",processData:!0,async:!0,accepts:{xml:"application/xml, text/xml",html:"text/html",text:"text/plain",json:"application/json, text/javascript","*":bW},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText"},converters:{"* text":a.String,"text html":!0,"text json":f.parseJSON,"text xml":f.parseXML},flatOptions:{context:!0,url:!0}},ajaxPrefilter:bY(bS),ajaxTransport:bY(bT),ajax:function(a,c){function w(a,c,l,m){if(s!==2){s=2,q&&clearTimeout(q),p=b,n=m||"",v.readyState=a>0?4:0;var o,r,u,w=c,x=l?ca(d,v,l):b,y,z;if(a>=200&&a<300||a===304){if(d.ifModified){if(y=v.getResponseHeader("Last-Modified"))f.lastModified[k]=y;if(z=v.getResponseHeader("Etag"))f.etag[k]=z}if(a===304)w="notmodified",o=!0;else try{r=cb(d,x),w="success",o=!0}catch(A){w="parsererror",u=A}}else{u=w;if(!w||a)w="error",a<0&&(a=0)}v.status=a,v.statusText=""+(c||w),o?h.resolveWith(e,[r,w,v]):h.rejectWith(e,[v,w,u]),v.statusCode(j),j=b,t&&g.trigger("ajax"+(o?"Success":"Error"),[v,d,o?r:u]),i.fireWith(e,[v,w]),t&&(g.trigger("ajaxComplete",[v,d]),--f.active||f.event.trigger("ajaxStop"))}}typeof a=="object"&&(c=a,a=b),c=c||{};var d=f.ajaxSetup({},c),e=d.context||d,g=e!==d&&(e.nodeType||e instanceof f)?f(e):f.event,h=f.Deferred(),i=f.Callbacks("once memory"),j=d.statusCode||{},k,l={},m={},n,o,p,q,r,s=0,t,u,v={readyState:0,setRequestHeader:function(a,b){if(!s){var c=a.toLowerCase();a=m[c]=m[c]||a,l[a]=b}return this},getAllResponseHeaders:function(){return s===2?n:null},getResponseHeader:function(a){var c;if(s===2){if(!o){o={};while(c=bG.exec(n))o[c[1].toLowerCase()]=c[2]}c=o[a.toLowerCase()]}return c===b?null:c},overrideMimeType:function(a){s||(d.mimeType=a);return this},abort:function(a){a=a||"abort",p&&p.abort(a),w(0,a);return this}};h.promise(v),v.success=v.done,v.error=v.fail,v.complete=i.add,v.statusCode=function(a){if(a){var b;if(s<2)for(b in a)j[b]=[j[b],a[b]];else b=a[v.status],v.then(b,b)}return this},d.url=((a||d.url)+"").replace(bF,"").replace(bK,bV[1]+"//"),d.dataTypes=f.trim(d.dataType||"*").toLowerCase().split(bO),d.crossDomain==null&&(r=bQ.exec(d.url.toLowerCase()),d.crossDomain=!(!r||r[1]==bV[1]&&r[2]==bV[2]&&(r[3]||(r[1]==="http:"?80:443))==(bV[3]||(bV[1]==="http:"?80:443)))),d.data&&d.processData&&typeof d.data!="string"&&(d.data=f.param(d.data,d.traditional)),bZ(bS,d,c,v);if(s===2)return!1;t=d.global,d.type=d.type.toUpperCase(),d.hasContent=!bJ.test(d.type),t&&f.active++===0&&f.event.trigger("ajaxStart");if(!d.hasContent){d.data&&(d.url+=(bL.test(d.url)?"&":"?")+d.data,delete d.data),k=d.url;if(d.cache===!1){var x=f.now(),y=d.url.replace(bP,"$1_="+x);d.url=y+(y===d.url?(bL.test(d.url)?"&":"?")+"_="+x:"")}}(d.data&&d.hasContent&&d.contentType!==!1||c.contentType)&&v.setRequestHeader("Content-Type",d.contentType),d.ifModified&&(k=k||d.url,f.lastModified[k]&&v.setRequestHeader("If-Modified-Since",f.lastModified[k]),f.etag[k]&&v.setRequestHeader("If-None-Match",f.etag[k])),v.setRequestHeader("Accept",d.dataTypes[0]&&d.accepts[d.dataTypes[0]]?d.accepts[d.dataTypes[0]]+(d.dataTypes[0]!=="*"?", "+bW+"; q=0.01":""):d.accepts["*"]);for(u in d.headers)v.setRequestHeader(u,d.headers[u]);if(d.beforeSend&&(d.beforeSend.call(e,v,d)===!1||s===2)){v.abort();return!1}for(u in{success:1,error:1,complete:1})v[u](d[u]);p=bZ(bT,d,c,v);if(!p)w(-1,"No Transport");else{v.readyState=1,t&&g.trigger("ajaxSend",[v,d]),d.async&&d.timeout>0&&(q=setTimeout(function(){v.abort("timeout")},d.timeout));try{s=1,p.send(l,w)}catch(z){if(s<2)w(-1,z);else throw z}}return v},param:function(a,c){var d=[],e=function(a,b){b=f.isFunction(b)?b():b,d[d.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};c===b&&(c=f.ajaxSettings.traditional);if(f.isArray(a)||a.jquery&&!f.isPlainObject(a))f.each(a,function(){e(this.name,this.value)});else for(var g in a)b_(g,a[g],c,e);return d.join("&").replace(bC,"+")}}),f.extend({active:0,lastModified:{},etag:{}});var cc=f.now(),cd=/(\=)\?(&|$)|\?\?/i;f.ajaxSetup({jsonp:"callback",jsonpCallback:function(){return f.expando+"_"+cc++}}),f.ajaxPrefilter("json jsonp",function(b,c,d){var e=typeof b.data=="string"&&/^application\/x\-www\-form\-urlencoded/.test(b.contentType);if(b.dataTypes[0]==="jsonp"||b.jsonp!==!1&&(cd.test(b.url)||e&&cd.test(b.data))){var g,h=b.jsonpCallback=f.isFunction(b.jsonpCallback)?b.jsonpCallback():b.jsonpCallback,i=a[h],j=b.url,k=b.data,l="$1"+h+"$2";b.jsonp!==!1&&(j=j.replace(cd,l),b.url===j&&(e&&(k=k.replace(cd,l)),b.data===k&&(j+=(/\?/.test(j)?"&":"?")+b.jsonp+"="+h))),b.url=j,b.data=k,a[h]=function(a){g=[a]},d.always(function(){a[h]=i,g&&f.isFunction(i)&&a[h](g[0])}),b.converters["script json"]=function(){g||f.error(h+" was not called");return g[0]},b.dataTypes[0]="json";return"script"}}),f.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/javascript|ecmascript/},converters:{"text script":function(a){f.globalEval(a);return a}}}),f.ajaxPrefilter("script",function(a){a.cache===b&&(a.cache=!1),a.crossDomain&&(a.type="GET",a.global=!1)}),f.ajaxTransport("script",function(a){if(a.crossDomain){var d,e=c.head||c.getElementsByTagName("head")[0]||c.documentElement;return{send:function(f,g){d=c.createElement("script"),d.async="async",a.scriptCharset&&(d.charset=a.scriptCharset),d.src=a.url,d.onload=d.onreadystatechange=function(a,c){if(c||!d.readyState||/loaded|complete/.test(d.readyState))d.onload=d.onreadystatechange=null,e&&d.parentNode&&e.removeChild(d),d=b,c||g(200,"success")},e.insertBefore(d,e.firstChild)},abort:function(){d&&d.onload(0,1)}}}});var ce=a.ActiveXObject?function(){for(var a in cg)cg[a](0,1)}:!1,cf=0,cg;f.ajaxSettings.xhr=a.ActiveXObject?function(){return!this.isLocal&&ch()||ci()}:ch,function(a){f.extend(f.support,{ajax:!!a,cors:!!a&&"withCredentials"in a})}(f.ajaxSettings.xhr()),f.support.ajax&&f.ajaxTransport(function(c){if(!c.crossDomain||f.support.cors){var d;return{send:function(e,g){var h=c.xhr(),i,j;c.username?h.open(c.type,c.url,c.async,c.username,c.password):h.open(c.type,c.url,c.async);if(c.xhrFields)for(j in c.xhrFields)h[j]=c.xhrFields[j];c.mimeType&&h.overrideMimeType&&h.overrideMimeType(c.mimeType),!c.crossDomain&&!e["X-Requested-With"]&&(e["X-Requested-With"]="XMLHttpRequest");try{for(j in e)h.setRequestHeader(j,e[j])}catch(k){}h.send(c.hasContent&&c.data||null),d=function(a,e){var j,k,l,m,n;try{if(d&&(e||h.readyState===4)){d=b,i&&(h.onreadystatechange=f.noop,ce&&delete cg[i]);if(e)h.readyState!==4&&h.abort();else{j=h.status,l=h.getAllResponseHeaders(),m={},n=h.responseXML,n&&n.documentElement&&(m.xml=n);try{m.text=h.responseText}catch(a){}try{k=h.statusText}catch(o){k=""}!j&&c.isLocal&&!c.crossDomain?j=m.text?200:404:j===1223&&(j=204)}}}catch(p){e||g(-1,p)}m&&g(j,k,m,l)},!c.async||h.readyState===4?d():(i=++cf,ce&&(cg||(cg={},f(a).unload(ce)),cg[i]=d),h.onreadystatechange=d)},abort:function(){d&&d(0,1)}}}});var cj={},ck,cl,cm=/^(?:toggle|show|hide)$/,cn=/^([+\-]=)?([\d+.\-]+)([a-z%]*)$/i,co,cp=[["height","marginTop","marginBottom","paddingTop","paddingBottom"],["width","marginLeft","marginRight","paddingLeft","paddingRight"],["opacity"]],cq;f.fn.extend({show:function(a,b,c){var d,e;if(a||a===0)return this.animate(ct("show",3),a,b,c);for(var g=0,h=this.length;g<h;g++)d=this[g],d.style&&(e=d.style.display,!f._data(d,"olddisplay")&&e==="none"&&(e=d.style.display=""),(e===""&&f.css(d,"display")==="none"||!f.contains(d.ownerDocument.documentElement,d))&&f._data(d,"olddisplay",cu(d.nodeName)));for(g=0;g<h;g++){d=this[g];if(d.style){e=d.style.display;if(e===""||e==="none")d.style.display=f._data(d,"olddisplay")||""}}return this},hide:function(a,b,c){if(a||a===0)return this.animate(ct("hide",3),a,b,c);var d,e,g=0,h=this.length;for(;g<h;g++)d=this[g],d.style&&(e=f.css(d,"display"),e!=="none"&&!f._data(d,"olddisplay")&&f._data(d,"olddisplay",e));for(g=0;g<h;g++)this[g].style&&(this[g].style.display="none");return this},_toggle:f.fn.toggle,toggle:function(a,b,c){var d=typeof a=="boolean";f.isFunction(a)&&f.isFunction(b)?this._toggle.apply(this,arguments):a==null||d?this.each(function(){var b=d?a:f(this).is(":hidden");f(this)[b?"show":"hide"]()}):this.animate(ct("toggle",3),a,b,c);return this},fadeTo:function(a,b,c,d){return this.filter(":hidden").css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){function g(){e.queue===!1&&f._mark(this);var b=f.extend({},e),c=this.nodeType===1,d=c&&f(this).is(":hidden"),g,h,i,j,k,l,m,n,o,p,q;b.animatedProperties={};for(i in a){g=f.camelCase(i),i!==g&&(a[g]=a[i],delete a[i]);if((k=f.cssHooks[g])&&"expand"in k){l=k.expand(a[g]),delete a[g];for(i in l)i in a||(a[i]=l[i])}}for(g in a){h=a[g],f.isArray(h)?(b.animatedProperties[g]=h[1],h=a[g]=h[0]):b.animatedProperties[g]=b.specialEasing&&b.specialEasing[g]||b.easing||"swing";if(h==="hide"&&d||h==="show"&&!d)return b.complete.call(this);c&&(g==="height"||g==="width")&&(b.overflow=[this.style.overflow,this.style.overflowX,this.style.overflowY],f.css(this,"display")==="inline"&&f.css(this,"float")==="none"&&(!f.support.inlineBlockNeedsLayout||cu(this.nodeName)==="inline"?this.style.display="inline-block":this.style.zoom=1))}b.overflow!=null&&(this.style.overflow="hidden");for(i in a)j=new f.fx(this,b,i),h=a[i],cm.test(h)?(q=f._data(this,"toggle"+i)||(h==="toggle"?d?"show":"hide":0),q?(f._data(this,"toggle"+i,q==="show"?"hide":"show"),j[q]()):j[h]()):(m=cn.exec(h),n=j.cur(),m?(o=parseFloat(m[2]),p=m[3]||(f.cssNumber[i]?"":"px"),p!=="px"&&(f.style(this,i,(o||1)+p),n=(o||1)/j.cur()*n,f.style(this,i,n+p)),m[1]&&(o=(m[1]==="-="?-1:1)*o+n),j.custom(n,o,p)):j.custom(n,h,""));return!0}var e=f.speed(b,c,d);if(f.isEmptyObject(a))return this.each(e.complete,[!1]);a=f.extend({},a);return e.queue===!1?this.each(g):this.queue(e.queue,g)},stop:function(a,c,d){typeof a!="string"&&(d=c,c=a,a=b),c&&a!==!1&&this.queue(a||"fx",[]);return this.each(function(){function h(a,b,c){var e=b[c];f.removeData(a,c,!0),e.stop(d)}var b,c=!1,e=f.timers,g=f._data(this);d||f._unmark(!0,this);if(a==null)for(b in g)g[b]&&g[b].stop&&b.indexOf(".run")===b.length-4&&h(this,g,b);else g[b=a+".run"]&&g[b].stop&&h(this,g,b);for(b=e.length;b--;)e[b].elem===this&&(a==null||e[b].queue===a)&&(d?e[b](!0):e[b].saveState(),c=!0,e.splice(b,1));(!d||!c)&&f.dequeue(this,a)})}}),f.each({slideDown:ct("show",1),slideUp:ct("hide",1),slideToggle:ct("toggle",1),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){f.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),f.extend({speed:function(a,b,c){var d=a&&typeof a=="object"?f.extend({},a):{complete:c||!c&&b||f.isFunction(a)&&a,duration:a,easing:c&&b||b&&!f.isFunction(b)&&b};d.duration=f.fx.off?0:typeof d.duration=="number"?d.duration:d.duration in f.fx.speeds?f.fx.speeds[d.duration]:f.fx.speeds._default;if(d.queue==null||d.queue===!0)d.queue="fx";d.old=d.complete,d.complete=function(a){f.isFunction(d.old)&&d.old.call(this),d.queue?f.dequeue(this,d.queue):a!==!1&&f._unmark(this)};return d},easing:{linear:function(a){return a},swing:function(a){return-Math.cos(a*Math.PI)/2+.5}},timers:[],fx:function(a,b,c){this.options=b,this.elem=a,this.prop=c,b.orig=b.orig||{}}}),f.fx.prototype={update:function(){this.options.step&&this.options.step.call(this.elem,this.now,this),(f.fx.step[this.prop]||f.fx.step._default)(this)},cur:function(){if(this.elem[this.prop]!=null&&(!this.elem.style||this.elem.style[this.prop]==null))return this.elem[this.prop];var a,b=f.css(this.elem,this.prop);return isNaN(a=parseFloat(b))?!b||b==="auto"?0:b:a},custom:function(a,c,d){function h(a){return e.step(a)}var e=this,g=f.fx;this.startTime=cq||cr(),this.end=c,this.now=this.start=a,this.pos=this.state=0,this.unit=d||this.unit||(f.cssNumber[this.prop]?"":"px"),h.queue=this.options.queue,h.elem=this.elem,h.saveState=function(){f._data(e.elem,"fxshow"+e.prop)===b&&(e.options.hide?f._data(e.elem,"fxshow"+e.prop,e.start):e.options.show&&f._data(e.elem,"fxshow"+e.prop,e.end))},h()&&f.timers.push(h)&&!co&&(co=setInterval(g.tick,g.interval))},show:function(){var a=f._data(this.elem,"fxshow"+this.prop);this.options.orig[this.prop]=a||f.style(this.elem,this.prop),this.options.show=!0,a!==b?this.custom(this.cur(),a):this.custom(this.prop==="width"||this.prop==="height"?1:0,this.cur()),f(this.elem).show()},hide:function(){this.options.orig[this.prop]=f._data(this.elem,"fxshow"+this.prop)||f.style(this.elem,this.prop),this.options.hide=!0,this.custom(this.cur(),0)},step:function(a){var b,c,d,e=cq||cr(),g=!0,h=this.elem,i=this.options;if(a||e>=i.duration+this.startTime){this.now=this.end,this.pos=this.state=1,this.update(),i.animatedProperties[this.prop]=!0;for(b in i.animatedProperties)i.animatedProperties[b]!==!0&&(g=!1);if(g){i.overflow!=null&&!f.support.shrinkWrapBlocks&&f.each(["","X","Y"],function(a,b){h.style["overflow"+b]=i.overflow[a]}),i.hide&&f(h).hide();if(i.hide||i.show)for(b in i.animatedProperties)f.style(h,b,i.orig[b]),f.removeData(h,"fxshow"+b,!0),f.removeData(h,"toggle"+b,!0);d=i.complete,d&&(i.complete=!1,d.call(h))}return!1}i.duration==Infinity?this.now=e:(c=e-this.startTime,this.state=c/i.duration,this.pos=f.easing[i.animatedProperties[this.prop]](this.state,c,0,1,i.duration),this.now=this.start+(this.end-this.start)*this.pos),this.update();return!0}},f.extend(f.fx,{tick:function(){var a,b=f.timers,c=0;for(;c<b.length;c++)a=b[c],!a()&&b[c]===a&&b.splice(c--,1);b.length||f.fx.stop()},interval:13,stop:function(){clearInterval(co),co=null},speeds:{slow:600,fast:200,_default:400},step:{opacity:function(a){f.style(a.elem,"opacity",a.now)},_default:function(a){a.elem.style&&a.elem.style[a.prop]!=null?a.elem.style[a.prop]=a.now+a.unit:a.elem[a.prop]=a.now}}}),f.each(cp.concat.apply([],cp),function(a,b){b.indexOf("margin")&&(f.fx.step[b]=function(a){f.style(a.elem,b,Math.max(0,a.now)+a.unit)})}),f.expr&&f.expr.filters&&(f.expr.filters.animated=function(a){return f.grep(f.timers,function(b){return a===b.elem}).length});var cv,cw=/^t(?:able|d|h)$/i,cx=/^(?:body|html)$/i;"getBoundingClientRect"in c.documentElement?cv=function(a,b,c,d){try{d=a.getBoundingClientRect()}catch(e){}if(!d||!f.contains(c,a))return d?{top:d.top,left:d.left}:{top:0,left:0};var g=b.body,h=cy(b),i=c.clientTop||g.clientTop||0,j=c.clientLeft||g.clientLeft||0,k=h.pageYOffset||f.support.boxModel&&c.scrollTop||g.scrollTop,l=h.pageXOffset||f.support.boxModel&&c.scrollLeft||g.scrollLeft,m=d.top+k-i,n=d.left+l-j;return{top:m,left:n}}:cv=function(a,b,c){var d,e=a.offsetParent,g=a,h=b.body,i=b.defaultView,j=i?i.getComputedStyle(a,null):a.currentStyle,k=a.offsetTop,l=a.offsetLeft;while((a=a.parentNode)&&a!==h&&a!==c){if(f.support.fixedPosition&&j.position==="fixed")break;d=i?i.getComputedStyle(a,null):a.currentStyle,k-=a.scrollTop,l-=a.scrollLeft,a===e&&(k+=a.offsetTop,l+=a.offsetLeft,f.support.doesNotAddBorder&&(!f.support.doesAddBorderForTableAndCells||!cw.test(a.nodeName))&&(k+=parseFloat(d.borderTopWidth)||0,l+=parseFloat(d.borderLeftWidth)||0),g=e,e=a.offsetParent),f.support.subtractsBorderForOverflowNotVisible&&d.overflow!=="visible"&&(k+=parseFloat(d.borderTopWidth)||0,l+=parseFloat(d.borderLeftWidth)||0),j=d}if(j.position==="relative"||j.position==="static")k+=h.offsetTop,l+=h.offsetLeft;f.support.fixedPosition&&j.position==="fixed"&&(k+=Math.max(c.scrollTop,h.scrollTop),l+=Math.max(c.scrollLeft,h.scrollLeft));return{top:k,left:l}},f.fn.offset=function(a){if(arguments.length)return a===b?this:this.each(function(b){f.offset.setOffset(this,a,b)});var c=this[0],d=c&&c.ownerDocument;if(!d)return null;if(c===d.body)return f.offset.bodyOffset(c);return cv(c,d,d.documentElement)},f.offset={bodyOffset:function(a){var b=a.offsetTop,c=a.offsetLeft;f.support.doesNotIncludeMarginInBodyOffset&&(b+=parseFloat(f.css(a,"marginTop"))||0,c+=parseFloat(f.css(a,"marginLeft"))||0);return{top:b,left:c}},setOffset:function(a,b,c){var d=f.css(a,"position");d==="static"&&(a.style.position="relative");var e=f(a),g=e.offset(),h=f.css(a,"top"),i=f.css(a,"left"),j=(d==="absolute"||d==="fixed")&&f.inArray("auto",[h,i])>-1,k={},l={},m,n;j?(l=e.position(),m=l.top,n=l.left):(m=parseFloat(h)||0,n=parseFloat(i)||0),f.isFunction(b)&&(b=b.call(a,c,g)),b.top!=null&&(k.top=b.top-g.top+m),b.left!=null&&(k.left=b.left-g.left+n),"using"in b?b.using.call(a,k):e.css(k)}},f.fn.extend({position:function(){if(!this[0])return null;var a=this[0],b=this.offsetParent(),c=this.offset(),d=cx.test(b[0].nodeName)?{top:0,left:0}:b.offset();c.top-=parseFloat(f.css(a,"marginTop"))||0,c.left-=parseFloat(f.css(a,"marginLeft"))||0,d.top+=parseFloat(f.css(b[0],"borderTopWidth"))||0,d.left+=parseFloat(f.css(b[0],"borderLeftWidth"))||0;return{top:c.top-d.top,left:c.left-d.left}},offsetParent:function(){return this.map(function(){var a=this.offsetParent||c.body;while(a&&!cx.test(a.nodeName)&&f.css(a,"position")==="static")a=a.offsetParent;return a})}}),f.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(a,c){var d=/Y/.test(c);f.fn[a]=function(e){return f.access(this,function(a,e,g){var h=cy(a);if(g===b)return h?c in h?h[c]:f.support.boxModel&&h.document.documentElement[e]||h.document.body[e]:a[e];h?h.scrollTo(d?f(h).scrollLeft():g,d?g:f(h).scrollTop()):a[e]=g},a,e,arguments.length,null)}}),f.each({Height:"height",Width:"width"},function(a,c){var d="client"+a,e="scroll"+a,g="offset"+a;f.fn["inner"+a]=function(){var a=this[0];return a?a.style?parseFloat(f.css(a,c,"padding")):this[c]():null},f.fn["outer"+a]=function(a){var b=this[0];return b?b.style?parseFloat(f.css(b,c,a?"margin":"border")):this[c]():null},f.fn[c]=function(a){return f.access(this,function(a,c,h){var i,j,k,l;if(f.isWindow(a)){i=a.document,j=i.documentElement[d];return f.support.boxModel&&j||i.body&&i.body[d]||j}if(a.nodeType===9){i=a.documentElement;if(i[d]>=i[e])return i[d];return Math.max(a.body[e],i[e],a.body[g],i[g])}if(h===b){k=f.css(a,c),l=parseFloat(k);return f.isNumeric(l)?l:k}f(a).css(c,h)},c,a,arguments.length,null)}}),a.jQuery=a.$=f,typeof define=="function"&&define.amd&&define.amd.jQuery&&define("jquery",[],function(){return f})})(window);
/* kit */
$Kit = function(config) {
	var me = this;
	var defaultConfig = {
		//默认配置
	}
	me.config = me.join(config, defaultConfig);
	// -----------------------------init------------------------------------
	window[me.CONSTANTS.KIT_EVENT_STOPALLEVENT] = false;
	window[me.CONSTANTS.KIT_EVENT_STOPIMMEDIATEPROPAGATION] = false;
	// me.SYSINFO = {}
	// var inf = me.iOSInfo();
	// if(inf != null) {
	// me.merge(me.SYSINFO, inf);
	// }
	/**
	 * @namespace $kit.ui
	 */
	me.ui = {};
}
$Kit.prototype = {
	constructor : $Kit,
	CONSTANTS : {
		MAX_CYCLE_COUNT : 1000,
		NODETYPE_ELEMENT : 1,
		NODETYPE_ELEMENT_ATTR : 2,
		NODETYPE_TEXTNODE : 3,
		NODETYPE_COMMENT : 8,
		NODETYPE_ROOT : 9,
		NODETYPE_FRAGMENT : 11,
		DOCUMENT_POSITION_DISCONNECTED : 1, //不在一个文档
		DOCUMENT_POSITION_PRECEDING : 2, //b在a前面
		DOCUMENT_POSITION_FOLLOWING : 4, //b在a后面
		DOCUMENT_POSITION_CONTAINS : 10, //b是a祖先
		DOCUMENT_POSITION_CONTAINED_BY : 20, //b是a儿子
		DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC : 32, //不常用
		REGEXP_SPACE : /\s+/g,
		KIT_EVENT_REGISTER : "_kit_event_register_",
		KIT_EVENT_REGISTER_EVENT : "_kit_event_register_event",
		KIT_EVENT_REGISTER_FUNCTION : "_kit_event_register_function",
		KIT_EVENT_STOPIMMEDIATEPROPAGATION : "_kit_event_stopimmediatepropagation_",
		KIT_EVENT_STOPALLEVENT : "_kit_event_stopallevent_",
		KIT_DOM_ID_PREFIX : "J_Kit_"
	},
	// -----------------------------------is
	// something-----------------------------------
	isIE : function() {
		return /MSIE/i.test(navigator.userAgent);
	},
	isChrome : function() {
		return /Chrome/i.test(navigator.userAgent);
	},
	isWebKit : function() {
		return /WebKit/i.test(navigator.userAgent);
	},
	isFirefox : function() {
		return /Firefox/i.test(navigator.userAgent);
	},
	isDefined : function(o) {
		return typeof (o) != "undefined";
	},
	isStr : function(o) {
		return typeof (o) == "string";
	},
	isNum : function(o) {
		return isFinite(o)
	},
	isDate : function(o) {
		return (null != o) && !isNaN(o) && ("undefined" !== typeof o.getDate);
	},
	isObj : function(o) {
		return !!(o && typeof (o) == "object" );
	},
	isFn : function(o) {
		return !!(o && typeof (o) == "function");
	},
	isAry : function(o) {
		var me = this;
		return !!(o && (o.constructor && o.constructor.toString().indexOf("Array") > -1 || me.isNodeList(o)));
	},
	isNodeList : function(o) {
		return !!(o && (o.toString() == '[object NodeList]' || o.toString() == '[object HTMLCollection]' || (o.length && this.isNode(o[0]))));
	},
	isNode : function(o) {
		return !!(o && o.nodeType);
	},
	isCanSplit2Ary : function(o, sign) {
		var me = this;
		return me.isStr(o) && o.split(sign || /\s+/g).length > 1;
	},
	isEmpty : function(o) {
		var me = this;
		return typeof (o) == "undefined" || o == null || (!me.isNode(o) && me.isAry(o) && o.length == 0 || (me.isStr(o) && o == ""));
	},
	// -----------------------------------string-----------------------------------
	/**
	 * 去除所有空格
	 * @param {String}
	 * @return {String}
	 */
	trimAll : function(str) {
		if(str == null) {
			return null;
		}
		str = str.toString();
		return str.replace(/\s+/ig, "");
	},
	// -----------------------------------array-----------------------------------
	/**
	 * 从一个数组里面剔除部分元素
	 * @param {String|Array}
	 * @return {Array}
	 */
	aryDel : function(ary, del) {
		var me = this;
		if(!me.isAry(ary)) {
			return;
		}
		if(me.isAry(del)) {
			for(var i = 0; i < del.length; i++) {
				me.aryDel(ary, del[i]);
			}
		} else {
			for(var j = 0; j < ary.length; j++) {
				if(ary[j] == del) {
					ary.splice(j, 1);
				}
			}
		}
		return ary;
	},
	/**
	 * 判断是否数组中是否存在参数
	 * @param {String|Array}
	 * @return {Boolean}
	 */
	inAry : function(ary, o) {
		var me = this, flag = false;
		if(!me.isAry(ary)) {
			return;
		}
		for(var i = 0; i < ary.length; i++) {
			if(me.isAry(o)) {
				for(var j = 0; j < o.length; j++) {
					if(ary[i] == o[j]) {
						flag = true;
						break;
					}
				}
			} else {
				if(ary[i] == o) {
					flag = true;
					break;
				}
			}
		}
		return flag;
	},
	// -----------------------------------find dom-----------------------------------
	/**
	 * ==document.getElementById 根据id选择
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {Element}
	 */
	el8id : function(id, root) {
		var me = this, re = document.getElementById(id);
		if(root) {
			if(me.contains(root, re)) {
				return re;
			}
			return null;
		}
		return re;
	},
	/**
	 * ==document.getElementsByClassName 根据className选择，返回第一个找到的
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {Element|Null}
	 */
	el8cls : function(cls, root) {
		var re = (root || document).getElementsByClassName(cls);
		return (re != null && re.length ) ? re[0] : null;
	},
	/**
	 * ==document.getElementsByClassName 根据className选择，返回所有找到的
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {[Element]|Null}
	 */
	els8cls : function(cls, root) {
		var re = (root || document).getElementsByClassName(cls);
		return re != null && re.length ? re : null;
	},
	/**
	 * ==document.getElementsByTagName 根据tagName选择，返回所有找到的
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {[Element]|Null}
	 */
	els8tag : function(tagName, root) {
		var re = (root || document).getElementsByTagName(tagName);
		return re != null && re.length ? re : null;
	},
	/**
	 * ==document.getElementsByTagName 根据tagName选择，返回第一个找到的
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {[Element]|Null}
	 */
	el8tag : function(tagName, root) {
		var me = this;
		var re = me.els8tag(tagName, root);
		return re != null && re.length ? re[0] : null;
	},
	/**
	 * ==document.getElementsByName 根据name选择，返回第一个找到的
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {[Element]|Null}
	 */
	el8name : function(name, root) {
		var me = this, re = document.getElementsByName(name);
		if(root) {
			for(var i = 0; i < re.length; i++) {
				if(me.contains(root, re[i])) {
					return re[i];
				}
			}
			return null;
		}
		return (re != null && re.length ) ? re[0] : null;
	},
	/**
	 * ==document.getElementsByName 根据name选择，返回所有找到的
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {[Element]|Null}
	 */
	els8name : function(name, root) {
		var me = this, re = document.getElementsByName(name);
		if(root) {
			var _re = [];
			for(var i = 0; i < re.length; i++) {
				if(me.contains(root, re[i])) {
					_re.push(re[i]);
				}
			}
			return _re.length ? _re : null;
		}
		return re != null && re.length ? re : null;
	},
	/**
	 * 简单Css选择器 支持#id，.className，@formName，还有tagName.className，四种格式
	 * @param {String}
	 * @param {Element} [root] 可选,从哪个根节点查找
	 * @return {[Element]|Null}
	 */
	el : function(selector, root) {
		var me = this;
		if(me.isEmpty(selector)) {
			return;
		} else if(me.isNode(selector) || me.isNodeList(selector)) {
			return selector;
		}
		var selector = selector.toString().trim();
		if(selector.indexOf("#") == 0) {
			return me.el8id(selector.substring(1), root);
		} else if(selector.indexOf(".") == 0) {
			var a = me.els8cls(selector.substring(1), root), re = [];
			if(a.constructor && a.constructor.toString().indexOf("Array") > -1) {
				re = a;
			} else {
				for(var i = 0; i < a.length; i++) {
					re.push(a[i]);
				}
			}
			return re;
		} else if(selector.indexOf("@") == 0) {
			var a = me.els8name(selector.substring(1), root), re = [];
			for(var i = 0; i < a.length; i++) {
				re.push(a[i]);
			}
			return re;
		} else {
			var re = [];
			if(selector.indexOf(".") > 0 && selector.indexOf(".") < selector.length) {
				var a = me.els8tag(selector.substring(0, selector.indexOf(".")), root);
				var cls = selector.substr(selector.indexOf(".") + 1);
				for(var i = 0; !me.isEmpty(a) && i < a.length; i++) {
					if(me.hsCls(a[i], cls)) {
						re.push(a[i]);
					}
				}
			} else {
				re = me.els8tag(selector, root);
			}
			return re;
		}

	},
	// -----------------------------------dom manipulate-----------------------------------
	/**
	 * 比较element位置 如果a包含b返回true，否则返回false
	 * @param {Element}
	 * @param {Element}
	 * @reutn {Boolean}
	 */
	contains : function(a, b) {
		return a.contains ? a != b && a.contains(b) : !!(a.compareDocumentPosition(b) & 16);
	},
	/**
	 * 设置或者获取Element的attribute
	 * @param {Element}
	 * @param {String|Object} attr 可以为属性值，也可以为一个枚举对象，按照key,value顺序批量设置
	 * @param {String} [value]
	 * @reutn {String|Null}
	 */
	attr : function(el, attr, value) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		if(!me.isDefined(value)) {
			if(me.isObj(attr)) {
				for(var l in attr) {
					el.setAttribute(l, attr[l]);
				}
			} else {
				return el.getAttribute(attr);
			}
		} else {
			if(value == null) {
				if( attr in el) {
					try {
						el[attr] = null;
					} catch(e) {
					}
				}
				if(el.removeAttribute) {
					el.removeAttribute(attr);
				} else {
					el.setAttribute(attr, null);
				}
				try {
					delete el[attr];
				} catch(e) {
				}
			} else {
				el.setAttribute(attr, value);
			}
		}
	},
	/**
	 * 设置或者获取Element的css
	 * @param {Element}
	 * @param {String|Object} attr 可以为属性值，也可以为一个枚举对象，按照key,value顺序批量设置
	 * @param {String} [value]
	 * @reutn {String|Null}
	 */
	css : function(el, attr, value) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		if(value == null) {
			if(me.isObj(attr)) {
				for(var l in attr) {
					if(l.indexOf('-moz-') == 0) {
						var l1 = '';
						$kit.each(l.split('-'), function(o) {
							if(o.length) {
								l1 += o.substring(0, 1).toUpperCase() + o.substring(1, o.length);
							}
						});
						el.style[l1] = attr[l];
					} else {
						if(!me.isWebKit()) {
							l = me._camelCssName(l);
						}
						el.style[l] = attr[l];
					}
				}
			} else {
				var re = getComputedStyle(el, null)[this._camelCssName(attr)];
				try {
					re = isNaN(parseFloat(re)) ? re : parseFloat(re);
				} catch(e) {
					//
				}
				return re;
			}
		} else {
			if(attr.indexOf('-moz-') == 0) {
				var attr1 = '';
				$kit.each(attr.split('-'), function(o) {
					if(o.length) {
						attr1 += o.substring(0, 1).toUpperCase() + o.substring(1, o.length);
					}
				});
				el.style[attr1] = value;
			} else {
				if(!me.isWebKit()) {
					attr = me._camelCssName(attr);
				}
				el.style[attr] = value;
			}
		}
	},
	_camelCssName : function(str) {
		var a = str.split('-');
		for(var i = 1; i < a.length; i++) {
			a[i] = a[i].substr(0, 1).toUpperCase() + a[i].substr(1);
		}
		return a.join('');
	},
	/**
	 * 获取Element的cssStr
	 * @param {Element}
	 * @param {String}
	 */
	cssStr : function(el, attr) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		if(attr.indexOf('-moz-') == 0) {
			var attr1 = '';
			$kit.each(attr.split('-'), function(o) {
				if(o.length) {
					attr1 += o.substring(0, 1).toUpperCase() + o.substring(1, o.length);
				}
			});
			attr = attr1;
		} else {
			attr = this._camelCssName(attr);
		}
		var re = el.style[attr] || getComputedStyle(el, null)[attr];
		return re;
	},
	_camelCssName : function(str) {
		var firstLetter = str.substring(0, 1);
		var mainStr = str.substr(1);
		var a = mainStr.split('-');
		for(var i = 1; i < a.length; i++) {
			a[i] = a[i].substr(0, 1).toUpperCase() + a[i].substr(1);
		}
		return firstLetter.toLowerCase() + a.join('');
	},
	/**
	 * 取值 div等取innerHTML textarea等form元素取value
	 * @param {Element}
	 * @return {String}
	 */
	val : function(el) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		if(me.isNode(el) && ('value' in el)) {
			return el.value;
		} else if(me.isNodeList(el) && el.length > 1) {
			var a = [];
			for(var i = 0; i < el.length; i++) {
				if(el[i].checked && el[i].value) {
					a.push(el[i].value);
				}
			}
			return a.join(',');
		} else if(el.length == 1) {
			return me.val(el[0]);
		}
		return el.innerHTML;
	},
	/**
	 * 插入元素
	 * @param {Object} config
	 * @param {String} config.pos pos表示插入位置，有last,first,before(previous),after(nextSibling)，4种类型值
	 * @param {Element} config.where where为被插入目标Element
	 * @param {Element|String} config.what what为插入值，可以为一段HTML，也可以为一个HTML Node
	 */
	insEl : function(config) {
		var me = this, defaultConfig = {
			pos : "last",
			what : null,
			where : null
		}
		config = me.join(defaultConfig, config);
		var what = config.what, where = config.where;
		if(!me.isEmpty(what) && me.isNode(where)) {
			switch (config.pos.toString().toLowerCase()) {
				case "first" :
					if(me.isStr(what)) {
						me.insertHTML(where, "afterBegin", what);
					} else {
						me.insertNode(where, "afterBegin", what);
					}
					break;
				case "before" :
				case "previous" :
					if(me.isStr(what)) {
						me.insertHTML(where, "beforeBegin", what);
					} else {
						me.insertNode(where, "beforeBegin", what);
					}
					break;
				case "after" :
				case "nextsibling" :
					if(me.isStr(what)) {
						me.insertHTML(where, "afterEnd", what);
					} else {
						me.insertNode(where, "afterEnd", what);
					}
					break;
				case "last" :
					if(me.isStr(what)) {
						me.insertHTML(where, "beforeEnd", what);
					} else {
						me.insertNode(where, "beforeEnd", what);
					}
					break;
				default:
				//i don`t know how to do that
			}
		}
	},
	/**
	 * @private
	 */
	insertNode : function(el, where, parsedNode) {
		switch(where) {
			case "beforeBegin":
				el.parentNode.insertBefore(parsedNode, el);
				break;
			case "afterBegin":
				el.insertBefore(parsedNode, el.firstChild);
				break;
			case "beforeEnd":
				el.appendChild(parsedNode);
				break;
			case "afterEnd":
				if(el.nextSibling) {
					el.parentNode.insertBefore(parsedNode, el.nextSibling);
				} else {
					el.parentNode.appendChild(parsedNode);
				}
				break;
		}
	},
	/**
	 * @private
	 */
	insertHTML : function(el, where, html) {
		where = where.toLowerCase();
		if(el.insertAdjacentHTML) {
			switch(where) {
				case "beforebegin":
					el.insertAdjacentHTML('BeforeBegin', html);
					return el.previousSibling;
				case "afterbegin":
					el.insertAdjacentHTML('AfterBegin', html);
					return el.firstChild;
				case "beforeend":
					el.insertAdjacentHTML('BeforeEnd', html);
					return el.lastChild;
				case "afterend":
					el.insertAdjacentHTML('AfterEnd', html);
					return el.nextSibling;
			}
			throw 'Illegal insertion point -> "' + where + '"';
		}
		var range = el.ownerDocument.createRange();
		var frag;
		switch(where) {
			case "beforebegin":
				range.setStartBefore(el);
				frag = range.createContextualFragment(html);
				el.parentNode.insertBefore(frag, el);
				return el.previousSibling;
			case "afterbegin":
				if(el.firstChild) {
					range.setStartBefore(el.firstChild);
					frag = range.createContextualFragment(html);
					el.insertBefore(frag, el.firstChild);
					return el.firstChild;
				} else {
					el.innerHTML = html;
					return el.firstChild;
				}
			case "beforeend":
				if(el.lastChild) {
					range.setStartAfter(el.lastChild);
					frag = range.createContextualFragment(html);
					el.appendChild(frag);
					return el.lastChild;
				} else {
					el.innerHTML = html;
					return el.lastChild;
				}
			case "afterend":
				range.setStartAfter(el);
				frag = range.createContextualFragment(html);
				el.parentNode.insertBefore(frag, el.nextSibling);
				return el.nextSibling;
		}
		throw 'Illegal insertion point -> "' + where + '"';
	},
	/**
	 * 替换元素
	 * @param {Element}
	 * @param {Element|String} html 为一个html元素或者一段HTML string
	 */
	rpEl : function(element, html) {
		var me = this;
		if(me.isEmpty(element) || me.isEmpty(html)) {
			return;
		}
		if($kit.isStr(html)) {
			var range = element.ownerDocument.createRange();
			range.selectNodeContents(element);
			element.parentNode.replaceChild(range.createContextualFragment(html), element);
			range.detach();
		} else if($kit.isNode(html)) {
			element.parentNode.replaceChild(html, element);
		}
	},
	/**
	 * 删除元素
	 * @param {Element}
	 */
	rmEl : function(element) {
		var me = this;
		if(me.isEmpty(element)) {
			return;
		}
		if(me.isAry(element)) {
			for(var i = 0; i < element.length; i++) {
				me.rmEl(element[i]);
			}
		} else {
			me.traversal({
				root : element,
				fn : function(node) {
					me.delEv({
						el : node
					});
				}
			});
			element.parentNode.removeChild(element, true);
		}
	},
	/**
	 * 添加className
	 * @param {Element}
	 * @param {String}
	 */
	adCls : function(el, cls) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		/*
		 if(me.isAry(clss)) {
		 for(var i = 0; i < clss.length; i++) {
		 me.adCls(el, clss[i]);
		 }
		 } else {
		 var a = me.isEmpty(el.className) ? [] :
		 el.className.split(me.CONSTANTS.REGEXP_SPACE), flag = true;
		 for(var i = 0; i < a.length; i++) {
		 if(a[i] == clss) {
		 flag = false;
		 break;
		 }
		 }
		 if(flag) {
		 a.push(clss);
		 el.className = a.join(" ");
		 }
		 }*/
		var re = new RegExp('(\\s|^)' + cls + '(\\s|$)');
		if(re.test(el.className))
			return;
		//el.className += ' ' + cls;
		el.className = el.className.split(/\s+/).join(' ') + ' ' + cls;
	},
	/**
	 * 删除ClassName
	 * @param {Element}
	 * @param {String}
	 */
	rmCls : function(el, cls) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		/*
		 var a = me.isEmpty(el.className) ? [] :
		 el.className.split(me.CONSTANTS.REGEXP_SPACE), b = [];
		 if(a.length) {
		 b = me.aryDel(a, clss);
		 }
		 if(b.length) {
		 el.className = b.join(" ");
		 } else {
		 el.className = "";
		 me.attr(el, 'class', null);
		 }*/
		var clsAry = cls.split(/\s+/g);
		var reCls = el.className;
		for(var i = 0; i < clsAry.length; i++) {
			var cls = clsAry[i];
			var re = new RegExp('(\\s|^)' + cls + '(\\s|$)');
			if(reCls) {
				reCls = reCls.replace(re, ' ');
			}
		}
		reCls = reCls.trim();
		el.className = reCls;
	},
	/**
	 * 判断是否含有某个className
	 * @param {Element}
	 * @param {String}
	 */
	hsCls : function(el, cls) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		/*
		 if(!me.isEmpty(el.className)) {
		 var a = el.className.split(me.CONSTANTS.REGEXP_SPACE);
		 for(var i = 0; i < a.length; i++) {
		 if(a[i] == cls) {
		 flag = true;
		 break;
		 }
		 }
		 }
		 return flag;
		 */
		var re = new RegExp('(\\s|^)' + cls + '(\\s|$)');
		return re.test(el.className);
	},
	/**
	 * 切换css，有则删，无则加
	 * @param {Element}
	 * @param {String}
	 */
	toggleCls : function(el, cls) {
		var me = this;
		if(me.hsCls(el, cls)) {
			me.rmCls(el, cls);
		} else {
			me.adCls(el, cls);
		}
	},
	/**
	 * Dom遍历
	 * @param {Object} config
	 * @param {Object} config.root 遍历的根节点，表示从哪儿开始遍历
	 * @param {Object} config.fn 每遍历一个节点，执行的方法fn(node,root)
	 */
	traversal : function(config) {
		var me = this, defaultConfig = {
			root : document.body
		}
		me.mergeIf(config, defaultConfig);
		if(me.isEmpty(config.node)) {
			config.node = config.root;
		}
		if($kit.isFn(config.fn)) {
			config.fn.apply(config.node, [config.node, config.root])
		} else {
			return;
		}
		for(var i = 0; i < config.node.childNodes.length; i++) {
			var o = config.node.childNodes[i];
			me.traversal(me.join(config, {
				node : o
			}));
		}

	},
	/**
	 * 返回当前元素满足条件的下一个元素
	 * @param {Element}
	 * @param {Function} condition 用于检测是否满足条件的方法，返回true表示满足
	 * @param {Obejct} [scope] 执行condition时候的this指针
	 * @return {Element}
	 */
	nextEl : function(el, condition, scope) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		var next = null;
		if(el.nextElementSibling != null) {
			next = el.nextElementSibling;
		} else {
			var parent = el.parentNode;
			while(parent != null && parent.parentNode != null && parent == parent.parentNode.lastElementChild) {
				parent = parent.parentNode;
			}
			var firstEl = parent.nextElementSibling.firstElementChild;
			while(firstEl != null && firstEl.children.length > 0 && firstEl.firstElementChild != null) {
				firstEl = firstEl.firstElementChild;
			}
			next = firstEl;
		}
		if(next != null) {
			var condition = condition || null, scope = scope || null;
			if(me.isFn(condition)) {
				if(condition.call(scope, next, el) == true) {
					return next;
				} else if(condition.call(scope, next, el) == false) {
					return null;
				} else {
					var allNodes = document.getElementsByTagName("*");
					if(next != allNodes[allNodes.length - 1]) {
						return me.nextEl(next, condition, scope);
					} else {
						return null;
					}
				}
			}
		}
		return next;
	},
	/**
	 * 返回当前元素满足条件的前一个元素
	 * @param {Element}
	 * @param {Function} condition 用于检测是否满足条件的方法，返回true表示满足
	 * @param {Obejct} [scope] 执行condition时候的this指针
	 * @return {Element}
	 */
	prevEl : function(el, condition, scope) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		var prev = null;
		if(el.previousElementSibling != null) {
			prev = el.previousElementSibling;
		} else {
			var parent = el.parentNode;
			while(parent != null && parent.parentNode != null && parent == parent.parentNode.firstElementChild) {
				parent = parent.parentNode;
			}
			var lastEl = parent.previousElementSibling.lastElementChild;
			while(lastEl != null && lastEl.children.length > 0 && lastEl.lastElementChild != null) {
				lastEl = lastEl.lastElementChild;
			}
			prev = lastEl;
		}
		if(prev != null) {
			var condition = condition || null, scope = scope || null;
			if(me.isFn(condition)) {
				if(condition.call(scope, prev, el) == true) {
					return prev;
				} else if(condition.call(scope, prev, el) == false) {
					return null;
				} else {
					var allNodes = document.getElementsByTagName("*");
					if(prev != allNodes[0]) {
						return me.prevEl(prev, condition, scope);
					} else {
						return null;
					}
				}
			}
		}
		return prev;
	},
	/**
	 * 返回当前元素满足条件的父元素
	 * @param {Element}
	 * @param {Function} condition 用于检测是否满足条件的方法，返回true表示满足
	 * @param {Obejct} [scope] 执行condition时候的this指针
	 * @return {Element}
	 */
	parentEl : function(el, condition, scope) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		var parent = null;
		if(el.parentNode != null && el.parentNode != el) {
			parent = el.parentNode;
			var condition = condition || null, scope = scope || null;
			if(me.isFn(condition)) {
				if(condition.call(scope, parent, el) == true) {
					return parent;
				} else if(condition.call(scope, parent, el) == false) {
					return null;
				} else {
					return me.parentEl(parent, condition, scope);
				}
			}
		}
		return parent;
	},
	/**
	 * 返回一个 documentFragment，包含了HTML
	 * @param {String}
	 * @return {DocumentFragment}
	 */
	newHTML : function(html) {
		var me = this;
		if(me.isEmpty(html)) {
			return;
		}
		var box = document.createElement("div");
		box.innerHTML = html;
		var o = document.createDocumentFragment();
		while(box.childNodes && box.childNodes.length) {
			o.appendChild(box.childNodes[0]);
		}
		box = null;
		return o;
	},
	/**
	 * 计算元素相对于doc的 绝对偏移
	 * @param {Element}
	 * @return {Number} top 距离顶部
	 * @return {Number} left 距离左边
	 * @return {Number} height 高度
	 * @return {Number} width 宽度
	 * @return {Number} bottom 底部距离顶部
	 * @return {Number} right 右边距离最左边
	 * @return {Number} middleTop 中间距离顶部
	 * @return {Number} middleLeft 中间距离最左边
	 */
	offset : function(el) {
		var me = this;
		if(me.isEmpty(el)) {
			return;
		}
		var top = el.offsetTop, //
		left = el.offsetLeft, //
		width = el.offsetWidth, //
		height = el.offsetHeight;
		while(el.offsetParent != null && el.offsetParent != el) {
			el = el.offsetParent;
			top += el.offsetTop;
			left += el.offsetLeft;
		}
		return {
			top : top,
			left : left,
			width : width,
			height : height,
			bottom : top + height,
			right : left + width,
			middleTop : top + height / 2,
			middleLeft : left + width / 2
		}
	},
	/**
	 * 计算元素相对于doc的 绝对偏移
	 * @param {Element}
	 * @return {Number} clientWidth 可视内容的宽度
	 * @return {Number} clientHeight 可视内容的高度
	 * @return {Number} scrollWidth 滚动条的宽度
	 * @return {Number} scrollHeight 滚动条的高度
	 * @return {Number} scrollLeft 滚动条距离左边的宽度
	 * @return {Number} scrollTop 滚动条距离顶部的高度
	 */
	viewport : function() {
		var cWidth, cHeight, sWidth, sHeight, sLeft, sTop;
		if(document.compatMode == "BackCompat") {
			cWidth = document.body.clientWidth;
			cHeight = document.body.clientHeight;
			sWidth = document.body.scrollWidth;
			sHeight = document.body.scrollHeight;
			sLeft = document.body.scrollLeft;
			sTop = document.body.scrollTop;
		} else {//document.compatMode == "CSS1Compat"
			cWidth = document.documentElement.clientWidth;
			cHeight = document.documentElement.clientHeight;
			sWidth = document.documentElement.scrollWidth;
			sHeight = document.documentElement.scrollHeight;
			sLeft = document.documentElement.scrollLeft == 0 ? document.body.scrollLeft : document.documentElement.scrollLeft;
			sTop = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
		}
		return {
			clientWidth : cWidth,
			clientHeight : cHeight,
			scrollWidth : sWidth,
			scrollHeight : sHeight,
			scrollLeft : sLeft,
			scrollTop : sTop
		}
	},
	// -----------------------------------event-----------------------------------
	// -----------------------------------event-----------------------------------
	/**
	 * kit事件注册方法
	 * kitjs的事件对象event拥有以下属性
	 * target: 当前事件触发元素
	 * currentTarget：注册该事件的元素
	 * relatedTarget: 事件触发相关的元素，当事件在两个元素之间发生时候，这个有值，兼容了toElement,fromElement
	 * offsetX/Y: 事件相当于target的x,y
	 * clientX/Y: 事件相当于viewport的x,y
	 * pageX/Y: 事件相当于doc的
	 * firstFingerClientX/Y: 移动设备的touchmove
	 * firstFingerPageX/Y: 移动设备的touchmove
	 * stopNow(): 立即停止所有
	 * stopDefault(): 停止默认事件触发
	 * stopGoOn(): 停止冒泡
	 * @param {Object} config
	 * @param {Selector|Element|NodeList} config.el 触发事件的元素，等于event.currentTarget
	 * @param {String} config.ev 事件type，如click
	 * @param {Function} config.fn 事件方法
	 * @param {Object} config.scope this指针
	 */
	ev : function(config) {
		var me = this, defaultConfig = {
			el : window,
			ev : null,
			fn : null,
			scope : null
		}
		config = me.join(defaultConfig, config);
		if(me.isAry(config.el)) {
			for(var i = 0; i < config.el.length; i++) {
				me.ev(me.join(config, {
					el : config.el[i]
				}));
			}
		} else if(me.isCanSplit2Ary(config.el)) {
			var a = config.el.split(me.CONSTANTS.REGEXP_SPACE)
			for(var i = 0; i < a.length; i++) {
				var _el = me.el8id(a[i]);
				if(!me.isEmpty(_el)) {
					me.ev(me.join(config, {
						el : _el
					}));
				}
			}
		} else if(me.isStr(config.el)) {
			var _el = me.el(config.el);
			if(me.isEmpty(_el)) {
				_el = me.el("#" + config.el);
			}
			if(!me.isEmpty(_el)) {
				me.ev(me.join(config, {
					el : _el
				}));
			}
		} else if(me.isAry(config.ev)) {
			for(var i = 0; i < config.ev.length; i++) {
				me.ev(me.join(config, {
					ev : config.ev[i]
				}));
			}
		} else if(me.isCanSplit2Ary(config.ev)) {
			var a = config.ev.split(me.CONSTANTS.REGEXP_SPACE);
			for(var i = 0; i < a.length; i++) {
				me.ev(me.join(config, {
					ev : a[i]
				}));
			}
		} else {
			if(!me.isEmpty(config.el) && !me.isEmpty(config.ev) && !me.isEmpty(config.fn)) {
				config.ev = config.ev.toString().trim();
				// -------webkit support stopImmediatePropagation, so comment
				// this template
				var evReg = config.el[me.CONSTANTS.KIT_EVENT_REGISTER] = config.el[me.CONSTANTS.KIT_EVENT_REGISTER] || {};
				var evRegEv = evReg[me.CONSTANTS.KIT_EVENT_REGISTER_EVENT] = evReg[me.CONSTANTS.KIT_EVENT_REGISTER_EVENT] || {};
				var evRegFn = evReg[me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION] = evReg[me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION] || {};
				evRegEv[config.ev] = evRegEv[config.ev] || [];
				evRegFn[config.ev] = evRegFn[config.ev] || (function() {
					/*try {*/
					// stop global event on-off
					if(window[me.CONSTANTS.KIT_EVENT_STOPALLEVENT]) {
						return;
					}
					var EV = arguments[0] || window.event;

					me.mergeIf(EV, {
						target : EV.target || EV.srcElement,
						currentTarget : config.el,
						relatedTarget : EV.relatedTarget ? EV.relatedTarget : EV.toElement || EV.fromElement
					});
					//add dragElement temp reg
					if(!$kit.isEmpty($kit.event) && $kit.isEmpty(EV.relatedTarget) && !$kit.isEmpty($kit.event.dragElement) && (EV.type.indexOf('drag') == 0 || EV.type.indexOf('drop') == 0)) {
						EV.dragElement = $kit.event.dragElement;
					}
					me.mergeIf(EV, {
						stopNow : function() {
							EV.stopPropagation && EV.stopPropagation();
							EV.preventDefault && EV.preventDefault();
							//
							EV.cancelBubble = true;
							EV.returnValue = false;
							//
							window[me.CONSTANTS.KIT_EVENT_STOPIMMEDIATEPROPAGATION] = true;
						},
						stopDefault : function() {
							EV.preventDefault && EV.preventDefault();
							EV.returnValue = false;
						},
						stopGoOn : function() {
							//EV.preventDefault && EV.preventDefault();
							EV.stopPropagation && EV.stopPropagation();
							//
							EV.cancelBubble = true;
							//EV.returnValue = false;
						}
					}, me.evExtra(EV));
					var target = config.el;
					var evQueue = target[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT][config.ev];
					var returnValue;
					for(var i = 0; i < evQueue.length; i++) {
						if(window[me.CONSTANTS.KIT_EVENT_STOPIMMEDIATEPROPAGATION]) {
							break;
						}
						var _evConfig = evQueue[i];
						returnValue = _evConfig.fn.apply(_evConfig.scope || _evConfig.el, [EV, _evConfig]);
					}
					window[me.CONSTANTS.KIT_EVENT_STOPIMMEDIATEPROPAGATION] = false;
					/*
					 } catch(e) {
					 alert(e);
					 throw e;
					 };*/
					if(returnValue != null) {
						return returnValue;
					}
				});
				if(document.attachEvent) {
					config.el.attachEvent('on' + config.ev, config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][config.ev]);
				} else {
					config.el.addEventListener(config.ev, config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][config.ev], false);
				}
				evRegEv[config.ev].push(config);
			} else {
				if(!me.isEmpty(config.el) && !me.isEmpty(config.ev) && me.isEmpty(config.fn)) {
					if(window[me.CONSTANTS.KIT_EVENT_STOPALLEVENT]) {
						return;
					}
					// var evt = document.createEvent('Event');
					// evt.initEvent(config.ev, true, true);
					// config.el.dispatchEvent(evt);
					me.newEv({
						el : config.el,
						type : 'Events',
						ev : config.ev,
						bubbles : true,
						cancelable : true
					});
				}
			}
		}
	},
	/**
	 * kit事件注销方法
	 * @param {Object} config
	 * @param {Selector|Element|NodeList} config.el 触发事件的元素，等于event.currentTarget
	 * @param {String} [config.ev] 事件type，如无，则注销该元素下所有类型的事件
	 * @param {Function} [config.fn] 事件方法，如有，则根据toString对比，找到后注销，如无，则注销该事件下所有的方法
	 */
	delEv : function(config) {
		var me = this, defaultConfig = {
			el : window,
			ev : null,
			fn : null
		}
		config = me.join(defaultConfig, config);
		if(me.isAry(config.el)) {
			for(var i = 0; i < config.el.length; i++) {
				me.delEv(me.join(config, {
					el : config.el[i]
				}));
			}
		} else if(me.isCanSplit2Ary(config.el)) {
			var a = config.el.split(me.CONSTANTS.REGEXP_SPACE)
			for(var i = 0; i < a.length; i++) {
				var _el = me.el8id(a[i]);
				if(!me.isEmpty(_el)) {
					me.delEv(me.join(config, {
						el : _el
					}));
				}
			}
		} else if(me.isStr(config.el)) {
			var _el = me.el8id(config.el);
			if(me.isEmpty(_el)) {
				_el = me.el("#" + config.el);
			}
			if(!me.isEmpty(_el)) {
				me.delEv(me.join(config, {
					el : _el
				}));
			}
		} else if(me.isAry(config.ev)) {
			for(var i = 0; i < config.ev.length; i++) {
				me.delEv(me.join(config, {
					ev : config.ev[i]
				}));
			}
		} else if(me.isCanSplit2Ary(config.ev)) {
			var a = config.ev.split(me.CONSTANTS.REGEXP_SPACE)
			for(var i = 0; i < a.length; i++) {
				me.delEv(me.join(config, {
					ev : a[i]
				}));
			}
		} else if(!me.isEmpty(config.el)) {
			if(!me.isEmpty(config.ev)) {
				config.ev = config.ev.toString().trim();
				if(!me.isEmpty(config.fn)) {
					var evQueue = config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT][config.ev];
					for(var i = 0; i < evQueue.length; i++) {
						var _config = evQueue[i];
						if(_config.fn == config.fn || _config.fn.toString() == config.fn.toString() || me.trimAll(_config.fn.toString()) == me.trimAll(config.fn.toString())) {
							evQueue.splice(i, 1);
						}
					}
					if(evQueue.length == 0) {
						delete config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT][config.ev];
						rmEv(config.el, config.ev, config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][config.ev]);
						delete config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][config.ev];
					}
				} else {
					delete config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT][config.ev];
					rmEv(config.el, config.ev, config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][config.ev]);
					delete config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][config.ev];
				}
			} else {
				if($kit.isEmpty(config.el[me.CONSTANTS.KIT_EVENT_REGISTER]) || $kit.isEmpty(config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT])) {
					return;
				}
				for(var _ev in config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT]) {
					rmEv(config.el, _ev, config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION][_ev]);
				}
				delete config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_EVENT];
				delete config.el[me.CONSTANTS.KIT_EVENT_REGISTER][me.CONSTANTS.KIT_EVENT_REGISTER_FUNCTION];
			}
		}
		function rmEv(el, e, fn) {
			if(document.attachEvent) {
				el.detachEvent('on' + e, fn);
			} else {
				el.removeEventListener(e, fn, false);
			}
		}

	},
	/**
	 * 触发事件
	 * @param {Object} config
	 * @param {Element} config.el 触发元素
	 * @param {String} [config.ev] 事件类型
	 */
	newEv : function(config) {
		var me = this, defaultConfig = {
			el : window,
			type : 'Events',
			ev : null,
			bubbles : false,
			cancelable : false
		}
		config = me.join(defaultConfig, config);
		if(!$kit.isEmpty(config.ev)) {
			if(document.createEvent) {
				var e = document.createEvent(config.type);
				e.initEvent(config.ev, config.bubbles, config.cancelable);
				config.el.dispatchEvent(e);
			} else {
				config.el.fireEvent('on' + config.ev);
			}
		}
	},
	/**
	 * set event extra info
	 * @param {Event}
	 * @private
	 */
	evExtra : function(ev) {
		var me = this;
		var pageX = ev.pageX || ev.clientX + me.viewport().scrollLeft;
		var pageY = ev.pageY || ev.clientY + me.viewport().scrollTop;
		var offsetX = ev.offsetY || ev.layerX;
		var offsetY = ev.offsetY || ev.layerY;
		return me.merge({
			pageX : pageX,
			pageY : pageY,
			offsetX : offsetX,
			offsetY : offsetY
		}, me.evPos(ev))
	},
	/**
	 * get event coordinate info
	 * @param {Event}
	 * @private
	 */
	evPos : function(ev) {
		if(ev.type.indexOf("touch") == 0 && ev.targetTouches && ev.targetTouches.length) {
			return {
				firstFingerClientX : ev.targetTouches[0].clientX,
				firstFingerClientY : ev.targetTouches[0].clientY,
				firstFingerPageX : ev.targetTouches[0].pageX,
				firstFingerPageY : ev.targetTouches[0].pageY
			}
		}
		return {
			firstFingerClientX : ev.clientX,
			firstFingerClientY : ev.clientY,
			firstFingerPageX : ev.pageX,
			firstFingerPageY : ev.pageY
		}
	},
	// -----------------------------------object manipulate-----------------------------------
	/**
	 * 合并对象，生成一个新的对象
	 * @param {Object ...}
	 * @return {Object}
	 */
	join : function() {
		var a = arguments, b = {};
		if(a.length == 0) {
			return;
		}
		for(var i = 0; i < a.length; i++) {
			for(var r in a[i]) {
				if(!$kit.isEmpty(a[i][r])) {
					b[r] = a[i][r];
				}
			}
		}
		return b;
	},
	/**
	 * 合并对象，后面所有的对象的属性都加到第一个身上
	 * @param {Object ...}
	 * @return {Object}
	 */
	merge : function() {
		var a = arguments;
		if(a.length < 2) {
			return;
		}
		if(a[0] != null) {
			for(var i = 1; i < a.length; i++) {
				for(var r in a[i]) {
					a[0][r] = a[i][r];
				}
			}
		}
		return a[0];
	},
	/**
	 * 合并对象，后面所有的对象的属性都加到第一个身上，注意，如果第一个有了，则不覆盖
	 * @param {Object ...}
	 * @return {Object}
	 */
	mergeIf : function() {
		var a = arguments;
		if(a.length < 2) {
			return;
		}
		for(var i = 1; i < a.length; i++) {
			for(var r in a[i]) {
				if(a[0][r] == null) {
					a[0][r] = a[i][r];
				}
			}
		}
		return a[0];
	},
	/**
	 * is collection include object
	 */
	/*
	has : function(collection, object, ignoreCase) {
	if( typeof (collection) == "undefined" || typeof (object) == "undefined") {
	return false;
	}
	var me = this, flag = false, ignoreCase = (ignoreCase == true ? ignoreCase : false);
	if(me.isAry(collection)) {
	for(var i = 0; i < collection.length; i++) {
	if(collection[i] == object || (ignoreCase && collection[i].toLowerCase() == object.toLowerCase())) {
	flag = true;
	break;
	}
	}
	} else {
	if(collection != null) {
	if( object in collection) {
	flag = true;
	} else if(ignoreCase) {
	for(var p in collection) {
	if(p.toString().toLowerCase() == object.toString().toLowerCase()) {
	flag = true;
	break;
	}
	}
	}
	}
	}
	return flag;
	},*/

	// -----------------------------------log-----------------------------------
	/**
	 * 简单的log
	 * @param {String} info
	 * @param {Object} config
	 */
	log : function(info, config) {
		try {
			var me = this;
			config = me.merge({
				borderColor : "#000",
				container : null
			}, config);
			if(me.isAry(info)) {
				info = info.join("");
			}
			if(document.body) {
				var div;
				if(config.container == null) {
					div = document.body.appendChild(document.createElement("div"));
				} else {
					div = config.container.appendChild(document.createElement("div"));
				}
				div.className = "J_Debug_Info";
				div.style.borderBottom = "1px solid " + config.borderColor || "#000";
				try {
					div.innerHTML += info;
				} catch (e) {
					div.innerHTML += e.toString();
				}
			} else {
				alert(info);
			}
		} catch(e) {
			alert("error!" + e);
			throw e;
		}
	},
	/**
	 * 清空log
	 */
	clsLog : function() {
		var me = this;
		var a = me.els8cls("J_Debug_Info");
		while(a.length) {
			a[0].parentNode.removeChild(a[0]);
		}
	},
	// -----------------------------------else-----------------------------------
	/**
	 * 返回随机数
	 * @private
	 */
	only : function() {
		var rnd = Math.random(10000);
		return new Date().getTime().toString() + '_' + rnd.toString().substr(2, 10);
	},
	/**
	 * generate unique DOM id
	 * @return {String}
	 */
	onlyId : function() {
		var me = this;
		var id = me.CONSTANTS.KIT_DOM_ID_PREFIX + me.only();
		var count;
		if(arguments.length == 1) {
			count = arguments[0];
		} else {
			count = 0;
		}
		count++;
		if(count > me.CONSTANTS.MAX_CYCLE_COUNT) {
			throw "error!";
		}
		if(!me.isEmpty(me.el8id(id))) {
			return me.onlyId(count);
		}
		return id
	},
	/**
	 * 判断iOS版本信息
	 * @return {Object}
	 */
	iOSInfo : function() {
		var me = this, regExp_appleDevice = /\(([a-z; ]+)CPU ([a-z ]*)OS ([\d_]+) like Mac OS X/i;
		var ver, device, re;
		if(regExp_appleDevice.test(navigator.userAgent)) {
			var a = navigator.userAgent.match(regExp_appleDevice);
			ver = a[3].toString().trim();
			ver = ver.replace(/_/g, ".");
			device = a[1].toString().trim();
			device = device.substring(0, device.indexOf(";"));
			re = {
				device : device,
				ver : ver
			}
		}
		return re;
	},
	// each : function(config) {
	// var me = this;
	// var a = config.array;
	// for(var i = 0; i < a.length; i++) {
	// if(me.inAry(config.exclude, a[i])) {
	// continue;
	// } else {
	// config.fn.call(config.scope || this, a[i], i, a);
	// }
	// }
	// },
	/**
	 * 数组遍历
	 * @param {Array|NodeList}
	 * @param {Function} fn 遍历执行方法，执行方法中返回false值，则停止继续遍历
	 * @param {Object} [scope] 执行方法的this指针
	 */
	each : function(ary, fn, scope) {
		if(ary == null) {
			return;
		}
		var me = this;
		if(me.isFn(fn)) {
			if(me.isAry(ary)) {
				for(var i = 0; i < ary.length; i++) {
					var re = fn.call(scope || window, ary[i], i, ary);
					if(re == false) {
						break;
					}
				}
			} else if(me.isObj(ary)) {
				var i = 0;
				for(var k in ary) {
					i++;
					var re = fn.call(scope || window, ary[k], k, ary, i);
					if(re == false) {
						break;
					}
				}
			}
		}
	},
	/**
	 * 合并字符串
	 * @param {Array|Map}
	 * @param {String} connectStr 链接每个属性的字符
	 * @param {String} 遍历Map的时候，链接key与value的字符
	 * @return {String}
	 */
	concat : function(o, connectStr, connectOper) {
		if($kit.isStr(o)) {
			return o;
		}
		var connectStr = '&' || connectStr;
		var connectOper = '=' || connectOper;
		if($kit.isAry(o)) {
			return o.join(connectStr);
		}
		var reStr = [];
		this.each(o, function(v, k) {
			reStr.push(k + connectOper + v);
		});
		return reStr.join(connectStr);
	},
	/**
	 * 简单继承subClass inherit superClass
	 * @param {Object} config
	 * @param {Object} config.child 子类
	 * @param {Object} config.father 父类
	 */
	inherit : function(config) {
		var me = this, child = config.child, father = config.father;
		
		var _arguments = undefined || config.arguments;
		try {
			_arguments = arguments.callee.caller.arguments;
		} catch(e) {
			//don`t pass arguments of constructor
		}
		me.mergeIf(child.prototype, new father(_arguments));
		child.prototype.constructor = child;
		child.superClass = father;
	},
	/**
	 * 模板的简单实现
	 * @param {String} templ 模板文本
	 * @param {Map} data 替换对象
	 * <pre>
	 * render('this is ${obj}', {
	 * 	obj : 'car'
	 * });
	 * 结果：this is car
	 * </pre>
	 */
	tpl : function(templ, data) {
		// 充分利用变量，为单个节点提速
		// 正则尽快匹配失败
		// 理论上可以作为JSON的key，支持很多字符
		return templ.replace(/(\$)(\{([^}]*)\})/gm, function(value, clear, origin, key) {
			key = key.split('.');
			value = data[key.shift()];
			for(var i = 0; i < key.length; i++) {
				value = value[key[i]];
			}
			return (value === null || value === undefined) ? (!!clear ? '' : origin) : value;
		});
	}
}
/**
 * $Kit的实例，直接通过这个实例访问$Kit所有方法
 * @type $Kit
 */
$kit = new $Kit();
/**
 * dom ready event
 * @memberOf $Kit
 * @member $
 * @function
 * @instance
 * @param {Function}
 */
$kit.$ = function(fn) {
	document.addEventListener('DOMContentLoaded', fn, false);
}
/* array */
/**
 * 数组扩展
 * @class $Kit.Array
 * @requires kit.js
 * @see <a href="https://github.com/xueduany/KitJs/blob/master/KitJs/src/js/array.js">Source code</a>
 */
$Kit.Array = function(config) {
	//
}
$Kit.Array.prototype =
/**
 * lends $Kit.Array.prototype
 */
{
	/**
	 * 从小到大排序
	 * @param {Number}
	 * @param {Number}
	 * @return {Array}
	 * @private
	 */
	SORT_ASC : function(left, right) {
		return left - right;
	},
	/**
	 * 从大到小排序
	 * @param {Number}
	 * @param {Number}
	 * @return {Array}
	 * @private
	 */
	SORT_DESC : function(left, right) {
		return right - left;
	},
	/**
	 * 判断是否存在
	 * @param {Array}
	 * @param {Object}
	 * @param {Object} config
	 * @param {Boolean} config.ignoreCase 判断是否相等时候，是否忽略大小写
	 * @return {Boolean}
	 */
	hs : function(ary, check, setting) {
		var me = this;
		if(!$kit.isAry(ary)) {
			return;
		}
		var defaultSetting = {
			ignoreCase : false
		}
		var setting = $kit.merge(defaultSetting, setting);
		for(var i = 0; i < ary.length; i++) {
			var o = ary[i];
			if(o == check//
			|| (setting.ignoreCase && o.toString().toLowerCase() == check.toString().toLowerCase())) {
				return true;
			}
		}
		return false;
	},
	/**
	 * 向数组中添加元素
	 * @param {Array}
	 * @param {Object|Array}
	 * @param {Object} config
	 * @param {Boolean} config.ifExisted 为true时候，则进行存在判断，存在则不加，为false，直接第一个数组冗余相加
	 * @param {Boolean} config.ignoreCase 判断是否相等时候，是否忽略大小写
	 */
	ad : function(ary, add, setting) {
		var me = this;
		if(!$kit.isAry(ary)) {
			return;
		}
		var defaultSetting = {
			ifExisted : false,
			ignoreCase : false
		}
		var setting = $kit.merge(defaultSetting, setting);
		if($kit.isAry(add)) {
			for(var i = 0; i < add.length; i++) {
				me.ad(ary, add[i], setting);
			}
		} else {
			if(setting.ifExisted && ary.length > 0) {
				for(var i = 0; i < ary.length; i++) {
					var o = ary[i];
					if(o == add//
					|| (setting.ignoreCase && o.toString().toLowerCase() == add.toString().toLowerCase())) {
						break;
					} else if(i == ary.length - 1) {
						ary.push(add);
					}
				}
			} else {
				ary.push(add);
			}
		}
	},
	/**
	 * 数组删除元素
	 * @param {Array}
	 * @param {Object|Array}
	 * @param {Object} config
	 * @param {Boolean} config.ignoreCase 判断是否相等时候，是否忽略大小写
	 * @param {Boolean} config.isGlobal 是否全局检查，不仅仅删除第一个发现的
	 */
	rm : function(ary, del, setting) {
		var me = this;
		if(!$kit.isAry(ary)) {
			return;
		}
		var defaultSetting = {
			ignoreCase : false,
			isGlobal : true
		}
		var setting = $kit.merge(defaultSetting, setting);
		if($kit.isAry(del)) {
			for(var i = 0; i < del.length; i++) {
				me.rm(ary, del[i], setting);
			}
		} else {
			for(var i = 0; i < ary.length; i++) {
				var o = ary[i];
				if(o == del//
				|| (setting.ignoreCase && o.toString().toLowerCase() == del.toString().toLowerCase())) {
					ary.splice(i, 1);
					if(setting.isGlobal) {
						continue;
					} else {
						break;
					}
				}
			}
		}
	},
	/**
	 * 排序
	 * @param {Array}
	 * @param {String} param 排序类型，目前支持ASC从小到大,DESC从大到小两种类型
	 * @rettun {Array} 返回被排序的数组
	 */
	sort : function(ary, param) {
		var me = this;
		if($kit.isEmpty(ary) || $kit.isEmpty(param)) {
			return;
		}
		if($kit.isFn(param)) {
			return ary.sort(param);
		} else {
			switch (param) {
				case "ASC" :
					return ary.sort(me.SORT_ASC);
				case "DESC" :
					return ary.sort(me.SORT_DESC);
			}
		}
	},
	/**
	 * 通过比较方法取得值
	 * @param {Array}
	 * @param {Function} validateFn 遍历数组，执行该方法，等方法返回true时候，获得数组中对应值。方法传入三个参数，当前元素，当前元素索引，数组
	 * @param {Object} [scope] 执行方法时候的this指针
	 * @return {Object}
	 */
	get : function(ary, validateFn, scope) {
		var scope = scope || window;
		for(var i = 0; i < ary.length; i++) {
			if(validateFn.call(scope, ary[i], i, ary) == true) {
				return ary[i];
			}
		}
	},
	/**
	 * 遍历数组，获得数组中元素以xxx文字开头的
	 * @param {Array}
	 * @param {String}
	 * @return {Object}
	 */
	getTextBeginWith : function(ary, beginWithText) {
		var me = this;
		return me.get(ary, function(o) {
			if(o.indexOf(beginWithText) == 0) {
				return true;
			}
		});
	},
	/**
	 * 把字符串按照分隔符转换成数组
	 * @param {String}
	 * @param {String} [separate] 默认值为','
	 * @return {Array}
	 */
	parse : function(str, separate) {
		var separate = ',' || separate;
		return (str && str.split(separate)) || [str]
	},
	/**
	 * 过滤满足条件的数组元素
	 * @param {Array}
	 * @param {Function} 方法传入三个参数，当前元素，当前元素索引，数组
	 * @return {Array}
	 */
	filter : function(ary, compare) {
		var re = [];
		$kit.each(ary, function(o, i, ary) {
			if(compare(o, i, ary)) {
				re.push(o);
			}
		});
		return re;
	},
	/**
	 * 返回指定元素在数组的第几个，从0开始
	 * @param {Array}
	 * @param {Object}
	 * @return {Number}
	 */
	indexOf : function(ary, obj) {
		var index = -1;
		if(obj != null) {
			$kit.each(ary, function(o, idx) {
				if(obj == o) {
					index = idx;
					return false;
				}
			});
		}
		return index;
	},
	/**
	 * 克隆一个新的数组
	 * @param {Array}
	 * @param {Array}
	 */
	clone : function(ary) {
		var re = [];
		$kit.each(ary, function(o) {
			re.push(o);
		});
		return re;
	},
	/**
	 * 删除数组中空的元素
	 * @param {Array}
	 * @return {Array}
	 */
	delEmpty : function(ary) {
		for(var i = 0; i < ary.length; ) {
			if(ary[i] == '' || ary[i] == null) {
				ary.splice(i, 1);
			} else {
				i++;
			}
		}
		return ary;
	},
	/**
	 * 删除重复元素，不保证顺序
	 * @param {Array}
	 * @return {Array}
	 */
	rmRepeat : function(ary) {
		var tmp = {}, re = [];
		$kit.each(ary, function(o) {
			tmp[o] = 1;
		});
		for(var o in tmp) {
			re.push(o);
		}
		return re;
	}
};
/**
 * $Kit.Array实例，直接通过这个实例访问$Kit.Array所有方法
 * @global
 * @type $Kit.Array
 * @name $kit.array
 * @alias $kit.ary
 */
$kit.ary = $kit.array = new $Kit.Array();
/* date */
/**
 * 日期时间扩展
 * @class $Kit.Date
 * @requires kit.js
 * @requires math.js
 * @requires array.js
 * @see <a href="https://github.com/xueduany/KitJs/blob/master/KitJs/src/js/date.js">Source code</a>
 */
$Kit.Date = function() {
	//
}
$kit.merge($Kit.Date.prototype,
/**
 * @lends $Kit.Date.prototype
 */
{
	/**
	 * 返回时间，单位秒 dd:dd:dd 时:分:秒
	 * @param {String}
	 * @return {Date}
	 */
	parseTime : function(timeStr) {
		if($kit.isEmpty(timeStr)) {
			return undefined;
		}
		var me = this;
		var a = timeStr.split(":");
		var hours, minutes, seconds;
		if(a.length == 3) {
			hours = parseFloat(a[0]);
			minutes = parseFloat(a[1]);
			seconds = parseFloat(a[2]);
		} else if(a.length == 2) {
			hours = 0;
			minutes = parseFloat(a[0]);
			seconds = parseFloat(a[1]);
		} else {
			hours = 0;
			minutes = 0;
			seconds = parseFloat(a[0]);
		}
		var time = hours * 60 * 60 + minutes * 60 + seconds;
		time = Math.round(time);
		return time;
	},
	/**
	 * 返回时间字符串 dd:dd:dd，参数time，单位秒
	 * @param {String}
	 * @return {String}
	 */
	formatTime : function(time) {
		time = parseFloat(time);
		var me = this;
		var minutes = Math.floor(time / 60);
		var hours = Math.floor(minutes / 60);
		minutes = minutes % 60;
		var seconds = (time % 60).toFixed(0);
		return $kit.math.padZero(hours, 2) + ":" + $kit.math.padZero(minutes, 2) + ":" + $kit.math.padZero(seconds, 2);
	},
	/**
	 * 是否闰年
	 * @param {Date}
	 * @return {Boolean}
	 */
	isLeapYear : function(year) {
		return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0))
	},
	/**
	 * 一个月有多少天
	 * @param {Date}
	 * @param {String}
	 * @return {Number}
	 */
	getDaysInMonth : function(year, month) {
		return [31, (this.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month]
	},
	//格式
	validParts : /E{1}|D{1}|F{1}|a{1}|hh{1}|HH{1}|SS{1}|ss{1}|dd{1}|mm{1}|MM{1}|yy(?:yy){1}/g,
	dateSplitRegExp : /(E{1}|D{1}|F{1}|a{1}|hh{1}|HH{1}|SS{1}|ss{1}|dd{1}|mm{1}|MM{1}|yy(?:yy){1})/g,
	nonpunctuation : /[^ -\/:-@\[-`{-~\t\n\r\D]+/g,
	/**
	 * 解析时间格式
	 * @param {String} format 如"yyyy年MM月dd日"
	 */
	parseFormat : function(format) {
		// IE treats \0 as a string end in inputs (truncating the value),
		// so it's a bad format delimiter, anyway
		var separators = $kit.array.delEmpty(format.replace(this.validParts, '\0').split('\0')), //
		parts = $kit.array.delEmpty((format.match(this.validParts))), //
		date = $kit.array.delEmpty(format.split(this.dateSplitRegExp));
		if(!separators || !separators.length || !parts || parts.length == 0) {
			throw new Error("Invalid date format.");
		}
		return {
			separators : separators,
			parts : parts,
			date : date
		};
	},
	/**
	 * 日期语言包
	 * @member
	 * @enum
	 * @see <a href="https://github.com/xueduany/KitJs/blob/master/KitJs/src/js/date.js">查看代码</a>
	 */
	languagePack : {
		/**
		 * 英文月份语言包
		 */
		en : {
			days : ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
			daysShort : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
			daysMin : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"],
			months : ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
			monthsShort : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			weekStart : 0
		},
		/**
		 * 中文月份语言包
		 */
		cn : {
			days : ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
			daysShort : ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
			daysMin : ["七", "一", "二", "三", "四", "五", "六", "七"],
			months : ["一月份", "二月份", "三月份", "四月份", "五月份", "六月份", "七月份", "八月份", "九月份", "十月份", "十一月", "十二月"],
			monthsShort : ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
			weekStart : 1
		}
	},
	/**
	 * 解析日期
	 * @param {Date}
	 * @param {DateFormat} format 需要$kit.date.parseFormat('yyyy年MM月dd日')
	 * @param {String} [language] 语言包，默认中文
	 * @return {Date}
	 */
	parseDate : function(date, format, language) {
		var me = this;
		if( date instanceof Date) {
			return date;
		}
		language = language || 'en';
		if(/^[-+]\d+[dmwy]([\s,]+[-+]\d+[dmwy])*$/.test(date)) {
			var part_re = /([-+]\d+)([dmwy])/, parts = date.match(/([-+]\d+)([dmwy])/g), part, dir;
			date = new Date();
			for(var i = 0; i < parts.length; i++) {
				part = part_re.exec(parts[i]);
				dir = parseInt(part[1]);
				switch(part[2]) {
					case 'd':
						date.setDate(date.getDate() + dir);
						break;
					case 'm':
						this.moveMonth.call(date, dir);
						break;
					case 'w':
						date.setDate(date.getDate() + dir * 7);
						break;
					case 'y':
						this.moveYear(date, dir);
						break;
				}
			}
			return new Date(date.getFullYear(), date.getMonth(), date.getDate(), 0, 0, 0);
		}
		var parts = date ? date.match(this.nonpunctuation) : [], date = new Date(), val, filtered;
		date = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 0, 0, 0);
		if(parts.length == format.parts.length) {
			for(var i = 0, cnt = format.parts.length; i < cnt; i++) {
				val = parseInt(parts[i], 10) || 1;
				switch(format.parts[i]) {
					case 'MM':
						filtered = $kit.array.filter(this.languagePack[language].months, function(o, index, ary) {
							var m = ary.slice(0, parts[i].length), p = parts[i].slice(0, m.length);
							return m == p;
						});
						if(filtered && filtered.length) {
							val = $kit.array.indexOf(this.languagePack[language].months, filtered[0]) + 1;
						}
						break;
					case 'M':
						filtered = $kit.array.filter(this.languagePack[language].monthsShort, function(o, index, ary) {
							var m = ary.slice(0, parts[i].length), p = parts[i].slice(0, m.length);
							return m == p;
						});
						if(filtered && filtered.length) {
							val = $kit.array.indexOf(this.languagePack[language].monthsShort, filtered[0]) + 1;
						}
						break;
				}
				switch(format.parts[i]) {
					case 'dd':
					case 'd':
						date.setDate(val);
						break;
					case 'mm':
					case 'm':
					case 'MM':
					case 'M':
						date.setMonth(val - 1);
						break;
					case 'yy':
						date.setFullYear(2000 + val);
						break;
					case 'yyyy':
						date.setFullYear(val);
						break;
				}
			}
		}
		return date;
	},
	/**
	 * 改变月份
	 * @param {Date}
	 * @param {Number} dir 月份增量
	 * @return {Date}
	 */
	addMonths : function(date, months) {
		return this.moveMonth(date, months)
	},
	/**
	 * 改变月份
	 * @param {Date}
	 * @param {Number} dir 月份增量
	 * @return {Date}
	 * @private
	 */
	moveMonth : function(date, dir) {
		if(!dir)
			return date;
		var new_date = new Date(date.valueOf()), day = new_date.getDate(), month = new_date.getMonth(), mag = Math.abs(dir), new_month, test;
		dir = dir > 0 ? 1 : -1;
		if(mag == 1) {
			test = dir == -1
			// If going back one month, make sure month is not current month
			// (eg, Mar 31 -> Feb 31 == Feb 28, not Mar 02)
			? function() {
				return new_date.getMonth() == month;
			}
			// If going forward one month, make sure month is as expected
			// (eg, Jan 31 -> Feb 31 == Feb 28, not Mar 02)
			: function() {
				return new_date.getMonth() != new_month;
			};
			new_month = month + dir;
			new_date.setMonth(new_month);
			// Dec -> Jan (12) or Jan -> Dec (-1) -- limit expected date to 0-11
			if(new_month < 0 || new_month > 11)
				new_month = (new_month + 12) % 12;
		} else {
			// For magnitudes >1, move one month at a time...
			for(var i = 0; i < mag; i++)
			// ...which might decrease the day (eg, Jan 31 to Feb 28, etc)...
			new_date = this.moveMonth(new_date, dir);
			// ...then reset the day, keeping it in the new month
			new_month = new_date.getMonth();
			new_date.setDate(day);
			test = function() {
				return new_month != new_date.getMonth();
			};
		}
		// Common date-resetting loop -- if date is beyond end of month, make it
		// end of month
		while(test()) {
			new_date.setDate(--day);
			new_date.setMonth(new_month);
		}
		return new_date;
	},
	/**
	 * 改变年份
	 * @param {Date}
	 * @param {Number} dir 年份增量
	 * @return {Date}
	 */
	addYears : function(date, years) {
		return this.moveYear(date, years)
	},
	/**
	 * 改变年份
	 * @param {Date}
	 * @param {Number} dir 年份增量
	 * @return {Date}
	 * @private
	 */
	moveYear : function(date, dir) {
		return this.moveMonth(date, dir * 12);
	},
	/**
	 * 按照format格式（如yyyy年MM月dd日）格式化日期
	 * @param {Date}
	 * @param {DateFormat} format 需要$kit.date.parseFormat('yyyy年MM月dd日')
	 * @param {String} [language] 语言
	 * @return {String}
	 */
	formatDate : function(date, format, language) {
		var me = this;
		var val = {
			d : date.getDate(),
			m : date.getMonth() + 1,
			M : me.languagePack[language].monthsShort[date.getMonth()],
			MM : me.languagePack[language].months[date.getMonth()],
			yy : date.getFullYear().toString().substring(2),
			yyyy : date.getFullYear()
		};
		val.dd = (val.d < 10 ? '0' : '') + val.d;
		val.mm = (val.m < 10 ? '0' : '') + val.m;
		var date = [];
		$kit.each(format.date, function(o) {
			if(val[o]) {
				date.push(val[o]);
			} else {
				date.push(o);
			}
		});
		return date.join('');
	},
	/**
	 * 返回当前日期，时分秒为00
	 * @return {Date}
	 */
	dateNow : function() {
		var d = new Date();
		d.setMinutes(0);
		d.setSeconds(0);
		d.setHours(0);
		d.setMilliseconds(0);
		return d;
	},
	/**
	 * 增加天数
	 * @param {Date}
	 * @param {Number}
	 * @return {Date}
	 */
	addDays : function(date, days) {
		date.setDate(date.getDate() + days);
	}
});
/**
 * $Kit.Date的实例，直接通过这个实例访问$Kit.Date所有方法
 * @global
 * @type $Kit.Date
 */
$kit.date = new $Kit.Date();
/* dom */
/**
 * Dom扩展
 * @class $Kit.Dom
 * @requires kit.js
 * @see <a href="https://github.com/xueduany/KitJs/blob/master/KitJs/src/js/dom.js">Source code</a>
 */
$Kit.Dom = function() {
	//
}
$kit.merge($Kit.Dom.prototype,
/**
 * @lends $Kit.Dom.prototype
 */
{
	/**
	 * 根据tagName查找父元素
	 * @param {Element}
	 * @param {String}
	 * @param {Element} [topEl] 到topEl停止查找
	 * @return {Element|Null}
	 */
	parentEl8tag : function(el, tagName, topEl) {
		var topEl = topEl || document.body;
		return $kit.parentEl(el, function(p) {
			if(p.tagName && p.tagName.toLowerCase() == tagName.toLowerCase()) {
				return true;
			}
			if(p == topEl) {
				return false;
			}
		}, topEl);
	},
	/**
	 * 根据className查找父元素
	 * @param {Element}
	 * @param {String}
	 * @param {Element} [topEl] 到topEl停止查找
	 * @return {Element|Null}
	 */
	parentEl8cls : function(el, cls, topEl) {
		var topEl = topEl || document.body;
		return $kit.parentEl(el, function(p) {
			if($kit.hsCls(p, cls)) {
				return true;
			}
			if(p == topEl) {
				return false;
			}
		}, topEl);
	},
	/**
	 * 注入script块
	 * @param {Object} config
	 * @param {String} config.id 注入script的id，自定义，只要与现有dom里面的元素id不相同即可
	 * @param {String} [config.url] 注入script的加载url
	 * @param {String} [config.text] 注入script的script内容
	 * @param {String} [config.then] 注入script的加载完毕的回调方法
	 * @param {String} [config.scope] 注入script的回调方法的this指针
	 * @return {Element} script
	 */
	injectJs : function() {
		if(arguments.length == 1) {
			var config = arguments[0];
			if(config.id && $kit.el8id(config.id)) {
				return;
			}
			config.id = config.id || $kit.onlyId();
			var where = config.where || window.document.body;
			var script = document.createElement('script');
			$kit.attr(script, 'type', 'text/javascript');
			if(config.id) {
				$kit.attr(script, 'id', config.id);
			}
			if(!$kit.isEmpty(config.url)) {
				script.src = config.url;
				if(!$kit.isEmpty(config.then)) {
					var scope = config.scope || window;
					script.onload = function() {
						config.then.call(scope, script);
					}
				}
			} else if(!$kit.isEmpty(config.text)) {
				script.innerHTML = config.text;
				if(!$kit.isEmpty(config.then)) {
					setTimeout(function() {
						config.then.call(scope, script);
					}, 0);
				}
			}
			where.appendChild(script);
			return script;
		}
	},
	/**
	 * 注入css
	 * @param {Object} config
	 * @param {String} config.id 注入css的id，自定义，只要与现有dom里面的元素id不相同即可
	 * @param {String} [config.url] 注入css的url
	 * @param {String} [config.text] 如果没有url的话，写入style的文本
	 * @return {Element} css
	 */
	injectCss : function() {
		if(arguments.length == 1) {
			var config = arguments[0];
			if(config.id && $kit.el8id(config.id)) {
				return;
			}
			// Takes a string of css, inserts it into a `<style>`, then injects it in at the very top of the `<head>`. This ensures any user-defined styles will take precedence.
			var where = config.where || document.getElementsByTagName('head')[document.getElementsByTagName('head').length - 1];
			var css;
			if(!$kit.isEmpty(config.url)) {
				css = document.createElement('link');
				config.id && $kit.attr(css, 'id', config.id);
				$kit.attr(css, {
					rel : 'stylesheet',
					href : config.url
				});
			} else if(!$kit.isEmpty(config.text)) {
				css = document.createElement('style');
				config.id && $kit.attr(css, 'id', config.id);
				$kit.attr(css, 'type', 'text/css');
				css.innerHTML = config.text;
			}
			if(css) {
				$kit.insEl({
					pos : 'last',
					what : css,
					where : where
				});
			}
			return css;
		}
	},
	/**
	 * 删除所有样式
	 * @param {String}
	 * @param {Element}
	 */
	rmClsAll : function(cls, top) {
		var a = $kit.el8cls(cls, top);
		while(a) {
			$kit.rmCls(a, cls);
			a = $kit.el8cls(cls, top);
		}
	},
	/**
	 * 通过className前缀取className
	 * @param {Element}
	 * @param {String}
	 * @return {NodeList||Null}
	 */
	getClassNameByPrefix : function(el, prefixCls) {
		var clsAry = el.className.split(/\s+/);
		var re = null;
		if(clsAry && clsAry.length) {
			$kit.each(clsAry, function(o) {
				if(o.indexOf(prefixCls) == 0) {
					re = o;
					return false;
				}
			});
		}
		return re;
	},
	/**
	 * innerText
	 * @param {Element}
	 * @param {String} [text]
	 * @return {String|Null}
	 */
	text : function(el, text) {
		if(el != null && 'innerText' in el) {
			if(text) {
				el.innerText = text;
			} else {
				return el.innerText;
			}
		} else {
			if(text) {
				el.textContent = text;
			} else {
				return el.textContent;
			}
		}
	},
	/**
	 * innerHTML
	 * @param {Element}
	 * @param {String} [html]
	 * @return {String|Null}
	 */
	html : function(el, html) {
		if(html) {
			if(el != null && 'innerHTML' in el) {
				el.innerHTML = html;
			}
		} else {
			return el.innerHTML;
		}
	},
	/**
	 * clone a node
	 * @param {Element}
	 * @return {Element}
	 */
	clone : function(node) {
		if(document.createElement("nav").cloneNode(true).outerHTML !== "<:nav></:nav>") {
			return node.cloneNode(true);
		} else {
			var fragment = document.createDocumentFragment(), //
			doc = fragment.createElement ? fragment : document;
			doc.createElement(node.tagName);
			var div = doc.createElement('div');
			fragment.appendChild(div);
			div.innerHTML = node.outerHTML;
			return div.firstChild;
		}
	},
	/**
	 * height
	 * @param {Element}
	 * @param {Number} [value]
	 * @return {Number|Null}
	 */
	height : function(node, value) {
		var me = this;
		if(node != null) {
			if(value == null) {
				return $kit.offset(node).height;
			}
			if(document.compatMode == "BackCompat") {
				node.style.height = value;
			} else {
				node.style.height = value//
				- ($kit.css(node, 'border-top-width') || 0)//
				- ($kit.css(node, 'border-bottom-width') || 0)//
				- ($kit.css(node, 'padding-top-width') || 0)//
				- ($kit.css(node, 'padding-bottom-width') || 0)//
				;
			}
		}
		return $kit.viewport().clientHeight;
	},
	/**
	 * width
	 * @param {Element}
	 * @param {Number} [value]
	 * @return {Number|Null}
	 */
	width : function(node, value) {
		var me = this;
		if(node != null) {
			if(value == null) {
				return $kit.offset(node).width;
			}
			if(document.compatMode == "BackCompat") {
				node.style.width = value;
			} else {
				node.style.width = value//
				- ($kit.css(node, 'border-left-width') || 0)//
				- ($kit.css(node, 'border-right-width') || 0)//
				- ($kit.css(node, 'padding-left-width') || 0)//
				- ($kit.css(node, 'padding-right-width') || 0)//
				;
			}
		}
		return $kit.viewport().clientHeight;
	},
	/**
	 * height + padding
	 * @param {Element}
	 * @return {Number}
	 */
	innerHeight : function(node) {
		var me = this;
		if(document.compatMode == "BackCompat") {
			return $kit.css(node, 'height') - ($kit.css(node, 'border-top-width') || 0) - ($kit.css(node, 'border-bottom-width') || 0);
		}
		return $kit.css(node, 'height') + ($kit.css(node, 'padding-top-width') || 0) - ($kit.css(node, 'padding-bottom-width') || 0);
	},
	/**
	 * width + padding
	 * @param {Element}
	 * @return {Number}
	 */
	innerWidth : function(node) {
		var me = this;
		if(document.compatMode == "BackCompat") {
			return $kit.css(node, 'width') - ($kit.css(node, 'border-left-width') || 0) - ($kit.css(node, 'border-right-width') || 0);
		}
		return $kit.css(node, 'width') + ($kit.css(node, 'padding-left-width') || 0) - ($kit.css(node, 'padding-right-width') || 0);
	},
	/**
	 * height + padding + border
	 * @param {Element}
	 * @return {Number}
	 */
	outerHeight : function(node) {
		var me = this;
		if(document.compatMode == "BackCompat") {
			return $kit.css(node, 'height');
		}
		return $kit.css(node, 'height') + ($kit.css(node, 'padding-top-width') || 0) - ($kit.css(node, 'padding-bottom-width') || 0)//
		+ ($kit.css(node, 'border-top-width') || 0) + ($kit.css(node, 'border-bottom-width') || 0);
	},
	/**
	 * width + padding + border
	 * @param {Element}
	 * @return {Number}
	 */
	outerWidth : function(node) {
		var me = this;
		if(document.compatMode == "BackCompat") {
			return $kit.css(node, 'width');
		}
		return $kit.css(node, 'width') + ($kit.css(node, 'padding-left-width') || 0) - ($kit.css(node, 'padding-right-width') || 0)//
		+ ($kit.css(node, 'border-left-width') || 0) + ($kit.css(node, 'border-right-width') || 0);
	},
	/**
	 * 包围一个html
	 * @param {Element}
	 * @param {String}
	 */
	wrap : function(node, html) {
		if($kit.isNode(html)) {
			//
		} else if($kit.isStr(html)) {
			html = $kit.newHTML(html).childNodes[0];
		} else {
			return;
		}
		$kit.insEl({
			where : node,
			what : html,
			pos : 'before'
		});
		html.appendChild(node);
		return html;
	},
	/**
	 * 序列化form元素
	 * @param {Element}
	 * @param {String}
	 * @return {String}
	 */
	serialize : function(form) {
		if($kit.isNode(form)) {
			if(form.tagName.toLowerCase() == 'form') {
				var formEls = {};
				$kit.each($kit.el('input', form), function(o) {
					if(o.type && o.type.toString.toLowerCase() == 'text') {
						formEls[o.name] = o.value;
					} else if(o.type && o.type.toString().toLowerCase() == 'radio') {
						if(o.checked) {
							formEls[o.name] = o.value;
						}
					} else if(o.type && o.type.toString().toLowerCase() == 'checkbox') {
						if(o.checked) {
							if(!$kit.isAry(formEls[o.name])) {
								formEls[o.name] = [formEls[o.name]];
							}
							formEls[o.name].push(o.value);
						}
					}
				});
				$kit.each($kit.el('textarea', form), function(o) {
					formEls[o.name] = o.value;
				});
				$kit.each($kit.el('select', form), function(o) {
					formEls[o.name] = o.options[o.selectedIndex].value;
				});
				var re = [];
				for(var key in formEls) {
					if($kit.isAry(formEls[key])) {
						re.push(key + '=' + encodeURIComponent(formEls[key].join(',')));
					} else {
						re.push(key + '=' + encodeURIComponent(formEls[key]));
					}
				}
				return re.join('');
			}
			return form.name + '=' + encodeURIComponent($kit.val(form));
		}
	},
	/**
	 * 计算元素相对于他的offsetParent的偏移
	 * @param {Element}
	 * @return {Number} top 距离顶部
	 * @return {Number} left 距离左边
	 * @return {Number} height 高度
	 * @return {Number} width 宽度
	 * @return {Number} bottom 底部距离顶部
	 * @return {Number} right 右边距离最左边
	 * @return {Number} middleTop 中间距离顶部
	 * @return {Number} middleLeft 中间距离最左边
	 */
	position : function(el) {
		var me = this;
		if($kit.isEmpty(el)) {
			return;
		}
		var top = el.offsetTop, //
		left = el.offsetLeft, //
		width = el.offsetWidth, //
		height = el.offsetHeight;
		return {
			top : top,
			left : left,
			width : width,
			height : height,
			bottom : top + height,
			right : left + width,
			middleTop : top + height / 2,
			middleLeft : left + width / 2
		}
	},
	/**
	 * 计算元素相对于他的可视区的偏移
	 * @param {Element}
	 * @return {Number} top 距离顶部
	 * @return {Number} left 距离左边
	 * @return {Number} height 高度
	 * @return {Number} width 宽度
	 * @return {Number} bottom 底部距离顶部
	 * @return {Number} right 右边距离最左边
	 * @return {Number} middleTop 中间距离顶部
	 * @return {Number} middleLeft 中间距离最左边
	 */
	clientOffset : function(el) {
		var me = this;
		if($kit.isEmpty(el)) {
			return;
		}
		var offset = $kit.offset(el);
		var viewport = $kit.viewport();
		return {
			top : offset.top - viewport.scrollTop,
			left : offset.left - viewport.scrollLeft,
			width : offset.width,
			height : offset.height,
			bottom : offset.bottom - viewport.scrollTop,
			right : offset.right - viewport.scrollLeft,
			middleTop : offset.top - viewport.scrollTop + offset.height / 2,
			middleLeft : offset.left - viewport.scrollLeft + offset.width / 2
		}
	},
	/**
	 * 获取当一个元素居中的时候，他相对于doc绝对值的top,bottom,left,right等等
	 * @param {Element}
	 * @return {Number} top 距离顶部
	 * @return {Number} left 距离左边
	 * @return {Number} height 高度
	 * @return {Number} width 宽度
	 * @return {Number} bottom 底部距离顶部
	 * @return {Number} right 右边距离最左边
	 * @return {Number} middleTop 中间距离顶部
	 * @return {Number} middleLeft 中间距离最左边
	 */
	offsetCenter : function(el) {
		var me = this;
		var viewport = $kit.viewport();
		var offset = $kit.offset(el);
		return {
			top : viewport.clientHeight / 2 + viewport.scrollTop - offset.height / 2,
			left : viewport.clientWidth / 2 + viewport.scrollLeft - offset.width / 2,
			right : viewport.clientWidth / 2 + viewport.scrollLeft + offset.width / 2,
			bottom : viewport.clientHeight / 2 + viewport.scrollTop + offset.height / 2,
			middleTop : viewport.clientHeight / 2 + viewport.scrollTop,
			middleLeft : viewport.clientWidth / 2 + viewport.scrollLeft
		}
	},
	/**
	 * 获取当一个元素居中的时候，他相对于可视区域的top,bottom,left,right等等
	 * @param {Element}
	 * @return {Number} top 距离顶部
	 * @return {Number} left 距离左边
	 * @return {Number} height 高度
	 * @return {Number} width 宽度
	 * @return {Number} bottom 底部距离顶部
	 * @return {Number} right 右边距离最左边
	 * @return {Number} middleTop 中间距离顶部
	 * @return {Number} middleLeft 中间距离最左边
	 */
	clientOffsetCenter : function(el) {
		var me = this;
		var viewport = $kit.viewport();
		var offset = $kit.offset(el);
		return {
			top : (viewport.clientHeight / 2 - offset.height / 2),
			left : (viewport.clientWidth / 2 - offset.width / 2),
			right : (viewport.clientWidth / 2 + offset.width / 2),
			bottom : (viewport.clientHeight / 2 + offset.height / 2),
			middleTop : (viewport.clientHeight / 2),
			middleLeft : (viewport.clientWidth / 2)
		}
	},
	/**
	 * 获取当一个元素居中的时候，他相对于可视区域的top,bottom,left,right等等
	 * @param {Element}
	 * @return {Number} top 距离顶部
	 * @return {Number} left 距离左边
	 * @return {Number} height 高度
	 * @return {Number} width 宽度
	 * @return {Number} bottom 底部距离顶部
	 * @return {Number} right 右边距离最左边
	 * @return {Number} middleTop 中间距离顶部
	 * @return {Number} middleLeft 中间距离最左边
	 */
	clientPos : function(el) {
		var me = this;
		var viewport = $kit.viewport();
		var offset = $kit.offset(el);
		return {
			top : viewport.clientHeight / 2 + viewport.scrollTop - offset.height / 2,
			left : viewport.clientWidth / 2 + viewport.scrollLeft - offset.width / 2,
			right : viewport.clientWidth / 2 + viewport.scrollLeft + offset.width / 2,
			bottom : viewport.clientHeight / 2 + viewport.scrollTop + offset.height / 2,
			middleTop : viewport.clientHeight / 2 + viewport.scrollTop,
			middleLeft : viewport.clientWidth / 2 + viewport.scrollLeft
		}
	},
	/**
	 * 交换两个element的位置
	 */
	switchPos : function(origin, target) {
		var targetPos;
		if(target.previousSibling) {
			targetPos = {
				pos : 'after',
				where : target.previousSibling
			}
		} else {
			targetPos = {
				pos : 'first',
				where : target.parentNode
			}
		}
		$kit.insEl({
			pos : 'after',
			where : origin,
			what : target
		});
		$kit.insEl($kit.merge({
			what : origin
		}, targetPos));
	}
});
/**
 * $Kit.Dom的实例，直接通过这个实例访问$Kit.Dom所有方法
 * @global
 * @name $kit.dom
 * @alias $kit.d
 * @type $Kit.Dom
 */
$kit.dom = $kit.d = new $Kit.Dom();
/* selector */
/*
 * Sizzle CSS Selector Engine
 *  Copyright 2011, The Dojo Foundation
 *  Released under the MIT, BSD, and GPL Licenses.
 *  More information: http://sizzlejs.com/
 *
 * version: 1.5.1-34
 * update 2012/04/26
 */

(function() {
	var chunker = /((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g, expando = "sizcache" + (Math.random() + '').replace('.', ''), done = 0, toString = Object.prototype.toString, hasDuplicate = false, baseHasDuplicate = true, rBackslash = /\\/g, rNonWord = /\W/;

	// Here we check if the JavaScript engine is using some sort of
	// optimization where it does not always call our comparision
	// function. If that is the case, discard the hasDuplicate value.
	//   Thus far that includes Google Chrome.
	[0, 0].sort(function() {
		baseHasDuplicate = false;
		return 0;
	});
	var Sizzle = function(selector, context, results, seed) {
		results = results || [];
		context = context || document;

		var origContext = context;

		if(context.nodeType !== 1 && context.nodeType !== 9) {
			return [];
		}

		if(!selector || typeof selector !== "string") {
			return results;
		}

		var m, set, checkSet, extra, ret, cur, pop, i, prune = true, contextXML = Sizzle.isXML(context), parts = [], soFar = selector;

		// Reset the position of the chunker regexp (start from head)
		do {
			chunker.exec("");
			m = chunker.exec(soFar);

			if(m) {
				soFar = m[3];

				parts.push(m[1]);

				if(m[2]) {
					extra = m[3];
					break;
				}
			}
		} while ( m );

		if(parts.length > 1 && origPOS.exec(selector)) {

			if(parts.length === 2 && Expr.relative[parts[0]]) {
				set = posProcess(parts[0] + parts[1], context, seed);

			} else {
				set = Expr.relative[parts[0]] ? [context] : Sizzle(parts.shift(), context);

				while(parts.length) {
					selector = parts.shift();

					if(Expr.relative[selector]) {
						selector += parts.shift();
					}
					set = posProcess(selector, set, seed);
				}
			}

		} else {
			// Take a shortcut and set the context if the root selector is an ID
			// (but not if it'll be faster if the inner selector is an ID)
			if(!seed && parts.length > 1 && context.nodeType === 9 && !contextXML && Expr.match.ID.test(parts[0]) && !Expr.match.ID.test(parts[parts.length - 1])) {
				ret = Sizzle.find(parts.shift(), context, contextXML);
				context = ret.expr ? Sizzle.filter( ret.expr, ret.set )[0] : ret.set[0];
			}

			if(context) {
				ret = seed ? {
					expr : parts.pop(),
					set : makeArray(seed)
				} : Sizzle.find(parts.pop(), parts.length === 1 && (parts[0] === "~" || parts[0] === "+") && context.parentNode ? context.parentNode : context, contextXML);
				set = ret.expr ? Sizzle.filter(ret.expr, ret.set) : ret.set;

				if(parts.length > 0) {
					checkSet = makeArray(set);

				} else {
					prune = false;
				}

				while(parts.length) {
					cur = parts.pop();
					pop = cur;

					if(!Expr.relative[cur]) {
						cur = "";
					} else {
						pop = parts.pop();
					}

					if(pop == null) {
						pop = context;
					}

					Expr.relative[ cur ](checkSet, pop, contextXML);
				}

			} else {
				checkSet = parts = [];
			}
		}

		if(!checkSet) {
			checkSet = set;
		}

		if(!checkSet) {
			Sizzle.error(cur || selector);
		}

		if(toString.call(checkSet) === "[object Array]") {
			if(!prune) {
				results.push.apply(results, checkSet);

			} else if(context && context.nodeType === 1) {
				for( i = 0; checkSet[i] != null; i++) {
					if(checkSet[i] && (checkSet[i] === true || checkSet[i].nodeType === 1 && Sizzle.contains(context, checkSet[i]))) {
						results.push(set[i]);
					}
				}

			} else {
				for( i = 0; checkSet[i] != null; i++) {
					if(checkSet[i] && checkSet[i].nodeType === 1) {
						results.push(set[i]);
					}
				}
			}

		} else {
			makeArray(checkSet, results);
		}

		if(extra) {
			Sizzle(extra, origContext, results, seed);
			Sizzle.uniqueSort(results);
		}

		return results;
	};

	Sizzle.uniqueSort = function(results) {
		if(sortOrder) {
			hasDuplicate = baseHasDuplicate;
			results.sort(sortOrder);

			if(hasDuplicate) {
				for(var i = 1; i < results.length; i++) {
					if(results[i] === results[i - 1]) {
						results.splice(i--, 1);
					}
				}
			}
		}

		return results;
	};

	Sizzle.matches = function(expr, set) {
		return Sizzle(expr, null, null, set);
	};

	Sizzle.matchesSelector = function(node, expr) {
		return Sizzle(expr, null, null, [node]).length > 0;
	};

	Sizzle.find = function(expr, context, isXML) {
		var set, i, len, match, type, left;

		if(!expr) {
			return [];
		}

		for( i = 0, len = Expr.order.length; i < len; i++) {
			type = Expr.order[i];

			if(( match = Expr.leftMatch[type].exec(expr))) {
				left = match[1];
				match.splice(1, 1);

				if(left.substr(left.length - 1) !== "\\") {
					match[1] = (match[1] || "").replace(rBackslash, "");
					set = Expr.find[ type ](match, context, isXML);

					if(set != null) {
						expr = expr.replace(Expr.match[type], "");
						break;
					}
				}
			}
		}

		if(!set) {
			set = typeof context.getElementsByTagName !== "undefined" ? context.getElementsByTagName("*") : [];
		}

		return {
			set : set,
			expr : expr
		};
	};

	Sizzle.filter = function(expr, set, inplace, not) {
		var match, anyFound, type, found, item, filter, left, i, pass, old = expr, result = [], curLoop = set, isXMLFilter = set && set[0] && Sizzle.isXML(set[0]);

		while(expr && set.length) {
			for(type in Expr.filter ) {
				if(( match = Expr.leftMatch[type].exec(expr)) != null && match[2]) {
					filter = Expr.filter[type];
					left = match[1];
					anyFound = false;

					match.splice(1, 1);

					if(left.substr(left.length - 1) === "\\") {
						continue;
					}

					if(curLoop === result) {
						result = [];
					}

					if(Expr.preFilter[type]) {
						match = Expr.preFilter[ type ](match, curLoop, inplace, result, not, isXMLFilter);

						if(!match) {
							anyFound = found = true;

						} else if(match === true) {
							continue;
						}
					}

					if(match) {
						for( i = 0; ( item = curLoop[i]) != null; i++) {
							if(item) {
								found = filter(item, match, i, curLoop);
								pass = not ^ found;

								if(inplace && found != null) {
									if(pass) {
										anyFound = true;

									} else {
										curLoop[i] = false;
									}

								} else if(pass) {
									result.push(item);
									anyFound = true;
								}
							}
						}
					}

					if(found !== undefined) {
						if(!inplace) {
							curLoop = result;
						}
						expr = expr.replace(Expr.match[type], "");

						if(!anyFound) {
							return [];
						}

						break;
					}
				}
			}

			// Improper expression
			if(expr === old) {
				if(anyFound == null) {
					Sizzle.error(expr);

				} else {
					break;
				}
			}
			old = expr;
		}

		return curLoop;
	};

	Sizzle.error = function(msg) {
		throw new Error("Syntax error, unrecognized expression: " + msg);
	};
	/**
	 * Utility function for retreiving the text value of an array of DOM nodes
	 * @param {Array|Element} elem
	 */
	var getText = Sizzle.getText = function(elem) {
		var i, node, nodeType = elem.nodeType, ret = "";

		if(nodeType) {
			if(nodeType === 1 || nodeType === 9 || nodeType === 11) {
				// Use textContent for elements
				// innerText usage removed for consistency of new lines (see #11153)
				if( typeof elem.textContent === "string") {
					return elem.textContent;
				} else {
					// Traverse it's children
					for( elem = elem.firstChild; elem; elem = elem.nextSibling) {
						ret += getText(elem);
					}
				}
			} else if(nodeType === 3 || nodeType === 4) {
				return elem.nodeValue;
			}
		} else {

			// If no nodeType, this is expected to be an array
			for( i = 0; ( node = elem[i]); i++) {
				// Do not traverse comment nodes
				if(node.nodeType !== 8) {
					ret += getText(node);
				}
			}
		}
		return ret;
	};
	var Expr = Sizzle.selectors = {
		order : ["ID", "NAME", "TAG"],

		match : {
			ID : /#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,
			CLASS : /\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,
			NAME : /\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,
			ATTR : /\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(?:(['"])(.*?)\3|(#?(?:[\w\u00c0-\uFFFF\-]|\\.)*)|)|)\s*\]/,
			TAG : /^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,
			CHILD : /:(only|nth|last|first)-child(?:\(\s*(even|odd|(?:[+\-]?\d+|(?:[+\-]?\d*)?n\s*(?:[+\-]\s*\d+)?))\s*\))?/,
			POS : /:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,
			PSEUDO : /:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/
		},

		leftMatch : {},

		attrMap : {
			"class" : "className",
			"for" : "htmlFor"
		},

		attrHandle : {
			href : function(elem) {
				return elem.getAttribute("href");
			},
			type : function(elem) {
				return elem.getAttribute("type");
			}
		},

		relative : {
			"+" : function(checkSet, part) {
				var isPartStr = typeof part === "string", isTag = isPartStr && !rNonWord.test(part), isPartStrNotTag = isPartStr && !isTag;

				if(isTag) {
					part = part.toLowerCase();
				}

				for(var i = 0, l = checkSet.length, elem; i < l; i++) {
					if(( elem = checkSet[i])) {
						while(( elem = elem.previousSibling) && elem.nodeType !== 1) {
						}

						checkSet[i] = isPartStrNotTag || elem && elem.nodeName.toLowerCase() === part ? elem || false : elem === part;
					}
				}

				if(isPartStrNotTag) {
					Sizzle.filter(part, checkSet, true);
				}
			},
			">" : function(checkSet, part) {
				var elem, isPartStr = typeof part === "string", i = 0, l = checkSet.length;

				if(isPartStr && !rNonWord.test(part)) {
					part = part.toLowerCase();

					for(; i < l; i++) {
						elem = checkSet[i];

						if(elem) {
							var parent = elem.parentNode;
							checkSet[i] = parent.nodeName.toLowerCase() === part ? parent : false;
						}
					}

				} else {
					for(; i < l; i++) {
						elem = checkSet[i];

						if(elem) {
							checkSet[i] = isPartStr ? elem.parentNode : elem.parentNode === part;
						}
					}

					if(isPartStr) {
						Sizzle.filter(part, checkSet, true);
					}
				}
			},
			"" : function(checkSet, part, isXML) {
				var nodeCheck, doneName = done++, checkFn = dirCheck;

				if( typeof part === "string" && !rNonWord.test(part)) {
					part = part.toLowerCase();
					nodeCheck = part;
					checkFn = dirNodeCheck;
				}

				checkFn("parentNode", part, doneName, checkSet, nodeCheck, isXML);
			},
			"~" : function(checkSet, part, isXML) {
				var nodeCheck, doneName = done++, checkFn = dirCheck;

				if( typeof part === "string" && !rNonWord.test(part)) {
					part = part.toLowerCase();
					nodeCheck = part;
					checkFn = dirNodeCheck;
				}

				checkFn("previousSibling", part, doneName, checkSet, nodeCheck, isXML);
			}
		},

		find : {
			ID : function(match, context, isXML) {
				if( typeof context.getElementById !== "undefined" && !isXML) {
					var m = context.getElementById(match[1]);
					// Check parentNode to catch when Blackberry 4.6 returns
					// nodes that are no longer in the document #6963
					return m && m.parentNode ? [m] : [];
				}
			},
			NAME : function(match, context) {
				if( typeof context.getElementsByName !== "undefined") {
					var ret = [], results = context.getElementsByName(match[1]);

					for(var i = 0, l = results.length; i < l; i++) {
						if(results[i].getAttribute("name") === match[1]) {
							ret.push(results[i]);
						}
					}

					return ret.length === 0 ? null : ret;
				}
			},
			TAG : function(match, context) {
				if( typeof context.getElementsByTagName !== "undefined") {
					return context.getElementsByTagName(match[1]);
				}
			}
		},
		preFilter : {
			CLASS : function(match, curLoop, inplace, result, not, isXML) {
				match = " " + match[1].replace(rBackslash, "") + " ";

				if(isXML) {
					return match;
				}

				for(var i = 0, elem; ( elem = curLoop[i]) != null; i++) {
					if(elem) {
						if(not ^ (elem.className && (" " + elem.className + " ").replace(/[\t\n\r]/g, " ").indexOf(match) >= 0)) {
							if(!inplace) {
								result.push(elem);
							}

						} else if(inplace) {
							curLoop[i] = false;
						}
					}
				}

				return false;
			},
			ID : function(match) {
				return match[1].replace(rBackslash, "");
			},
			TAG : function(match, curLoop) {
				return match[1].replace(rBackslash, "").toLowerCase();
			},
			CHILD : function(match) {
				if(match[1] === "nth") {
					if(!match[2]) {
						Sizzle.error(match[0]);
					}

					match[2] = match[2].replace(/^\+|\s*/g, '');

					// parse equations like 'even', 'odd', '5', '2n', '3n+2', '4n-1', '-n+6'
					var test = /(-?)(\d*)(?:n([+\-]?\d*))?/.exec(match[2] === "even" && "2n" || match[2] === "odd" && "2n+1" || !/\D/.test(match[2]) && "0n+" + match[2] || match[2]);

					// calculate the numbers (first)n+(last) including if they are negative
					match[2] = (test[1] + (test[2] || 1)) - 0;
					match[3] = test[3] - 0;
				} else if(match[2]) {
					Sizzle.error(match[0]);
				}

				// TODO: Move to normal caching system
				match[0] = done++;

				return match;
			},
			ATTR : function(match, curLoop, inplace, result, not, isXML) {
				var name = match[1] = match[1].replace(rBackslash, "");

				if(!isXML && Expr.attrMap[name]) {
					match[1] = Expr.attrMap[name];
				}

				// Handle if an un-quoted value was used
				match[4] = (match[4] || match[5] || "" ).replace(rBackslash, "");

				if(match[2] === "~=") {
					match[4] = " " + match[4] + " ";
				}

				return match;
			},
			PSEUDO : function(match, curLoop, inplace, result, not) {
				if(match[1] === "not") {
					// If we're dealing with a complex expression, or a simple one
					if((chunker.exec(match[3]) || "" ).length > 1 || /^\w/.test(match[3])) {
						match[3] = Sizzle(match[3], null, null, curLoop);

					} else {
						var ret = Sizzle.filter(match[3], curLoop, inplace, true ^ not);

						if(!inplace) {
							result.push.apply(result, ret);
						}

						return false;
					}

				} else if(Expr.match.POS.test(match[0]) || Expr.match.CHILD.test(match[0])) {
					return true;
				}

				return match;
			},
			POS : function(match) {
				match.unshift(true);

				return match;
			}
		},

		filters : {
			enabled : function(elem) {
				return elem.disabled === false && elem.type !== "hidden";
			},
			disabled : function(elem) {
				return elem.disabled === true;
			},
			checked : function(elem) {
				return elem.checked === true;
			},
			selected : function(elem) {
				// Accessing this property makes selected-by-default
				// options in Safari work properly
				if(elem.parentNode) {
					elem.parentNode.selectedIndex
				}

				return elem.selected === true;
			},
			parent : function(elem) {
				return !!elem.firstChild;
			},
			empty : function(elem) {
				return !elem.firstChild;
			},
			has : function(elem, i, match) {
				return !!Sizzle(match[3], elem).length;
			},
			header : function(elem) {
				return (/h\d/i).test(elem.nodeName);
			},
			text : function(elem) {
				var attr = elem.getAttribute("type"), type = elem.type;
				// IE6 and 7 will map elem.type to 'text' for new HTML5 types (search, etc)
				// use getAttribute instead to test this case
				return elem.nodeName.toLowerCase() === "input" && "text" === type && (attr === type || attr === null );
			},
			radio : function(elem) {
				return elem.nodeName.toLowerCase() === "input" && "radio" === elem.type;
			},
			checkbox : function(elem) {
				return elem.nodeName.toLowerCase() === "input" && "checkbox" === elem.type;
			},
			file : function(elem) {
				return elem.nodeName.toLowerCase() === "input" && "file" === elem.type;
			},
			password : function(elem) {
				return elem.nodeName.toLowerCase() === "input" && "password" === elem.type;
			},
			submit : function(elem) {
				var name = elem.nodeName.toLowerCase();
				return (name === "input" || name === "button") && "submit" === elem.type;
			},
			image : function(elem) {
				return elem.nodeName.toLowerCase() === "input" && "image" === elem.type;
			},
			reset : function(elem) {
				var name = elem.nodeName.toLowerCase();
				return (name === "input" || name === "button") && "reset" === elem.type;
			},
			button : function(elem) {
				var name = elem.nodeName.toLowerCase();
				return name === "input" && "button" === elem.type || name === "button";
			},
			input : function(elem) {
				return (/input|select|textarea|button/i).test(elem.nodeName);
			},
			focus : function(elem) {
				return elem === elem.ownerDocument.activeElement;
			}
		},
		setFilters : {
			first : function(elem, i) {
				return i === 0;
			},
			last : function(elem, i, match, array) {
				return i === array.length - 1;
			},
			even : function(elem, i) {
				return i % 2 === 0;
			},
			odd : function(elem, i) {
				return i % 2 === 1;
			},
			lt : function(elem, i, match) {
				return i < match[3] - 0;
			},
			gt : function(elem, i, match) {
				return i > match[3] - 0;
			},
			nth : function(elem, i, match) {
				return match[3] - 0 === i;
			},
			eq : function(elem, i, match) {
				return match[3] - 0 === i;
			}
		},
		filter : {
			PSEUDO : function(elem, match, i, array) {
				var name = match[1], filter = Expr.filters[name];

				if(filter) {
					return filter(elem, i, match, array);

				} else if(name === "contains") {
					return (elem.textContent || elem.innerText || getText([elem]) || "").indexOf(match[3]) >= 0;

				} else if(name === "not") {
					var not = match[3];

					for(var j = 0, l = not.length; j < l; j++) {
						if(not[j] === elem) {
							return false;
						}
					}

					return true;

				} else {
					Sizzle.error(name);
				}
			},
			CHILD : function(elem, match) {
				var first, last, doneName, parent, cache, count, diff, type = match[1], node = elem;

				switch ( type ) {
					case "only":
					case "first":
						while(( node = node.previousSibling)) {
							if(node.nodeType === 1) {
								return false;
							}
						}

						if(type === "first") {
							return true;
						}
						node = elem;

					/* falls through */
					case "last":
						while(( node = node.nextSibling)) {
							if(node.nodeType === 1) {
								return false;
							}
						}

						return true;

					case "nth":
						first = match[2];
						last = match[3];

						if(first === 1 && last === 0) {
							return true;
						}
						doneName = match[0];
						parent = elem.parentNode;

						if(parent && (parent[expando] !== doneName || !elem.nodeIndex)) {
							count = 0;

							for( node = parent.firstChild; node; node = node.nextSibling) {
								if(node.nodeType === 1) {
									node.nodeIndex = ++count;
								}
							}

							parent[expando] = doneName;
						}
						diff = elem.nodeIndex - last;

						if(first === 0) {
							return diff === 0;

						} else {
							return (diff % first === 0 && diff / first >= 0 );
						}
				}
			},
			ID : function(elem, match) {
				return elem.nodeType === 1 && elem.getAttribute("id") === match;
			},
			TAG : function(elem, match) {
				return (match === "*" && elem.nodeType === 1) || !!elem.nodeName && elem.nodeName.toLowerCase() === match;
			},
			CLASS : function(elem, match) {
				return (" " + (elem.className || elem.getAttribute("class")) + " ").indexOf(match) > -1;
			},
			ATTR : function(elem, match) {
				var name = match[1], result = Sizzle.attr ? Sizzle.attr(elem, name) : Expr.attrHandle[name] ? Expr.attrHandle[ name ](elem) : elem[name] != null ? elem[name] : elem.getAttribute(name), value = result + "", type = match[2], check = match[4];

				return result == null ? type === "!=" : !type && Sizzle.attr ? result != null : type === "=" ? value === check : type === "*=" ? value.indexOf(check) >= 0 : type === "~=" ? (" " + value + " ").indexOf(check) >= 0 : !check ? value && result !== false : type === "!=" ? value !== check : type === "^=" ? value.indexOf(check) === 0 : type === "$=" ? value.substr(value.length - check.length) === check : type === "|=" ? value === check || value.substr(0, check.length + 1) === check + "-" : false;
			},
			POS : function(elem, match, i, array) {
				var name = match[2], filter = Expr.setFilters[name];

				if(filter) {
					return filter(elem, i, match, array);
				}
			}
		}
	};

	var origPOS = Expr.match.POS, fescape = function(all, num) {
		return "\\" + (num - 0 + 1);
	};
	for(var type in Expr.match ) {
		Expr.match[type] = new RegExp(Expr.match[type].source + (/(?![^\[]*\])(?![^\(]*\))/.source));
		Expr.leftMatch[type] = new RegExp(/(^(?:.|\r|\n)*?)/.source + Expr.match[type].source.replace(/\\(\d+)/g, fescape));
	}
	// Expose origPOS
	// "global" as in regardless of relation to brackets/parens
	Expr.match.globalPOS = origPOS;

	var makeArray = function(array, results) {
		array = Array.prototype.slice.call(array, 0);

		if(results) {
			results.push.apply(results, array);
			return results;
		}

		return array;
	};
	// Perform a simple check to determine if the browser is capable of
	// converting a NodeList to an array using builtin methods.
	// Also verifies that the returned array holds DOM nodes
	// (which is not the case in the Blackberry browser)
	try {
		Array.prototype.slice.call( document.documentElement.childNodes, 0 )[0].nodeType
	} catch( e ) {
		makeArray = function(array, results) {
			var i = 0, ret = results || [];

			if(toString.call(array) === "[object Array]") {
				Array.prototype.push.apply(ret, array);

			} else {
				if( typeof array.length === "number") {
					for(var l = array.length; i < l; i++) {
						ret.push(array[i]);
					}

				} else {
					for(; array[i]; i++) {
						ret.push(array[i]);
					}
				}
			}

			return ret;
		};
	}

	var sortOrder, siblingCheck;

	if(document.documentElement.compareDocumentPosition) {
		sortOrder = function(a, b) {
			if(a === b) {
				hasDuplicate = true;
				return 0;
			}

			if(!a.compareDocumentPosition || !b.compareDocumentPosition) {
				return a.compareDocumentPosition ? -1 : 1;
			}

			return a.compareDocumentPosition(b) & 4 ? -1 : 1;
		};
	} else {
		sortOrder = function(a, b) {
			// The nodes are identical, we can exit early
			if(a === b) {
				hasDuplicate = true;
				return 0;

				// Fallback to using sourceIndex (in IE) if it's available on both nodes
			} else if(a.sourceIndex && b.sourceIndex) {
				return a.sourceIndex - b.sourceIndex;
			}

			var al, bl, ap = [], bp = [], aup = a.parentNode, bup = b.parentNode, cur = aup;

			// If the nodes are siblings (or identical) we can do a quick check
			if(aup === bup) {
				return siblingCheck(a, b);

				// If no parents were found then the nodes are disconnected
			} else if(!aup) {
				return -1;

			} else if(!bup) {
				return 1;
			}

			// Otherwise they're somewhere else in the tree so we need
			// to build up a full list of the parentNodes for comparison
			while(cur) {
				ap.unshift(cur);
				cur = cur.parentNode;
			}
			cur = bup;

			while(cur) {
				bp.unshift(cur);
				cur = cur.parentNode;
			}
			al = ap.length;
			bl = bp.length;

			// Start walking down the tree looking for a discrepancy
			for(var i = 0; i < al && i < bl; i++) {
				if(ap[i] !== bp[i]) {
					return siblingCheck(ap[i], bp[i]);
				}
			}

			// We ended someplace up the tree so do a sibling check
			return i === al ? siblingCheck(a, bp[i], -1) : siblingCheck(ap[i], b, 1);
		};
		siblingCheck = function(a, b, ret) {
			if(a === b) {
				return ret;
			}

			var cur = a.nextSibling;

			while(cur) {
				if(cur === b) {
					return -1;
				}
				cur = cur.nextSibling;
			}

			return 1;
		};
	}

	// Check to see if the browser returns elements by name when
	// querying by getElementById (and provide a workaround)
	(function() {
		// We're going to inject a fake input element with a specified name
		var form = document.createElement("div"), id = "script" + (new Date()).getTime(), root = document.documentElement;

		form.innerHTML = "<a name='" + id + "'/>";

		// Inject it into the root element, check its status, and remove it quickly
		root.insertBefore(form, root.firstChild);

		// The workaround has to do additional checks after a getElementById
		// Which slows things down for other browsers (hence the branching)
		if(document.getElementById(id)) {
			Expr.find.ID = function(match, context, isXML) {
				if( typeof context.getElementById !== "undefined" && !isXML) {
					var m = context.getElementById(match[1]);

					return m ? m.id === match[1] || typeof m.getAttributeNode !== "undefined" && m.getAttributeNode("id").nodeValue === match[1] ? [m] : undefined : [];
				}
			};

			Expr.filter.ID = function(elem, match) {
				var node = typeof elem.getAttributeNode !== "undefined" && elem.getAttributeNode("id");

				return elem.nodeType === 1 && node && node.nodeValue === match;
			};
		}

		root.removeChild(form);

		// release memory in IE
		root = form = null;
	})();
	(function() {
		// Check to see if the browser returns only elements
		// when doing getElementsByTagName("*")

		// Create a fake element
		var div = document.createElement("div");
		div.appendChild(document.createComment(""));

		// Make sure no comments are found
		if(div.getElementsByTagName("*").length > 0) {
			Expr.find.TAG = function(match, context) {
				var results = context.getElementsByTagName(match[1]);

				// Filter out possible comments
				if(match[1] === "*") {
					var tmp = [];

					for(var i = 0; results[i]; i++) {
						if(results[i].nodeType === 1) {
							tmp.push(results[i]);
						}
					}
					results = tmp;
				}

				return results;
			};
		}

		// Check to see if an attribute returns normalized href attributes
		div.innerHTML = "<a href='#'></a>";

		if(div.firstChild && typeof div.firstChild.getAttribute !== "undefined" && div.firstChild.getAttribute("href") !== "#") {

			Expr.attrHandle.href = function(elem) {
				return elem.getAttribute("href", 2);
			};
		}

		// release memory in IE
		div = null;
	})();

	if(document.querySelectorAll) {(function() {
			var oldSizzle = Sizzle, div = document.createElement("div"), id = "__sizzle__";

			div.innerHTML = "<p class='TEST'></p>";

			// Safari can't handle uppercase or unicode characters when
			// in quirks mode.
			if(div.querySelectorAll && div.querySelectorAll(".TEST").length === 0) {
				return;
			}
			Sizzle = function(query, context, extra, seed) {
				context = context || document;

				// Only use querySelectorAll on non-XML documents
				// (ID selectors don't work in non-HTML documents)
				if(!seed && !Sizzle.isXML(context)) {
					// See if we find a selector to speed up
					var match = /^(\w+$)|^\.([\w\-]+$)|^#([\w\-]+$)/.exec(query);

					if(match && (context.nodeType === 1 || context.nodeType === 9)) {
						// Speed-up: Sizzle("TAG")
						if(match[1]) {
							return makeArray(context.getElementsByTagName(query), extra);

							// Speed-up: Sizzle(".CLASS")
						} else if(match[2] && Expr.find.CLASS && context.getElementsByClassName) {
							return makeArray(context.getElementsByClassName(match[2]), extra);
						}
					}

					if(context.nodeType === 9) {
						// Speed-up: Sizzle("body")
						// The body element only exists once, optimize finding it
						if(query === "body" && context.body) {
							return makeArray([context.body], extra);

							// Speed-up: Sizzle("#ID")
						} else if(match && match[3]) {
							var elem = context.getElementById(match[3]);

							// Check parentNode to catch when Blackberry 4.6 returns
							// nodes that are no longer in the document #6963
							if(elem && elem.parentNode) {
								// Handle the case where IE and Opera return items
								// by name instead of ID
								if(elem.id === match[3]) {
									return makeArray([elem], extra);
								}

							} else {
								return makeArray([], extra);
							}
						}

						try {
							return makeArray(context.querySelectorAll(query), extra);
						} catch(qsaError) {
						}

						// qSA works strangely on Element-rooted queries
						// We can work around this by specifying an extra ID on the root
						// and working up from there (Thanks to Andrew Dupont for the technique)
						// IE 8 doesn't work on object elements
					} else if(context.nodeType === 1 && context.nodeName.toLowerCase() !== "object") {
						var oldContext = context, old = context.getAttribute("id"), nid = old || id, hasParent = context.parentNode, relativeHierarchySelector = /^\s*[+~]/.test(query);

						if(!old) {
							context.setAttribute("id", nid);
						} else {
							nid = nid.replace(/'/g, "\\$&");
						}
						if(relativeHierarchySelector && hasParent) {
							context = context.parentNode;
						}

						try {
							if(!relativeHierarchySelector || hasParent) {
								return makeArray(context.querySelectorAll("[id='" + nid + "'] " + query), extra);
							}

						} catch(pseudoError) {
						} finally {
							if(!old) {
								oldContext.removeAttribute("id");
							}
						}
					}
				}

				return oldSizzle(query, context, extra, seed);
			};
			for(var prop in oldSizzle ) {
				Sizzle[prop] = oldSizzle[prop];
			}

			// release memory in IE
			div = null;
		})();
	}(function() {
		var html = document.documentElement, matches = html.matchesSelector || html.mozMatchesSelector || html.webkitMatchesSelector || html.msMatchesSelector;

		if(matches) {
			// Check to see if it's possible to do matchesSelector
			// on a disconnected node (IE 9 fails this)
			var disconnectedMatch = !matches.call(document.createElement("div"), "div"), pseudoWorks = false;

			try {
				// This should fail with an exception
				// Gecko does not error, returns false instead
				matches.call(document.documentElement, "[test!='']:sizzle");

			} catch( pseudoError ) {
				pseudoWorks = true;
			}

			Sizzle.matchesSelector = function(node, expr) {
				// Make sure that attribute selectors are quoted
				expr = expr.replace(/\=\s*([^'"\]]*)\s*\]/g, "='$1']");

				if(!Sizzle.isXML(node)) {
					try {
						if(pseudoWorks || !Expr.match.PSEUDO.test(expr) && !/!=/.test(expr)) {
							var ret = matches.call(node, expr);

							// IE 9's matchesSelector returns false on disconnected nodes
							if(ret || !disconnectedMatch ||
							// As well, disconnected nodes are said to be in a document
							// fragment in IE 9, so check for that
							node.document && node.document.nodeType !== 11) {
								return ret;
							}
						}
					} catch(e) {
					}
				}

				return Sizzle(expr, null, null, [node]).length > 0;
			};
		}
	})();
	(function() {
		var div = document.createElement("div");

		div.innerHTML = "<div class='test e'></div><div class='test'></div>";

		// Opera can't find a second classname (in 9.6)
		// Also, make sure that getElementsByClassName actually exists
		if(!div.getElementsByClassName || div.getElementsByClassName("e").length === 0) {
			return;
		}

		// Safari caches class attributes, doesn't catch changes (in 3.2)
		div.lastChild.className = "e";

		if(div.getElementsByClassName("e").length === 1) {
			return;
		}

		Expr.order.splice(1, 0, "CLASS");
		Expr.find.CLASS = function(match, context, isXML) {
			if( typeof context.getElementsByClassName !== "undefined" && !isXML) {
				return context.getElementsByClassName(match[1]);
			}
		};
		// release memory in IE
		div = null;
	})();

	function dirNodeCheck(dir, cur, doneName, checkSet, nodeCheck, isXML) {
		for(var i = 0, l = checkSet.length; i < l; i++) {
			var elem = checkSet[i];

			if(elem) {
				var match = false;
				elem = elem[dir];

				while(elem) {
					if(elem[expando] === doneName) {
						match = checkSet[elem.sizset];
						break;
					}

					if(elem.nodeType === 1 && !isXML) {
						elem[expando] = doneName;
						elem.sizset = i;
					}

					if(elem.nodeName.toLowerCase() === cur) {
						match = elem;
						break;
					}
					elem = elem[dir];
				}

				checkSet[i] = match;
			}
		}
	}

	function dirCheck(dir, cur, doneName, checkSet, nodeCheck, isXML) {
		for(var i = 0, l = checkSet.length; i < l; i++) {
			var elem = checkSet[i];

			if(elem) {
				var match = false;
				elem = elem[dir];

				while(elem) {
					if(elem[expando] === doneName) {
						match = checkSet[elem.sizset];
						break;
					}

					if(elem.nodeType === 1) {
						if(!isXML) {
							elem[expando] = doneName;
							elem.sizset = i;
						}

						if( typeof cur !== "string") {
							if(elem === cur) {
								match = true;
								break;
							}

						} else if(Sizzle.filter(cur, [elem]).length > 0) {
							match = elem;
							break;
						}
					}
					elem = elem[dir];
				}

				checkSet[i] = match;
			}
		}
	}

	if(document.documentElement.contains) {
		Sizzle.contains = function(a, b) {
			return a !== b && (a.contains ? a.contains(b) : true);
		};
	} else if(document.documentElement.compareDocumentPosition) {
		Sizzle.contains = function(a, b) {
			return !!(a.compareDocumentPosition(b) & 16);
		};
	} else {
		Sizzle.contains = function() {
			return false;
		};
	}

	Sizzle.isXML = function(elem) {
		// documentElement is verified for cases where it doesn't yet exist
		// (such as loading iframes in IE - #4833)
		var documentElement = ( elem ? elem.ownerDocument || elem : 0).documentElement;

		return documentElement ? documentElement.nodeName !== "HTML" : false;
	};
	var posProcess = function(selector, context, seed) {
		var match, tmpSet = [], later = "", root = context.nodeType ? [context] : context;

		// Position selectors must be done after the filter
		// And so must :not(positional) so we move all PSEUDOs to the end
		while(( match = Expr.match.PSEUDO.exec(selector))) {
			later += match[0];
			selector = selector.replace(Expr.match.PSEUDO, "");
		}
		selector = Expr.relative[selector] ? selector + "*" : selector;

		for(var i = 0, l = root.length; i < l; i++) {
			Sizzle(selector, root[i], tmpSet, seed);
		}

		return Sizzle.filter(later, tmpSet);
	};
	// EXPOSE

	window.Sizzle = Sizzle;

	/**
	 * 内嵌Sizzle最新版选择器，单独分离成一个Selector类，方便整合代码
	 * @class $Kit.Selector
	 * @requires kit.js
	 * @see <a href="https://github.com/xueduany/KitJs/blob/master/KitJs/src/js/selector.js">Source code</a>
	 */
	$Kit.Selector = function() {
		//
	};
	$kit.merge($Kit.Selector.prototype,
	/**
	 * @lends $Kit.Selector.prototype
	 */
	{
		/**
		 * sizzle选择器
		 * @param {Selector}
		 * @param {Element}
		 * @return {[Element]}
		 */
		el : function(selector, root) {
			return Sizzle(selector, root);
		},
		/**
		 * matches
		 * @method
		 * @param {Selector} selector
		 * @param {[Element]} elementsArray
		 * @return {Boolean}
		 */
		matches : Sizzle.matches,
		/**
		 * matchesSelector
		 * @method
		 * @param {Element} element
		 * @param {Selector} selector
		 * @return {Boolean}
		 */
		matchesSelector : Sizzle.matchesSelector,
		/**
		 * filter
		 * @private
		 */
		filter : Sizzle.filter,
		/**
		 * contains
		 * @private
		 */
		contains : Sizzle.contains,
		/**
		 * Utility function for retreiving the text value of an array of DOM nodes
		 * @method
		 * @param {Array|Element} elem
		 * @return {String}
		 */
		getText : Sizzle.getText,
		/**
		 * find
		 * @private
		 */
		find : Sizzle.find
	});
	/**
	 * $Kit.Selector实例，直接通过这个实例访问$Kit.Selector所有方法
	 * @global
	 * @type $Kit.Selector
	 */
	$kit.selector = new $Kit.Selector();
	/**
	 * 加载selector.js之后，可以使用sizzle选择器，使用$kit.$el方法
	 * @global
	 * @function
	 * @param {Selector} selector
	 * @param {Element} [context]
	 * @return {[Element]}
	 */
	$kit.$el = $kit.selector.el;
})();
/* datepicker */
/**
 * 功能强大的日历（中文，支持多选，划动多选，多语言支持，API操作，自定义事件，界面定制等等）
 * @class $kit.ui.DatePicker
 * @requires kit.js
 * @requires ieFix.js
 * @requires dom.js
 * @requires array.js
 * @see <a href="https://github.com/xueduany/KitJs/blob/master/KitJs/src/js/widget/DatePicker/datepicker.js">Source code</a>
 * @example
 * <a href="http://xueduany.github.com/KitJs/KitJs/demo/DatePicker/demo.html">Demo</a><br/>
 * <img src="http://xueduany.github.com/KitJs/KitJs/demo/DatePicker/demo.png">
 */
$kit.ui.DatePicker = function(config) {
	var me = this;
	me.config = $kit.join(me.constructor.defaultConfig, config);
}
$kit.merge($kit.ui.DatePicker,
/**
 * @lends $kit.ui.DatePicker
 */
{
	/**
	 * @enum
	 */
	defaultConfig : {
		kitWidgetName : 'kitjs-datepicker',
		/**
		 * 接受和输出的日期格式
		 * @type {String}
		 */
		dateFormat : 'yyyy年mm月dd日', //接受和输出的日期格式
		template : {
			pickerHTML : [//
			'<div class="datepicker">', //
			'<div class="datepicker-days">', //
			'<table class=" table-condensed">', //
			'${headHTML}', //
			'<tbody></tbody>', //
			'</table>', //
			'</div>', //
			'<div class="datepicker-months">', //
			'<table class="table-condensed">', //
			'${headHTML}', //
			'${contHTML}', //
			'</table>', //
			'</div>', //
			'<div class="datepicker-years">', //
			'<table class="table-condensed">', //
			'${headHTML}', //
			'${contHTML}', //
			'</table>', //
			'</div>', //
			'</div>'//
			].join(''),
			headHTML : [//
			'<thead>', //
			'<tr>', //
			'<th class="prev" onselectstart="return false"><i class="icon-arrow-left">&lt;</i></th>', //
			'<th colspan="5" class="switch"></th>', //
			'<th class="next" onselectstart="return false"><i class="icon-arrow-right">&gt;</i></th>', //
			'</tr>', //
			'</thead>'//
			].join(''),
			contHTML : '<tbody><tr><td colspan="7"></td></tr></tbody>',
			dropDownCls : 'dropdown-menu'
		},
		/**
		 * 语言，默认cn
		 * @type {String}
		 */
		language : 'cn',
		/**
		 * 初始显示的view，0为日历,1为月，2为年
		 * @type {Number}
		 */
		startView : 0,
		/**
		 * 初始日期
		 * @type {Date}
		 */
		date : undefined, //$kit.date.dateNow(),
		modes : [{
			clsName : 'days',
			navFnc : 'Month',
			navStep : 1
		}, {
			clsName : 'months',
			navFnc : 'FullYear',
			navStep : 1
		}, {
			clsName : 'years',
			navFnc : 'FullYear',
			navStep : 10
		}],
		/**
		 * 默认从date对象里面的本地化数据取得一周的开始时间
		 * @type {Number}
		 */
		weekStart : undefined,
		weekViewFormat : 'daysMin',
		monthViewFormat : 'monthsShort',
		/*
		 * 默认是否显示
		 * @type {Boolean}
		 */
		show : false,
		/**
		 * 能否多选
		 * @type {Boolean}
		 */
		canMultipleChoose : true,
		/**
		 * 多选时候输出分隔符
		 * @type {String}
		 */
		dateStringSeparator : ',',
		/**
		 * 多选时候输出类型，full为将选中的日期全部输出，short为输出选中日期的开头和结尾
		 * @type {String}
		 */
		shiftSelectOutType : 'full',
		/**
		 * 当输出类型为short时，比如选中了3月1日到3月10日，则输出"3月1日~3月10日",简短输出，只有开头+分隔符+结尾
		 * @type {String}
		 */
		shiftSelectOutTypeShortSeparator : '~'
	}
});
$kit.merge($kit.ui.DatePicker.prototype,
/**
 * @lends $kit.ui.DatePicker.prototype
 */
{
	/**
	 * main()入口
	 */
	init : function() {
		var me = this, config = me.config;
		me.language = config.language;
		me.format = $kit.date.parseFormat(config.dateFormat);
		me.buildHTML();
		//
		me.initEv();
		if(config.date) {
			if($kit.isDate(config.date)) {
				me.date = config.date;
				me.selectedDateAry = [new Date(config.date)];
			} else if($kit.isAry(config.date)) {
				me.date = config.date[0];
				me.selectedDateAry = config.date;
			} else if($kit.isStr(config.date)) {
				if(config.date.indexOf(config.dateStringSeparator) > -1) {
					var dateStrAry = config.date.split(config.dateStringSeparator);
					me.date = $kit.date.parseDate(dateStrAry[0], me.format, me.language);
					me.selectedDateAry = [];
					$kit.each(dateStrAry, function(o) {
						me.selectedDateAry.push($kit.date.parseDate(o, me.format, me.language));
					});
					me.selectedDateAry.sort(function(a, b) {
						return a.valueOf() - b.valueOf();
					});
				} else {
					me.date = $kit.date.parseDate(config.date, me.format, me.language);
					me.selectedDateAry = [me.date];
				}
			}
		} else {
			me.date = $kit.date.dateNow();
		}
		//
		switch(config.startView) {
			case 2:
			case 'decade':
				me.viewMode = me.startViewMode = 2;
				break;
			case 1:
			case 'year':
				me.viewMode = me.startViewMode = 1;
				break;
			case 0:
			case 'month':
			default:
				me.viewMode = me.startViewMode = 0;
				break;
		}
		me.weekStart = config.weekStart || $kit.date.languagePack[me.language].weekStart || 0;
		me.weekEnd = ((me.weekStart + 6) % 7);
		me.startDate = -Infinity;
		me.endDate = Infinity;
		me.setStartDate(config.startDate);
		me.setEndDate(config.endDate);
		me.fillDow();
		me.update();
		me.showMode();
		if(config.show) {
			//
		} else {
			me.hide();
		}
		return me;
	},
	/**
	 * 创建html
	 */
	buildHTML : function() {
		var me = this;
		me.picker = $kit.newHTML($kit.tpl(me.config.template.pickerHTML, me.config.template)).childNodes[0];
		document.body.appendChild(me.picker);
	},
	/**
	 * 注册事件
	 */
	initEv : function() {
		var me = this;
		$kit.ev({
			el : me.picker,
			ev : 'mousedown',
			fn : me.mousedown,
			scope : me
		});
		$kit.ev({
			el : me.picker,
			ev : 'mousemove',
			fn : me.mousemove,
			scope : me
		});
		$kit.ev({
			el : me.picker,
			ev : 'mouseup',
			fn : me.mouseup,
			scope : me
		});
		$kit.ev({
			el : me.picker,
			ev : 'click',
			fn : me.click,
			scope : me
		});
		$kit.ev({
			el : me.picker,
			ev : 'selectstart',
			fn : function(e) {
				e.stopNow();
			},
			scope : me
		});
	},
	/**
	 * 显示日历
	 */
	show : function(e) {
		var me = this;
		if(me.picker.style.display == 'none') {
			me.picker.style.display = '';
		}
		if(me.adhereEl) {
			me.adhere(me.adhereConfig);
		}
	},
	/**
	 * 吸附
	 */
	adhere : function(config) {
		var me = this;
		if($kit.isNode(config)) {
			config = {
				el : config
			}
		}
		if(config) {
			config.el[me.config.kitWidgetName] = me;
			$kit.adCls(me.picker, me.config.template.dropDownCls);
			me.adhereEl = config.el;
			me.adhereConfig = config;
			me.fixPosition(me.adhereConfig);
		}
	},
	/**
	 * 修正日历位置，随着吸附元素调整位置
	 */
	fixPosition : function(adhereConfig) {
		var me = this;
		var offset = $kit.offset(adhereConfig.el);
		$kit.css(me.picker, {
			position : 'absolute',
			top : offset.bottom + (adhereConfig.offsetTop || 0) + 'px',
			left : offset.left + (adhereConfig.left || 0) + 'px'
		});
	},
	/**
	 * 隐藏
	 */
	hide : function(e) {
		var me = this;
		me.picker.style.display = 'none';
	},
	/**
	 * 设值
	 * @private
	 */
	setValue : function(remove) {
		remove = remove;
		var me = this;
		if(remove == false) {
			me.selectedDateAry = [];
			if(me.adhereEl) {
				me.adhereEl.value = '';
			}
		} else {
			var formated = $kit.date.formatDate(me.date, me.format, me.language);
			if(me.adhereEl) {
				me.adhereEl.value = formated;
			}
			me.selectedDateAry = [new Date(me.date)];
			me.update();
		}
		me.newEv({
			ev : 'change'
		});
	},
	/**
	 * 按住shift或者ctrl添加
	 */
	addValue : function(continuous) {
		var me = this;
		continuous = continuous || false;
		me.selectedDateAry = me.selectedDateAry || [];
		var beginDate = me.selectedDateAry[0];
		var endDate = me.selectedDateAry[me.selectedDateAry.length - 1];
		if(continuous == true) {
			if(me.date.valueOf() < beginDate.valueOf()) {
				beginDate = new Date(me.date);
			} else {
				endDate = new Date(me.date);
			}
			var newSelectedDateAry = [];
			while(endDate.valueOf() >= beginDate.valueOf()) {
				newSelectedDateAry.push(new Date(beginDate));
				$kit.date.addDays(beginDate, 1);
			}
			me.selectedDateAry = newSelectedDateAry;
		} else {
			if(me.date.valueOf() < beginDate.valueOf()) {
				me.selectedDateAry.splice(0, 0, new Date(me.date));
			} else if(me.date.valueOf() > endDate.valueOf()) {
				me.selectedDateAry.push(new Date(me.date));
			} else if(me.date.valueOf() >= beginDate.valueOf() || me.date.valueOf() <= endDate.valueOf()) {
				var canAdd = true;
				for(var i = 0; i < me.selectedDateAry.length; ) {
					if(me.date.valueOf() == me.selectedDateAry[i].valueOf()) {
						me.selectedDateAry.splice(i, 1);
						canAdd = false;
						break;
					} else if(me.date.valueOf() > me.selectedDateAry[i].valueOf() && i < me.selectedDateAry.length - 1 && me.date.valueOf() < me.selectedDateAry[i + 1].valueOf()) {
						me.selectedDateAry.splice(i + 1, 0, new Date(me.date));
						break;
					} else if(i == me.selectedDateAry.length - 1) {
						me.selectedDateAry.splice(i, 0, new Date(me.date));
					}
					i++;
				}
			}
		}
		if(me.adhereEl) {
			me.adhereEl.value = me.getValue();
		}
		me.update();
		me.newEv({
			ev : 'change'
		});
	},
	/**
	 * 获取日历的选中值
	 */
	getValue : function() {
		var me = this;
		if(me.selectedDateAry.length) {
			var dateStrAry = [];
			if(me.config.shiftSelectOutType.toLowerCase() != 'short') {
				$kit.each(me.selectedDateAry, function(o) {
					dateStrAry.push($kit.date.formatDate(o, me.format, me.language))
				});
				return dateStrAry.join(me.config.dateStringSeparator);
			} else {
				dateStrAry.push($kit.date.formatDate(me.selectedDateAry[0], me.format, me.language));
				dateStrAry.push($kit.date.formatDate(me.selectedDateAry[me.selectedDateAry.length - 1], me.format, me.language));
				return dateStrAry.join(me.config.shiftSelectOutTypeShortSeparator);
			}
			return $kit.date.formatDate(me.date, me.format, me.language)
		}
		return '';
	},
	/**
	 * 设置能选择的最早日期
	 */
	setStartDate : function(startDate) {
		var me = this;
		if($kit.isDate(startDate)) {
			me.startDate = startDate;
		} else {
			me.startDate = startDate || -Infinity;
			if(me.startDate !== -Infinity) {
				me.startDate = $kit.date.parseDate(me.startDate, me.format, me.language);
			}
		}
		me.updateNavArrows();
	},
	/**
	 * 设置能选择的最迟日期
	 */
	setEndDate : function(endDate) {
		var me = this;
		if($kit.isDate(endDate)) {
			me.endDate = endDate;
		} else {
			me.endDate = endDate || Infinity;
			if(me.endDate !== Infinity) {
				me.endDate = $kit.date.parseDate(me.endDate, me.format, me.language);
			}
		}
		me.updateNavArrows();
	},
	/**
	 * 刷新日期天数显示
	 */
	update : function() {
		var me = this;
		if(me.date < me.startDate) {
			me.viewDate = new Date(me.startDate);
		} else if(me.date > me.endDate) {
			me.viewDate = new Date(me.endDate);
		} else {
			me.viewDate = new Date(me.date);
		}
		me.fill();
	},
	/**
	 * 星期几
	 */
	fillDow : function() {
		var me = this;
		var dowCnt = me.weekStart;
		var html = '<tr>';
		while(dowCnt < me.weekStart + 7) {
			html += '<th class="dow">' + $kit.date.languagePack[me.language][me.config.weekViewFormat][(dowCnt++) % 7] + '</th>';
		}
		html += '</tr>';
		var thead = $kit.$el('.datepicker-days thead',me.picker)[0];
		if($kit.isIE()) {
			var tr = thead.insertRow(1);
			thead.replaceChild($kit.newHTML('<table><tbody>' + html + '</tbody></table>').firstChild.firstChild.firstChild, tr)
		} else {
			$kit.insEl({
				where : thead,
				what : html,
				pos : 'last'
			});
		}
	},
	/**
	 * 月份选择
	 */
	fillMonths : function() {
		var me = this;
		var html = '';
		var i = 0
		while(i < 12) {
			html += '<span class="month">' + $kit.date.languagePack[me.language][me.config.monthViewFormat][i++] + '</span>';
		}
		$kit.each($kit.$el('.datepicker-months td', me.picker), function(o) {
			o.innerHTML = html;
		});
	},
	/**
	 * 天数面板
	 */
	fill : function() {
		var me = this;
		var d = new Date(me.viewDate), year = d.getFullYear(), month = d.getMonth(), //
		startYear = me.startDate !== -Infinity ? me.startDate.getFullYear() : -Infinity, //
		startMonth = me.startDate !== -Infinity ? me.startDate.getMonth() : -Infinity, //
		endYear = me.endDate !== Infinity ? me.endDate.getFullYear() : Infinity, //
		endMonth = me.endDate !== Infinity ? me.endDate.getMonth() : Infinity;
		//
		if(me.config.language != 'cn') {
			$kit.$el('.datepicker-days th:eq(1)',me.picker)[0].innerHTML = $kit.date.languagePack[me.language].months[month] + ' ' + year;
		} else {
			$kit.$el('.datepicker-days th:eq(1)',me.picker)[0].innerHTML = year + '年' + $kit.date.languagePack[me.language].months[month];
		}
		//
		me.updateNavArrows();
		me.fillMonths();
		var prevMonth = new Date(year, month - 1, 28, 0, 0, 0, 0), day = $kit.date.getDaysInMonth(prevMonth.getFullYear(), prevMonth.getMonth());
		prevMonth.setDate(day);
		prevMonth.setDate(day - (prevMonth.getDay() - me.weekStart + 7) % 7);
		var nextMonth = new Date(prevMonth);
		nextMonth.setDate(nextMonth.getDate() + 42);
		nextMonth = nextMonth.valueOf();
		html = [];
		var clsName;
		while(prevMonth.valueOf() < nextMonth) {
			if(prevMonth.getDay() == me.weekStart) {
				html.push('<tr>');
			}
			clsName = '';
			if(prevMonth.getFullYear() < year || (prevMonth.getFullYear() == year && prevMonth.getMonth() < month)) {
				clsName += ' old';
			} else if(prevMonth.getFullYear() > year || (prevMonth.getFullYear() == year && prevMonth.getMonth() > month)) {
				clsName += ' new';
			}
			$kit.each(me.selectedDateAry, function(o) {
				if(o.valueOf() == prevMonth.valueOf()) {
					clsName += ' active';
					return false;
				}
			});
			if(prevMonth.valueOf() < me.startDate || prevMonth.valueOf() > me.endDate) {
				clsName += ' disabled';
			}
			html.push('<td class="day' + clsName + '">' + prevMonth.getDate() + '</td>');
			if(prevMonth.getDay() == me.weekEnd) {
				html.push('</tr>');
			}
			prevMonth.setDate(prevMonth.getDate() + 1);
		}
		var tbody = $kit.$el('.datepicker-days tbody', me.picker)[0];
		var _htm = html.join('');
		if($kit.isIE()) {
			while(tbody.rows.length) {
				tbody.deleteRow(0);
			}
			tbody.parentNode.replaceChild($kit.newHTML('<table><tbody>' + _htm + '</tbody></table>').firstChild.firstChild, tbody);
		} else {
			tbody.innerHTML = '';
			$kit.insEl({
				where : tbody,
				what : _htm,
				pos : 'last'
			});
		}
		var currentYear = me.viewDate.getFullYear();
		//
		var monthsEl = $kit.$el('.datepicker-months', me.picker)[0];
		$kit.dom.text($kit.$el('th:eq(1)', monthsEl)[0], year);
		$kit.each($kit.$el('span', monthsEl), function(o) {
			$kit.rmCls(o, 'active');
		});
		if(currentYear == year) {
			$kit.each($kit.$el('span', monthsEl), function(o, i) {
				if(i == me.viewDate.getMonth()) {
					$kit.adCls(o, 'active');
					return false;
				}
			});
		}
		if(year < startYear || year > endYear) {
			$kit.adCls(monthsEl, 'disabled');
		}
		if(year == startYear) {
			$kit.each($kit.$el('span', monthsEl).slice(0, startMonth), function(o) {
				$kit.adCls(o, 'disabled');
			});
		}
		if(year == endYear) {
			$kit.each($kit.$el('span', monthsEl).slice(endMonth + 1), function(o) {
				$kit.adCls(o, 'disabled');
			});
		}
		html = '';
		year = parseInt(year / 10, 10) * 10;
		//
		var yearEl = $kit.$el('.datepicker-years',me.picker)[0];
		$kit.dom.text($kit.$el('th:eq(1)', yearEl)[0], year + '-' + (year + 9));
		var yearCont = $kit.$el('td', yearEl);
		year -= 1;
		for(var i = -1; i < 11; i++) {
			html += '<span class="year' + (i == -1 || i == 10 ? ' old' : '') + (currentYear == year ? ' active' : '') + (year < startYear || year > endYear ? ' disabled' : '') + '">' + year + '</span>';
			year += 1;
		}
		$kit.each(yearCont, function(o) {
			$kit.dom.html(o, html);
		});
	},
	/**
	 * 导航左右翻页
	 */
	updateNavArrows : function() {
		var me = this;
		var d = new Date(me.viewDate), year = d.getFullYear(), month = d.getMonth();
		switch (me.viewMode) {
			case 0:
				if(me.startDate !== -Infinity && year <= me.startDate.getFullYear() && month <= me.startDate.getMonth()) {
					$kit.css($kit.$el('th.prev:first', me.picker)[0], {
						visibility : 'hidden'
					});
				} else {
					$kit.css($kit.$el('th.prev:first', me.picker)[0], {
						visibility : 'visible'
					});
				}
				if(me.endDate !== Infinity && year >= me.endDate.getFullYear() && month >= me.endDate.getMonth()) {
					$kit.css($kit.$el('th.next:last', me.picker)[0], {
						visibility : 'hidden'
					});
				} else {
					$kit.css($kit.$el('th.next:last', me.picker)[0], {
						visibility : 'visible'
					});
				}
				break;
			case 1:
			case 2:
				if(me.startDate !== -Infinity && year <= me.startDate.getFullYear()) {
					$kit.css($kit.$el('th.prev:first', me.picker)[0], {
						visibility : 'hidden'
					});
				} else {
					$kit.css($kit.$el('th.prev:first', me.picker)[0], {
						visibility : 'visible'
					});
				}
				if(me.endDate !== Infinity && year >= me.endDate.getFullYear()) {
					$kit.css($kit.$el('th.next:last', me.picker)[0], {
						visibility : 'hidden'
					});
				} else {
					$kit.css($kit.$el('th.next:last', me.picker)[0], {
						visibility : 'visible'
					});
				}
				break;
		}
	},
	/**
	 * 面板mousedown和mousemove事件，主要用于鼠标滑动选择
	 */
	mousedown : function(e) {
		var me = this, target = e.target;
		if(!me.config.canMultipleChoose) {
			return;
		}
		me.mouseSlideSelect = false;
		if(target.tagName && $kit.array.hs(['td'], target.tagName.toLowerCase())) {
			//
		} else {
			target = $kit.parentEl(target, function(p) {
				if(p.tagName && $kit.array.hs(['td'], p.tagName.toLowerCase())) {
					return true;
				}
				if(p == me.picker) {
					return false;
				}
			});
		}
		if($kit.hsCls(target, 'day')) {
			$kit.adCls(target, 'active');
			me.slideSelectFlag = true;
		}
	},
	/**
	 * 鼠标移动事件
	 * @private
	 */
	mousemove : function(e) {
		var me = this, target = e.target;
		if(!me.config.canMultipleChoose) {
			return;
		}
		if(me.slideSelectFlag != true) {
			return;
		}
		if(target.tagName && $kit.array.hs(['td'], target.tagName.toLowerCase())) {
			//
		} else {
			target = $kit.parentEl(target, function(p) {
				if(p.tagName && $kit.array.hs(['td'], p.tagName.toLowerCase())) {
					return true;
				}
				if(p == me.picker) {
					return false;
				}
			});
		}
		if($kit.hsCls(target, 'day')) {
			var day = parseInt($kit.dom.text(target), 10) || 1;
			var year = me.viewDate.getFullYear(), month = me.viewDate.getMonth();
			if($kit.hsCls(target, 'old') && !$kit.hsCls(target, 'disabled')) {
				if(month == 0) {
					month = 11;
					year -= 1;
				} else {
					month -= 1;
				}
			} else if($kit.hsCls(target, 'new') && !$kit.hsCls(target, 'disabled')) {
				if(month == 11) {
					month = 0;
					year += 1;
				} else {
					month += 1;
				}
			}
			date = new Date(year, month, day, 0, 0, 0, 0);
			$kit.adCls(target, 'active');
			if(me.mouseSlideSelectBeginDate == null) {
				me.mouseSlideSelectBeginDate = new Date(date);
				me.mouseSlideSelectBeginEl = target;
			} else if(me.mouseSlideSelectBeginDate.valueOf() != date.valueOf()//
			&& (//
				me.mouseSlideSelectEndDate == null//
				|| (me.mouseSlideSelectEndDate && me.mouseSlideSelectEndDate.valueOf() != date.valueOf()))//
			) {
				me.mouseSlideSelectEndDate = new Date(date);
				me.mouseSlideSelectEndEl = target;
				if(me.mouseSlideSelectBeginDate && me.mouseSlideSelectEndDate) {
					var first = false, last = false, firstDate, lastDate, firstEl, lastEl;
					if(me.mouseSlideSelectEndDate.valueOf() > me.mouseSlideSelectBeginDate.valueOf()) {
						//firstDate = me.mouseSlideSelectBeginDate;
						firstEl = me.mouseSlideSelectBeginEl;
						//lastDate = me.mouseSlideSelectEndDate;
						lastEl = me.mouseSlideSelectEndEl;
					} else {
						//lastDate = me.mouseSlideSelectBeginDate;
						lastEl = me.mouseSlideSelectBeginEl;
						//firstDate = me.mouseSlideSelectEndDate;
						firstEl = me.mouseSlideSelectEndEl;
					}
					$kit.each($kit.$el('.datepicker-days td.day', me.picker), function(o) {
						if(last) {
							$kit.rmCls(o, 'active');
						}
						if(first && o == lastEl) {
							last = true;
						}
						if(!first && o == firstEl) {
							first = true;
						}
						if(!first) {
							$kit.rmCls(o, 'active');
						}
						if(first && !last) {
							$kit.adCls(o, 'active');
						}

					});
				}
			}
		}
	},
	/**
	 * 选中事件
	 * @private
	 */
	mouseup : function(e) {
		var me = this, target = e.target;
		if(!me.config.canMultipleChoose) {
			return;
		}
		if(me.slideSelectFlag == true) {
			if(me.mouseSlideSelectBeginDate && me.mouseSlideSelectEndDate) {
				me.mouseSlideSelect = true;
				if(me.mouseSlideSelectEndDate.valueOf() > me.mouseSlideSelectBeginDate.valueOf()) {
					beginDate = new Date(me.mouseSlideSelectBeginDate);
					endDate = new Date(me.mouseSlideSelectEndDate);
				} else {
					endDate = new Date(me.mouseSlideSelectBeginDate);
					beginDate = new Date(me.mouseSlideSelectEndDate);
				}
				me.selectedDateAry = [];
				while(endDate.valueOf() >= beginDate.valueOf()) {
					me.selectedDateAry.push(new Date(beginDate));
					$kit.date.addDays(beginDate, 1);
				}
				if(me.adhereEl) {
					me.adhereEl.value = me.getValue();
				}
				//me.update();
				me.newEv({
					ev : 'change'
				});
			}
			me.mouseSlideSelectEndEl = null;
			me.mouseSlideSelectEndDate = null;
			me.mouseSlideSelectBeginEl = null;
			me.mouseSlideSelectBeginDate = null;
		}
		me.slideSelectFlag = false;
	},
	/**
	 * 面板click事件
	 * @private
	 */
	click : function(e) {
		var me = this;
		if(me.mouseSlideSelect == true) {
			me.mouseSlideSelect = false;
			return;
		}
		e.stopNow();
		var target = e.target;
		if(target.tagName && $kit.array.hs(['span', 'td', 'th'], target.tagName.toLowerCase())) {
			//
		} else {
			target = $kit.parentEl(target, function(p) {
				if(p.tagName && $kit.array.hs(['span', 'td', 'th'], p.tagName.toLowerCase())) {
					return true;
				}
				if(p == me.picker) {
					return false;
				}
			});
		}
		if(target != null) {
			switch(target.nodeName.toLowerCase()) {
				case 'th':
					switch(target.className) {
						case 'switch':
							me.showMode(1);
							break;
						case 'prev':
						case 'next':
							var dir = me.config.modes[me.viewMode].navStep * (target.className == 'prev' ? -1 : 1);
							switch(me.viewMode) {
								case 0:
									me.viewDate = $kit.date.moveMonth(me.viewDate, dir);
									break;
								case 1:
								case 2:
									me.viewDate = $kit.date.moveYear(me.viewDate, dir);
									break;
							}
							me.fill();
							break;
					}
					break;
				case 'span':
					if(!$kit.hsCls(target, 'disabled')) {
						if($kit.hsCls(target, 'month')) {
							var month = $kit.array.indexOf($kit.$el('span', target.parentNode), target);
							me.viewDate.setMonth(month);
						} else {
							var year = parseInt($kit.dom.text(target), 10) || 0;
							me.viewDate.setFullYear(year);
						}
						me.showMode(-1);
						me.fill();
					}
					break;
				case 'td':
					if($kit.hsCls(target, 'day') && !$kit.hsCls(target, 'disabled')) {
						var day = parseInt($kit.dom.text(target), 10) || 1;
						var year = me.viewDate.getFullYear(), month = me.viewDate.getMonth();
						if($kit.hsCls(target, 'old')) {
							if(month == 0) {
								month = 11;
								year -= 1;
							} else {
								month -= 1;
							}
						} else if($kit.hsCls(target, 'new')) {
							if(month == 11) {
								month = 0;
								year += 1;
							} else {
								month += 1;
							}
						}
						newDate = new Date(year, month, day, 0, 0, 0, 0);
						if(me.date && me.date.valueOf() == newDate.valueOf()) {
							$kit.rmCls(target, 'active');
							me.setValue(false);
							me.date = null;
						} else {
							me.date = newDate;
							me.viewDate = new Date(year, month, day, 0, 0, 0, 0);
							me.fill();
							if(e.shiftKey && me.config.canMultipleChoose && me.selectedDateAry && me.selectedDateAry.length >= 1) {
								me.addValue(true);
							} else if(e.ctrlKey && me.config.canMultipleChoose && me.selectedDateAry && me.selectedDateAry.length >= 1) {
								me.addValue();
							} else {
								//清除选中
								if(me.selectedDateAry && me.selectedDateAry.length > 1) {
									$kit.each($kit.$el('.datepicker-days td.day', me.picker), function(o) {
										$kit.rmCls(o, 'active');
									});
									$kit.rmCls(target, 'active');
									me.setValue(false);
									me.date = null;
								} else {
									me.setValue();
								}
								if(me.config.canMultipleChoose==true){
									me.hide();
								}
							}
						}
					}
					break;
			}
		}
	},
	/*
	keydown : function(e) {
	if(me.picker.is(':not(:visible)')) {
	if(e.keyCode == 27)// allow escape to hide and re-show picker
	me.show();
	return;
	}
	var dir, day, month;
	switch(e.keyCode) {
	case 27:
	// escape
	me.hide();
	e.preventDefault();
	break;
	case 37:
	// left
	case 39:
	// right
	dir = e.keyCode == 37 ? -1 : 1;
	if(e.ctrlKey) {
	me.date = me.moveYear(me.date, dir);
	me.viewDate = me.moveYear(me.viewDate, dir);
	} else if(e.shiftKey) {
	me.date = me.moveMonth(me.date, dir);
	me.viewDate = me.moveMonth(me.viewDate, dir);
	} else {
	me.date.setDate(me.date.getDate() + dir);
	me.viewDate.setDate(me.viewDate.getDate() + dir);
	}
	me.setValue();
	me.update();
	e.preventDefault();
	break;
	case 38:
	// up
	case 40:
	// down
	dir = e.keyCode == 38 ? -1 : 1;
	if(e.ctrlKey) {
	me.date = me.moveYear(me.date, dir);
	me.viewDate = me.moveYear(me.viewDate, dir);
	} else if(e.shiftKey) {
	me.date = me.moveMonth(me.date, dir);
	me.viewDate = me.moveMonth(me.viewDate, dir);
	} else {
	me.date.setDate(me.date.getDate() + dir * 7);
	me.viewDate.setDate(me.viewDate.getDate() + dir * 7);
	}
	me.setValue();
	me.update();
	e.preventDefault();
	break;
	case 13:
	// enter
	me.hide();
	e.preventDefault();
	break;
	}
	},
	*/
	/**
	 * 显示天数还是月份还是年
	 */
	showMode : function(dir) {
		var me = this;
		if(dir) {
			me.viewMode = Math.max(0, Math.min(2, me.viewMode + dir));
		}
		var a = $kit.$el('>div', me.picker);
		$kit.each(a, function(o) {
			o.style.display = 'none';
		});
		$kit.array.filter(a, function(o) {
			if($kit.hsCls(o, 'datepicker-' + me.config.modes[me.viewMode].clsName)) {
				o.style.display = 'block';
			}
		})
		me.updateNavArrows();
	},
	/**
	 * 注册自定义事件
	 * @param {Object} config
	 * @param {String} config.ev
	 * @param {Function} config.fn
	 */
	ev : function() {
		if(arguments.length == 1) {
			var evCfg = arguments[0];
			var scope = evCfg.scope || this;
			if($kit.isFn(evCfg.fn) && $kit.isStr(evCfg.ev)) {
				var evCfg = {
					ev : evCfg.ev,
					fn : evCfg.fn,
					scope : this
				};
				this.event = this.event || {};
				this.event[evCfg.ev] = this.event[evCfg.ev] || [];
				this.event[evCfg.ev].push(evCfg);
			}
		}
	},
	/**
	 * 触发自定义事件
	 * @param {Object} config
	 * @param {String} config.ev
	 */
	newEv : function() {
		if(arguments.length == 1 && !$kit.isEmpty(this.event)) {
			var evAry, evCfg, _evCfg = {};
			if($kit.isStr(arguments[0])) {
				var ev = arguments[0];
				evAry = this.event[ev];
			} else if($kit.isObj(arguments[0])) {
				_evCfg = arguments[0];
				evAry = this.event[_evCfg.ev];
			}
			if(!$kit.isEmpty(evAry)) {
				for(var i = 0; evAry != null && i < evAry.length; i++) {
					evCfg = $kit.merge(evAry[i], _evCfg);
					var e = {
						target : this,
						type : evCfg.ev
					}
					evCfg.fn.call(evCfg.scope, e, evCfg);
				}
			}
		}
	}
});

/* hotel functions */

/*
function show_datePicker(e) {
	var d, ipt = e.target;
	d = e.target[$kit.ui.DatePicker.defaultConfig.kitWidgetName];
	if(d) {
		d.show();
	} else {
		d = new $kit.ui.DatePicker({
			dateFormat: 'yyyy-mm-dd',
			date : ipt.value,
			canMultipleChoose: true
		}).init();
		d.adhere(ipt);
		d.show();
	}
}

function bind_event(o) {
	$kit.ev({
		el : document,
		ev : 'click',
		fn : function(e) {
			var input = $kit.el(o);
			var input = o;
			d = input[$kit.ui.DatePicker.defaultConfig.kitWidgetName];
			if(d && !$kit.contains(d.picker, e.target) && input != e.target) {
				d.hide();
			}
		}
	});
}

function save(o, room_id) {
	var items = $(o).parents("td").siblings(); 
	var r = new Object();
	r.id = room_id;
	r.name = items.eq(0).html();
	r.doorPrice = items.eq(1).html();
	r.bad = items.eq(2).html();
	r.area = items.eq(3).html();
	r.floor = items.eq(4).html();
	r.net = items.eq(5).html();
	r.breakfast = items.eq(6).html();
	r.date = items.eq(7).children().eq(0).val();
	r.price = items.eq(7).children().eq(1).val();
//	alert(r.id + ", " + r.name + ", " + r.doorPrice + ", " + r.bad + ", " + r.area + ", " + r.floor + ", " + r.net + ", " + r.breakfast + ", " + r.date + ", " + r.price);
	unEdit(o);
}

function addRoom() {
	var id = $("#rooms_table tr").length;
	var row = '<tr>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td></td>' + 
	'<td>'+
		'日期：<input id="J_input' + id + '" onfocus="show_datePicker(event);" onload="bind_event(this)" size="10"/>'+
		'价格：<input size="6"/>'+
	'</td>' + 
	'<td>' + 
			'<input type="button" value="编辑" onclick="edit(this)"/>' + 
			'<input type="button" value="保存" onclick="save(this)"/>' + 
	'</td>' + 
	'</tr>';
	$("#rooms_table").append(row);
	//bind_event('#J_input' + id);
	//$("#rooms_table").append(row).children().last().attr("contenteditable", "true");
	//alert($("#rooms_table").append(row).last("tr").html());
}

function edit(o) {
	$(o).parents("td").siblings().attr("contenteditable", "true");
}
function unEdit(o) {
	$(o).parents("td").siblings().attr("contenteditable", "false");
}

*/
