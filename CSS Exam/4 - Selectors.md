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
# Selector combinators

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


## 3
````html
<div>
<p>some text</p>
<p>some text</p>
<p>some text</p>
<p>some text</p>
<p>some text</p>
</div>
```

```css
p:nth-child(even) {
  color: limegreen;
}

p:nth-of-type(3n) {
  color: orange;
}

p:first-child {
  color: skyblue;
}

```

## 4

```html
<input id="value1" name="value1" type="number" placeholder="1 to 10" min="1" max="10" value="12">  <label for="value1">Your value is </label>
```

```css

input {
  border: 1px solid black;
}

input:in-range {
  background-color: rgba(0, 255, 0, 0.25);
}

input:out-of-range {
  background-color: rgba(255, 0, 0, 0.25);
  border: 2px solid red;
}

input:in-range + label::after {
  content: ' OK';
}

input:out-of-range + label::after {
  content: 'out of range!';
}



```
