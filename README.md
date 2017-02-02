#Ello.js
###Ello.js is small and simple Virtual DOM manipulating library written in ES6
Ello.js is small and simple Virtual DOM manipulating library written in ES6

##Step 1: Define element

```javascript
const el = Ello.render('h2', {
onMouseOver: function foo() {
    this.style.color = "green";
    }
  },
"Hello! Hover me.");
    
    
const root = Ello.S('#container');
Ello.updateElement(root, el);
```

##Step 2: Connect DOM

```javascript
const root = Ello.S('#container');
Ello.updateElement(root, el);
```
