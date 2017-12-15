# DOM
* "Document object Model"
* connects web pages to scripts or programming languages


## Window object
```js
window.isSecureContext


```

## Document

*  represents any web page loaded in the browser and serves as an entry point into the web page's content, which is the DOM tree


```js

console.log(document.styleSheets);

function q() {
    return document.querySelectorAll(...arguments);
}

q.call(document, 'body');

```





# BOM
**window.**
* screen. (width, height, availWidth, availHeight, colorDepth, pixelDepth)
* location. (href, protocol, hostName, pathName)
* history (back, forward)
* alert, confirm, setTimeout, setInterval
* cookies

# JSON
* JavaScript Standart Object Notation
* parse(), stringify()
* no string in JavaScript can contain a literal U+2028 or a U+2029

```js
let j = (new Date()).toJSON()
let back = new Date(j)
```

# Local storage
```javascript
let obj = {
    name: "Filip",
    age: 17
}

let JSONData = JSON.stringify(obj);
localStorage.setItem("data", JSONData);


let text = localStorage.getItem("data");
let res = JSON.parse(text);
console.log(res.name);

localStorage.a = 3;
```

```js
for (i in localStorage){
    console.log(localStorage[i]);
}

```
