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
- **Closure is when a function can remember and access its lexical scope even when it's invoked outside its lexical scope**

- B() has lexical scope access to scope of ```A()```  
- after we excute ```A()```, we assign the value it returned (inner ```B()``` function) to a variable called ```F```
- ```F()``` invokes inner ```B()```, but in this case, ```B()``` it's executed outside of its declared lexical scope
- after ```A()``` executed, normally we would expect the inner scope of ```A()``` go away, because of the engine's Garbage collector
- but the magic of closures won't let it happen
- the inner scope is still in use by ```B()```  
- ```B()``` has a lexical scope closure over the inner scope of ```A()```
- this keeps the scope alive for ```B()``` to reference it any time  
- ```B()``` still has a reference to that scope, and this is called the **CLOSURE**

```js
function A() {
	let x = 3;

	function B() {
		console.log(x);
	}

	return B;
}

let F = A();
F();              // 3 

```

```js
for (let i = 1; i <= 5; i++) {

    setTimeout(() => {
        console.log(i);
    }, i * 1000);
}
```

------------------------------------------------------------------------------------------------------
# Functions without arguments

```js
function sum() {
	let sum = 0;
	for (const arg of arguments) {
		sum += arg;
	}
	console.log(sum);
}
sum(1, 2, 3);
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
# Function in an array
```js

const arr = [
    {
        name: "Filip",
    },

    name => {
        const g = "Hello ";
        console.log(g + name);
    }
];


console.log(arr);
arr[1](arr[0].name);
```
------------------------------------------------------------
# Creating new Function
```js
var e = new Function( "a", "return a * 2;" );
e(4);
```
