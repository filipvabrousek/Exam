# EXECUTION CONTEXTS

**Execution context** = abstract concept of the environment in which the current code is being evaluated in  
either *global* or *function*


## Creation phase
A)   
Argument object is created with all the parameters passed into function    
   Code is scanned for **function declarations**   
   Code is scanned for **variable declarations** (set to undefined = hoisting happens)  
   
 B) **scope chain** is created
 
 C) **this** value is determined


## Execution phase
Code is ran line by line

![execution](http://i.imgur.com/2gXCI47.png)
## Perform execution
* Engine - responsible for start to finish compilation
* Compiler - one of engine's friends, handlers parsing and code generation
* Scope - maintains list of variables and enforces accessibility rules
```js
var a = 2;

```
* JS Engine sees 2 statements: ```var a``` and ```a = 2```
* 1st: compiler phase task, 2nd: execution phase task


------------------------------------------------------------------------------------------------------------
# SCOPE
 a space in which the variable it defines are accessible  
 LOCAL - can be only acessed within the same function  
 GLOBAL variables are deleted when you close the browser window (or tab), but remains available to new pages loaded into the same window  
LEXICAL SCOPING: a function, that is lexically within another function, gets access to the scope of outer function


* **EXECUTION STACK:** order in which functions are *called*:
```
third()
second()
first()
Global EXC 
```
* **SCOPE CHAIN:** order in which functions are *written lexically*:
```
Global Scope 
   first() 
      second() 
    third()
```

* execution stack is **different** from the scope chain

```js
let a = "Hello ";
first();

function first(){
    let b = "Hi! ";
    second();
    
    function second(){
        let c = "Hey! ";
        console.log(a + b + c); 
        third();
    }
}

function third(){
    let d = "Filip";
    // console.log(c); -> ERROR "c" is in different scope, in different execution context
    console.log(a + d);
}

// Hello Filip

```




------------------------------------------------------------------------------------------------------------
# HOISTING
* default behavior of moving all declarations to the top of the current scope (to the top of the current script or the current function)

```js
console.log(age);      // -> undefined (values ARE NOT HOISTED)
var age = 23;          // if there was NO variable we would get NOT DEFINED error



pow(2);               // 4 (functions declarations ARE HOISTED)
function pow(a){
    console.log(a * a);
}


pow2(3);               // -> ERROR pow2 is NOT DEFINED 
let pow2 = function(a){
    console.log(a * a);
}




function foo(){
    console.log(age);
    var age = 65;
    console.log(` age in the VO of the EXC of the "foo()": ${age}`); 
}
//  UNDEFINED, 65




foo();
console.log(` age in the VO of the global EXC object: ${age}`);          
//  23

```

```js
var a;

a; // undefined
b; // ReferenceError: b is not defined

typeof a; // UNDEFINED
typeof b; // UNDEFINED
```

------------------------------------------------------------------------------------------------------------
# THIS

"**this**" points in:
* regular function call -  at global (Window) object
* method call -  to the object, that is calling the method

the **this** keyword is only assigned a value, when the object calls the method
```js
const filip = {
    birth: 1999,
  
    calc() {
        console.log(this);
        console.log(2017 - this.birth);   //18

        function inner() {
            console.log(this);            //"window object"
        }
        inner();
    }
}

filip.calc();                              // 18


const terka = {
    birth: 2000
};

terka.calc = filip.calc
terka.calc();                             //17


```
## 4 Rules of "this" binding

1) ```new``` binding - using the newly constructed object
```js

function F(a) {
	this.a = a;
}

let bar = new F(2);
console.log(bar.a); // 2


```

2) explicit binding - using the specified object

```js
function F() {
	console.log(this.a);
}

let obj = {
	a: 2
};

F.call(obj); // 2
```

3) implicit binding - using the context object
```js
function F() {
	console.log(this.a);
}

let obj = {
	a: 2,
	F: F
};

obj.F();
```


4) default binding - inside function or at global object - (Window object), "undefined" in strict mode

```js
console.log(this.a);
```






---------------------------------------------------------------------------
# INHERITENANCE

* JS has one construct: objects
* each object has a private property - [[Prototype]] (holds a link to another object called its prototype)
* that prototype object has a prototype of its own, and so on until an object is reached with **null** as its prototype (end of the chain)

## .prototype vs __proto__
* just functions have **prototype**  
* **__proto__** is something all objects have including constructors  - (shouldn't be accessible) 

## Object.create
* creates a new object 
* prototype of this object is the first argument of the function

```javascript
let a = {a: 1}; 
```
 a ---> Object.prototype ---> null
```javascript
let b = Object.create(a);
console.log(b.a); // 1 (inherited)
```
 b ---> a ---> Object.prototype ---> null

```javascript
let c = Object.create(b);
console.log(c.a); // 1 (inherited)
```
 c ---> b ---> a ---> Object.prototype ---> null


```javascript
let d = Object.create(null);
console.log(d.hasOwnProperty); 
```
 d ---> null
 undefined, because d doesn't inherit from Object.prototype

## Explained
```js


// Prototype is a property on a constructor function that sets what will become the _proto__ property on the constructed object

function Point(x, y){
    this.x = x;
    this.y = y;
}

var coord = new Point(1,1);


console.log(Point.prototype) //object (constructor is the Point() function)
console.log(Point.constructor) //regular function
console.log(Point.prototype
            .__proto__ // Object object
                .constructor // Object function
                    .__proto__.call // function object with (eg. call)
           ); 

console.log(Point.prototype.constructor == coord.constructor); // TRUE, Point(x, y){ this.x = x....}
console.log(coord.prototype) // undefined (just functions have prototype)

console.log(coord
            .__proto__ // constructor object with constructor function (.constructor.prototype LOOP!!!!)
                .__proto__ // Object object (with eg. hasOwnProperty)
                    .__proto__ // NULL 
           );





console.log(coord
            .__proto__ // Point(x,y) constructor 
                .constructor// Point(x,y) function definition  this constructor has another __proto__
                    .__proto__ // function ƒ () { [native code] }
                        .__proto__ // Object object
                            .__proto__ // NULL 
             
           );










console.log(coord.__proto__ == Point.prototype); // true
console.log(coord.__proto__.__proto__ == Object.prototype); // true
console.log(coord.__proto__.constructor.prototype == Point.prototype); // true (if we ad more.constructor.prototype , the RESULT WILL BE THE SAME!)
// same as
let same = Point.prototype.constructor.prototype;



console.log(Point.__proto__ == Function.prototype); // true (Point is the function, so it has the same prototype)
console.log(Point.prototype.__proto__); // Object object
```

* constructors DO NOT have prototype
* __proto__ non standard way of accessing prototype chain
```js


let e = new Number(0);
console.log(e.__proto__); // "Number {}". IT DOES NOT HAVE THE PROTOTYPE just "Number {}" with all the methods
console.log(e.__proto__.toExponential.constructor) // function, prototype of this is also a function
```
```

```js
function Animal() { }
var animal = new Animal();
```
![diagram](https://i.imgur.com/jIUcjCy.jpg)




## Beware
* The ability of a JS function to access ```call(..)```, ```apply(..)```, and ```bind(..)``` is because functions themselves are objects, and function-objects also have a ```[[Prototype]]``` linkage, to the ```Function.prototype``` object, which defines those default methods that any function object can delegate to. (You can acces them too !)




-------------------------
## RHS = Right-hand side assignment
we are looking up for the value of "a"

```js 
console.log(a);
```


## LHS - Left-hand side assignment
we don't care about value, we simply want to find the variable as a target for the assignment operation

```js
a = 2 
```

## Conversation

```js
function F(a){
    console.log(a);
}

F(2);

```

- Engine: I have an RHS refrence for "F()". Ever heard of it?
- Scope: Yes I have. Compiler declared it just a second ago
- Engine: Hey, Scope, I've got an LHS reference for "a", ever heard of it?
- Scope: Why yes, I have. Compiler declared it as a formal parameter to "F()" just recently. Here you go.
- Engine: Now, time to assign 2 to a.
- Engine: I need RHS look up for the console
- Scope: OK
- Engine: Perfect. Looking up log(..). OK, it's a function.
- Engine: Can you help me with RHS refernce with "a"? I just want to double check.
- Scope: Hasn't changed
- Engine: Cool. Passing the value of "a" which is "2" into "log(..)"
