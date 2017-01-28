#Ello.js
###Ello.js is small and simple Virtual DOM manipulating library
##Step 1: Define element

```javascript
const el = Ello.render('h2', {
    className: 'title',
    onClick: function onClick() {
      this.style.color = "green";
    }
  },
  'Hello world! Click to change color.');
```

##Step 2: Connect DOM

```javascript
var root = Ello.S('#container');
var reload = Ello.S('#reload');

Ello.updateElement(root, el);

reload.addEventListener('click', function() {
  Ello.updateElement(root, el);
});
```
