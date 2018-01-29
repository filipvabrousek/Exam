# DOM
* "Document object Model"
* connects web pages to scripts or programming languages

```js
window.isSecureContext
console.log(document.styleSheets);
```





# BOM
**window.**
* screen. (width, height, availWidth, availHeight, colorDepth, pixelDepth)
* location. (href, protocol, hostName, pathName)
* history (back, forward)
* alert, confirm, setTimeout, setInterval
* cookies
* geolocation

```js
navigator.geolocation.getCurrentPosition(show);

function show(position){
    console.log(`${position.coords.latitude} + ${position.coords.longitude}`)
}
```

```js
navigator.onLine ? 1 : console.log("You are offline");
```

# JSON
* JavaScript Standart Object Notation
* parse(), stringify()
* no string in JavaScript can contain a literal U+2028 or a U+2029

```js
let j = (new Date()).toJSON()
let back = new Date(j)
```

# Local storage
```javascript
let obj = {
    name: "Filip",
    age: 17
}

let JSONData = JSON.stringify(obj);
localStorage.setItem("data", JSONData);


let text = localStorage.getItem("data");
let res = JSON.parse(text);
console.log(res.name);

localStorage.a = 3;
```

```js
for (i in localStorage){
    console.log(localStorage[i]);
}

```


## Animation

```js
    let el = document.querySelector("div");

    let change = [
        {
    		transform: 'translateX(0)',
    		background: '#1abc9c'
    	},
    	{
    		offset: 0.8,
    		transform: 'translateX(15em)',
    		background: 'blue'
    	},
    	{
    		transform: 'translate(15em)',
    		background: 'green'
    	}
    ]




    el.addEventListener("click", () => {
    	el.animate(change, {
    		duration: 400,
    		fill: 'forwards'
    	});
    });
```

## Vibrate API
```js
navigator.vibrate(200)
```

## Touch
```js
window.addEventListener("touchstart", () => {
    console.log("Touched !");
});
    
```

## Audio API
```js
let type = "square";
let context = new AudioContext();
let osc = context.createOscillator();
osc.type = type;
osc.frequency.value = 400;
osc.connect(context.destination);
osc.start();
```

## Performance API
```js
performance.mark('');
console.log("Hello");
performance.mark('');
    
let marks = performance.getEntriesByType("mark");
console.log(`Time: ${marks[1].startTime - marks[0].startTime}`);

```

## Visibility API

```js
document.addEventListener("visibilitychange", () => {
    if (document.hidden){
        console.log("User has lost focus");
    }
});

```

## Video player
```html

	<div id="controls">
		<button>►</button> <input type="range" value="0">
	</div>
	
	<section id="title">
		<h2>Time (total)</h2>
	</section>
	
	<video data-time="4:03" height="430" loop="" src="http://clips.vorwaerts-gmbh.de/VfE_html5.mp4" width="765"/>
	
	
	<script>
	       
	   let video = document.querySelector("video");
	   let btn = document.querySelector("button");
	   let seekBar = document.querySelector("input");
	   let controls = document.querySelector("#controls");
	   let title = document.querySelector("#title");

	   function toggle() {
	       const method = video.paused ? "play" : "pause";
	       video[method]();
	       btn.textContent = video.paused ? "►" : "❚❚";
	   }

	   seekBar.addEventListener("change", () => {
	       let time = video.duration *  (seekBar.value / 100);
	       video.currentTime = time;
	   });

	   function handleChange() {
	       const percent = (video.currentTime / video.duration) * 100;
	       seekBar.value = percent;
	   }

	   window.addEventListener("keyup", e => {
	       if (e.keyCode === 32) { // spacebar
	           video.paused ? video.play() : video.pause();
	           btn.textContent = video.paused ? "►" : "❚❚";
	       }
	       e.keyCode === 13 ? video.webkitRequestFullScreen() : 0; // enter
	   });


	   btn.addEventListener("click", toggle);
	   seekBar.addEventListener("mousedown", () => video.pause());
	   seekBar.addEventListener("mouseup", () => video.play());
	   setInterval(handleChange, 500);

	   controls.addEventListener("mouseover", () => {
	       controls.classList.add("show");
	       controls.classList.remove("hide");
	   });

	   controls.addEventListener("mouseout", () => {
	       controls.classList.add("hide");
	       controls.classList.remove("show");
	   });



	   /*------------------------------------------------------------------------------*/
	   const nodes = Array.from(document.querySelectorAll("[data-time]"));
	   const seconds = nodes.map(node => node.dataset.time)
	       .map(timeCode => {
	           const [mins, secs] = timeCode.split(":").map(parseFloat);
	           return (mins * 60) + secs;
	       })
	       .reduce((total, seconds) => total + seconds);

	   // get hours and minutes from the seconds
	   let secondsLeft = seconds;
	   const hours = Math.floor(secondsLeft / 3600);
	   secondsLeft = secondsLeft % 3600; // 11 % 5 -> 1
	   let mins = Math.floor(secondsLeft / 60);
	   secondsLeft = secondsLeft % 60;

	   // log real time here: console.log(hours, mins, secondsLeft);
	   secondsLeft <= 9 ? secondsLeft = "0" + secondsLeft % 60 : secondsLeft % 60;
	   mins <= 9 ? mins = "0" + mins : mins;

	   document.querySelector("h2").innerHTML = hours + ":" + mins + ":" + secondsLeft; 
        // if we added another video, sum would increase
	</script>
	<style>
	       *{
	       font-family: Arial, "sans-serif";
	       }
	       
	       .title{
	           position: absolute;
	           top: 2em;
	       }
	       input{
	           width: 66em;
	       }
	       
	       video{
	           margin: 1em;
	           position: absolute;
	           top: 3.8em;
	           z-index: -1;
	       }
	       
	       div{
	           position: absolute;
	           top: 29em;
	           left: 1.5em;
	           padding-top: 0.6em;
	           background: #000;
	           height: 2em;
	           opacity: 0.8;
	           background: linear-gradient(180deg, rgba(255, 255, 255, 0.05) 10%, black 90%);   
	       }
	       
	       button{
	           background: none;
	           color: #fff;
	           font-size: 1.2em;
	       }
	       
	       .show{
	          opacity: 1;
	       transition: 0.6s;
	       }
	       
	       .hide{
	           opacity: 0;
	           transition: 0.6s;
	       }
	       
	</style>


```


## Bubbling
```js
const divs = document.querySelectorAll("div");
const button = document.querySelector("button");
    
// it goes DOWN the DOM captures where you clicked (one -> two -> three)
function log(e){
    console.log(this.classList.value); // then bubbles up three, two, one (firing off click events)
    // e.stopPropagation(); log just the clicked element
}
    
divs.forEach(div => div.addEventListener("click", log, {
   capture: true, // "false" Run on the way UP in DOM
    once: true
}))
    
    
/*
<div class="one">
<div class="two">
<div class="three">
</div>
</div>
</div> width 100%, padding: 100px

```
