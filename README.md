#Ello.js
Ello.js is small and simple Virtual DOM manipulating library written in ES6

##Step 1: Define element

```javascript
const el = Ello.render('h2', {}, "Hello world!");
```

##Step 2: Connect DOM

```javascript
const root = Ello.S('#container');
Ello.update(root, el);
```
