# FUNCTIONS

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

const M = {
  x: 81,
  get() { return this.x; }
};

M.get(); // 81

const retrieve = M.get;
retrieve(); // 9
const boundGet = retrieve.bind(M);
boundGet(); // 81
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

```js
let str = "bigger";
let b = String.prototype.toUpperCase.apply(str);
console.log(b); // BIGGER
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

# FIRST CLASS FUNCTION


```js
let years = [1990, 2009];

let C = (arr, fn) => arr.map(fn);
   
let calc = el => 2018 - el;

let res = C(years, calc); 
console.log(res); //28, 9
```


------------------------------------------------------------------------------------------------------

# CLOSURES
- **Closure is when a function can remember and access its lexical scope even when it's invoked outside its lexical scope**

- B() has lexical scope access to scope of ```A()```  
- after we excute ```A()```, we assign the value it returned (inner ```B()``` function) to a variable called ```F```
- ```F()``` invokes inner ```B()```, but in this case, ```B()``` it's executed outside of its declared lexical scope
- after ```A()``` executed, normally we would expect the inner scope of ```A()``` go away, because of the engine's Garbage collector
- but the magic of closures won't let it happen
- the inner scope of ```A()``` is still in use - by ```B()```  
- ```B()``` has a lexical scope closure over the inner scope of ```A()```
- this keeps the scope alive for ```B()``` to reference it any time  
- ```B()``` still has a reference to that scope, and this reference is called the **CLOSURE**

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

* ```timer()``` has a scope closure over the scope of ```wait()```, keeping and using reference to the "m" variable
* a 1000ms after we executed ```wait()``` and its inner scope should otherwise be long gone, the ```timer()``` still has a refrence over that scope (has a **closure**)
```js
function wait(m){
    setTimeout(function timer(){
        console.log(m);
    }, 1000);
}

wait("Hi");

```

* doesn't work ): - (works with ```let```)

```js
for (var i=1; i<=5; i++) {
	setTimeout( function timer(){
		console.log( i );
	}, i*1000 );
}
```
* does work :) 
```js
for (var i=1; i<=5; i++) {
	(function(j){
		setTimeout( function timer(){
			console.log( j );
		}, j*1000 );
	})( i );
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






# ARROW FUNCTIONS

* don't have prototype property 
* can't be used as constructors
* can't be called with **new** 
* can't have duplicate name parameters  - ```(foo, foo) => {} // -> ERROR```
* don't bind its own: this, args, super, new.target


## 1
* don't bind own **this**
```javascript

function P(name){
    this.name = name;
}

P.prototype.G = function(){
   console.log(this.name); 
}

P.prototype.G2 = () => {
   console.log(this.name); 
}


const me = new P("Filip");
me.G(); // Filip
me.G2(); // undefined

    
```

## 2
```js
let me = {
	name: "Filip",
	goals: ["run", "climb"],
	
	show() {
		this.goals.forEach((goal) => {
			console.log(this.name + " loves to " + goal);
		});
	},
	
	show2() {
		this.goals.forEach(function(goal) {
			console.log(this.name + " wants to " + goal);
		}.bind(this));
	},
	
	show3() {
		let self = this;
		this.goals.forEach(function(goal) {
			console.log(self.name + " will " + goal);
		});
	}
};



me.show();
me.show2();
me.show3();


```



## 3

```javascript
class P {
    constructor(prefix) {
        this.prefix = prefix;
    }
    pa(arr) {
        return arr.map(x => this.prefix + x); // (A)
    }
}

const arr = ["Terka", "Filip"];
const p = new P("Hi, ");
p.pa(arr);
```



## IIFE
```javascript
(() => {
    return 123
})();

(() => 'foobar')();
```

# new
```js
function numbers(...values) {

    if (typeof new.target === "undefined") {
        throw new Error("This f. must be called wth new");
    }

    this.values = values;
}

let instance = new numbers(1, 2, 3);
console.log(instance.values);

numbers(1, 2, 3);
```


# Top level functions
(not associated with any object)

* eval()
* uneval() - opposite of eval
* isNaN(), isFinite()....
* encodeURI
* decodeURI

```js
let set3 = "ABC 123";
let e = encodeURI(set3);
// ABC%20123
```


