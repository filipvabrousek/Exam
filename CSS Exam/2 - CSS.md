# CSS


## Syntax
```css
h1 {
    color: red;
}

```
## Block model
* width
* height
* min-width
* max-width
* padding
* margin
* box-sizing (border-box) to all elements


## colors
```css
 h1 {
    color: "red";
    color: rgba(102, 0, 218, 0.7);
    color: #1abc9c;
    color: hsl(99, 100%, 50%);
}
```

-------------------------------------------------------------------------------

## Calc
```css
 div {
    background: #1abc9c;
    width: calc(100% - 1em);
}
```

## Filters 
* sepia
* grayscale
* opacity
* saturate
* blur
* contrast
* hue-rotate
* invert
```css
img {
    filter: blur(5px) grayscale(1);
}
```

## Background blend mode
possible to combine with filters
* screen
* overlay
* color-dodge
* color-burn
* hard-light
* soft-light
* hue
* color
* luminosity

## gradient
* linear
* radial

```css
div {
  display: block;
  width: 90em;
  height: 15em;
  background: linear-gradient(to right, orange, blue), url("http://i.imgur.com/ndjf9K9.jpg");
  background-repeat: no-repeat;
  background-blend-mode: hard-light;
}
```


## Mix-blend-mode
```html
<div>
  <h1>TEXT</h1>
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/chicago.jpg">
</div>

```

```css
div {
  text-align: center;
  position: relative;
  background: #fff;
}

.light h1 {
  margin: 0;
  font-size: 20vw;
  font-family: Arial;
  line-height: 1.9;
}

div img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  mix-blend-mode: lighten;
}


```

## Counters

```html


<h2>Title</h2>
<h2>Title</h2>
<h2>Title</h2>
```

```css
body {
    counter-reset: section;
}

h2::before {
    counter-increment: section;
    content: "Section " counter(section) ": ";
}
```



