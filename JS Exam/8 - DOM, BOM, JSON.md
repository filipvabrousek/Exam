# DOM
* "Document object Model"
* connects web pages to scripts or programming languages

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


# Local storage
```javascript
let myObj, myJSON, text, obj;

//Storing data:
myObj = { "name":"Filip", "age":17, "city":"Zlin" };
myJSON = JSON.stringify(myObj);
localStorage.setItem("testJSON", myJSON);

//Retrieving data:
text = localStorage.getItem("testJSON");
obj = JSON.parse(text);
console.log(obj.name);
```
