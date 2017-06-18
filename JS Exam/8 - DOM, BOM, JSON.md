# DOM
* connects web pages to scripts or programming languages

# BOM
**window.**
* screen. (width, height, availWidth, availHeight, colorDepth, pixelDepth)
* location. (href, protocol, hostName, pathName)
* history (back, forward)
* alert, confirm, setTimeout, setInterval
* cookies

# JSON
* JavaScript Standart Object Notation

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
