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
# Selector combinations

```html
<div>
<p>I am in!</p>
<p>I am in!</p>
</div>


<p>I am out.</p>
<p>I am out.</p>
```


```css
  div + p {
 	color: green;
 }
 div ~ p {
     color: orange;
  }
  
  div > p {
 	color: cornflowerblue;
 }
  
```

# Pseudo classes

## 1
```html
<div>
DIV
<p>Hidden until hover</p>
</div>


```


```css
div {
	width: 100vw;
	height: 20px;
	background: green;
}

p {
	display: none;
}

div:hover p {
	display: block;
}


```

## 2
* a:link
* a:visited
* a:hover
* a:active

```css
  p:first-child{
        color: blue;
    }
```
