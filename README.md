#Ello.js
###Ello.js is small and simple Virtual DOM manipulating library written in ES6
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
const root = Ello.S('#container');
const reload = Ello.S('#reload');

Ello.updateElement(root, el);

reload.addEventListener('click', () => {
  Ello.updateElement(root, el);
});

```
