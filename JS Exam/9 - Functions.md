# Functions


# Call, Bind, Apply
* methods defined in the function prototype, which allow us to control what **this** is

```js
function pow(a){
    return a * a;
}


pow.bind(this)(6);
pow.call(this, 6);
pow.apply(this, [6]);

// 36

```



## Bind
* creates a new function that, when called, has **this** set to the provided value
* creates a new **bound function (BF)** - *boundGetX* - exotic function object that wraps the original function obj
* calling a BF generally results in the execution of its wrapped function

```javascript
this.x = 9;    
const module = {
  x: 81,
  getX() { return this.x; }
};

module.getX(); // 81

const retrieve = module.getX;
retrieve(); // 9
const boundGetX = retrieve.bind(module);
boundGetX(); // 81
```
## Call
* method calls a function with a given *this* (null) and args provided individually
* the slice method from array prototype is **called** on args




```javascript
const students = ["Filip", "Tereza", "Kaja"];

function w(){
    let args = Array.prototype.slice.call(arguments);
    console.log(`Welcome!  ${args.join(" ")}`);
}

w(...students);
//w.apply(null, students);
```


## Apply
* apply() method calls a function with a given **this** value, and args provided as an array (or an array-like object)
* The first arg to apply() sets the **this**, but **this** is not defined in Math.max, so we pass null (non - existent)

```javascript
var numbers = [5, 6, 2, 3, 7];
var max = Math.max.apply(null, numbers); 

// max = Math.max(numbers) -> NaN
```




# Using with objects
* **this:** terka object, **argument**: "evening" 

```javascript
const filip = {
  name: "Filip",
  P(time) {
    console.log(`Good ${time}. I am ${this.name}.`);
  }
};

const terka = {
  name: "Terka"
};

filip.P("morning");

filip.P.bind(terka)("evening");
filip.P.call(terka, "morning");
filip.P.apply(terka, ["evening"]);



```


------------------------------------------------------------------------------------------------------

# First class functions
```js
let years = [1990, 1999];


function AC(arr, fn){
    var arrRes = [];
    
    for (var i = 0; i < arr.length; i++){
        arrRes.push(fn(arr[i]));
    }
    
    return arrRes;
}


function calc(el){
    return 2017 - el;
}


let ages = AC(years, calc);
console.log(ages);




```


------------------------------------------------------------------------------------------------------

# Closures

* finally understand !!!!!!
```js
function A() {
	let a = 3;

	function B() {
		console.log(a);
	}

	return B;
}

let C = A();
C();              // 3 

```

------------------------------------------------------------------------------------------------------
# Functions without arguments

```js
function A() {
	let x = 3;

	function B() {
		console.log(x);
	}
	return B;
}

let F = A();
F(); // 3
```

# Mean
```js
function mean(arr){
    let len = arr.length;
    let avg = arr.reduce((sum, val) => sum + val, 0) / len;
    console.log(avg);
}

mean([1, 2, 3]);        // 2
```

------------------------------------------------------------------------------------------------------
# Function in array
```js

const arr = [1,
    false,
    {
        name: "Filip",
        adress: "111 Main st."
    },

    name => {
        const g = "Hello ";
        console.log(g + name);
    }
];


console.log(arr);
arr[3](arr[2].name);
```

