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


# Pure CSS nav

```html
<body>
    <nav>
        <ul class="navigation">
            <li class="nav-item"><a href="#">Home</a>
            </li>
            <li class="nav-item"><a href="#">Portfolio</a>
            </li>
            <li class="nav-item"><a href="#">About</a>
            </li>
        </ul>
    </nav>

    <input type="checkbox" id="nav-trigger" class="nav-trigger" />
    <label for="nav-trigger"></label>




    <div class="site-wrap">
        <h1>Title</h1>
    </div>

</body>
```



```css
* {
	margin: 0;
	padding: 0;
}
html, body {
	height: 100%;
	width: 100%;
	font-family: Helvetica, Arial, sans-serif;
	overflow-x: hidden;
}
h1 {
	text-align: center;
	padding-top: 3em;
	font-size: 6em;
	color: #fff;
}

/*------------------------------------NAV---------------------------------------*/

nav {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 0;
	list-style: none;
	background: white;
}
.nav-item a {
	display: block;
	padding: 1.2em;
	color: #1abc9c;
	font-size: 1.7em;
	text-decoration: none;
	transition: color 0.2s, background 0.5s;
}
.nav-trigger {
	position: absolute;
	clip: rect(0, 0, 0, 0);
}
label[for="nav-trigger"] {
	position: fixed;
	left: 15px;
	top: 15px;
	z-index: 2;
	height: 30px;
	width: 30px;
	cursor: pointer;
	background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' version='1.1' x='0px' y='0px' width='30px' height='30px' viewBox='0 0 30 30' enable-background='new 0 0 30 30' xml:space='preserve'><rect width='30' height='6'/><rect y='24' width='30' height='6'/><rect y='12' width='30' height='6'/></svg>");
	background-size: contain;
}

/*----------------------------------------------------------------------*/

.nav-trigger+label, .site-wrap {
	transition: left 0.2s;
}
.nav-trigger:checked+label {
	left: 215px;
}
.nav-trigger:checked~.site-wrap {
	left: 200px;
}

/*----------------------------------------------------------------------*/

.site-wrap {
	min-height: 100%;
	min-width: 100%;
	background: #1abc9c;
	position: relative;
	top: 0;
	bottom: 100%;
	left: 0;
	z-index: 1;
	background-size: 200%;
}





```
