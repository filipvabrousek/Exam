##Ello - Simple CSS Framework
#Ello.js
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
