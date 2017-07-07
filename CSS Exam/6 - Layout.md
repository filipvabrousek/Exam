# Flexbox



# Grid


## Grid - Boxes

```css

/*...... BOX styles*/
.a {
    grid-column: 1 / 3;
    grid-row: 1;
    background: green;
}
.b {
    grid-column: 3;
    grid-row: 1 / 3;
    background: blue;
}
.c {
    grid-column: 1;
    grid-row: 2;
    background: orange;
}
.d {
    grid-column: 2;
    grid-row: 2;
    background: pink;
}



```
## Grid - Photo galllery


```css
img {
    width: 100%;
}
    
section {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
    grid-gap: 1em;
}
    
@media only screen and (max-width: 62.5em) {
    section {
        grid-template-columns: 1fr 1fr 1fr;
    }
}
    
@media only screen and (max-width: 48em) {
    section {
        grid-template-columns: 1fr 1fr;
    }
}
    
@media only screen and (max-width: 31.25em) {
    section {
        grid-template-columns: 1fr;
    }




```




```html
<section>
    <div class="item1">Content</div>
    <div class="item2">Sidebar</div>
</section>
```

# Grid layout
```css
 * {
    font-family: Arial;
    color: #fff
}
section>div {
    padding: 1em;
    border: 2px solid #fff;
    background: #2196F3
}

section {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: 100px 100px;
    grid-template-areas: "a a b" "a a b";
    background: #9EBDD5
}

.item1 {
    grid-area: a
}

.item2 {
    grid-area: b
}


```


