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
      <button>►</button>
 <input value="0" type="range"/>   
    </div>   

    <video width="765" height="430" src="http://clips.vorwaerts-gmbh.de/VfE_html5.mp4" loop>
  

        
    <script>
        
    let video = document.querySelector("video");
    let btn = document.querySelector("button");
    let seekBar = document.querySelector("input");
    let controls = document.querySelector("#controls");    
        
        
    function toggle(){
        const method = video.paused ? "play" : "pause";
        video[method]();
        btn.textContent = video.paused ? "►" : "❚❚";
    }    
          
    seekBar.addEventListener("change", () => {
       let time = video.duration * (seekBar.value / 100);
    video.currentTime = time;
    });
        
    function handleChange(){
        const percent = (video.currentTime / video.duration) * 100;
        seekBar.value = percent;
    }
        
   window.addEventListener("keyup", e => {
       if (e.keyCode === 32){
           video.paused ? video.play() : video.pause();
           btn.textContent = video.paused ? "►" : "❚❚";
       }
   });
        
    video.addEventListener("mousemove", e =>{
        console.log("L")
        if (e.offsetTop > 100){
            video.requestFullscreen();
        }
    })
        
    

        
        
btn.addEventListener("click", toggle);
seekBar.addEventListener("mousedown", () => video.pause());
seekBar.addEventListener("mouseup", () => video.play());
setInterval(handleChange, 500);
 
// controls.addEventListener("mouseenter", () => controls.classList.add(".hide"));   

    </script>
        
    <style>
       
        input{
            width: 66em;
        }
        
        video{
            margin: 1em;
            position: absolute;
            z-index: -1;
        }
        
        div{
            position: absolute;
            top: 26em;
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
        
        /* dead classes */
        .show{
           opacity: 1;
            transition: 0.6s;
        }
        
        .hide{
            opacity: 0;
            
        }
        
        </style>
```
