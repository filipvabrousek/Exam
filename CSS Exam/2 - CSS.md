# CSS


# Syntax
```css
h1 {
    color: red;
}

```

# colors
```css
 h1 {
    color: "red";
    color: rgba(102, 0, 218, 0.7);
    color: #1abc9c;
    color: hsl(99, 100%, 50%);
}
```

# Functions

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



