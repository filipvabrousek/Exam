# Animations

```css
@keyframes A {
	0% {
		color: green;
	}
	100% {
		color: cornflowerblue;
	}
}


@keyframes B {
	from {
		color: green;
	}
	to {
		color: cornflowerblue;
	}
}


h2 {
	font-weight: bold;
	font-size: 3em;
	animation: A 3s;
	animation-delay: 2s;
	animation-iteration-count: infinite;
}

```

# Animations with :before, :after

```html
<a href="#">Like<span></span></a>
```

```css
a {
  font-size: 120px;
  text-decoration: none;
  color: #3498db;
  display: inline-block;
  font-weight: bold;
}


a span:after {
  opacity: 0;
  content: '♡';
  transition: .6s all;
  color: #e74c3c;
}

a:hover,
a:visited {
  color: #e74c3c;
  transition: all 0.6s;
}


a:hover span:after {
  opacity: 1;
  transition: all 0.6s;
  padding-left: 36px;
}
```

# Beziers
```css
    div {
    	width: 3em;
    	height: 1em;
    	background: #1abc9c;
    	animation: bezier 3s infinite;
    	transition-timing-function: cubic-bezier(0.68, -0.30, 0.265);
    }
    @keyframes bezier {
    	100% {
    		transform: translateX(20rem);
    	}
    }
```
