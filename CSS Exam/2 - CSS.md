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
    background: green;
    width: calc(100% - 1em);
}
```

## Filters 

```css
img {
    filter: blur(5px) grayscale(1);
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



