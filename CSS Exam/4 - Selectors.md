# Selectors

```html
<a href="https://www.google.com">Link</a>
<a href="#home">Home</a>
<a href="l.cz">CZ</a>
<a href="example.com">Example</a>
<a href="p.com" class="O">S</a>
<a href="nasa.gov">Nasa</a>

```
```css


    a[class] {
        color: red;
    }
    a[href="nasa.gov"] {
        color: yellow;
    }
    a[href^="#"] {
        color: green;
    }
    a[href$=".cz"] {
        color: orange;
    }
    a[href*="example"] {
        color: violet;
    }
```
