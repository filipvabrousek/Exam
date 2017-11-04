# EXECUTION CONTEXTS

**Execution context** = abstract concept of the environment in which the current code is being evaluated in  
either *global* or *function*


## Phases
* creation:
A)   
Argument object is created with all the parameters passed into function    
Code is scanned for **function declarations**   
Code is scanned for **variable declarations** (set to undefined = hoisting happens)  

B) **scope chain** is created
 
C) **this** value is determined

* execution:
Code is ran line by line




## Compilation

1) tokenizing/lexing 
* breaking up a string of charactres into meaningful (to JS engine) chunks, called tokens
var a = 2; // -> var, a, =, 2,;

2) parsing
* taking stream of tokens and turning it into AST (tree of nested elements (variable declaration (val. is a) child. identifier, num literal))

3) code generation
* AST -> executable code (etc. creating space for variables)





## Perform execution
* Engine - responsible for start to finish compilation
* Compiler - one of engine's friends, handlers parsing and code generation
* Scope - maintains list of variables and enforces accessibility rules

```js
var a = 2;

```
* JS Engine sees 2 statements: ```var a``` and ```a = 2```
* 1st: compiler phase task, 2nd: execution phase task
* LHS - assigning to a variable (left hand side asignment)
* RHS - retrieving its value

```js
function F(a){
    console.log(a);
}

F(2);

```
- E: RHS for "F()" ?, 
- E: LHS for "a" ? (scope has, compiler declared it as a param. to F()),
- E: time to assing 2 to "a"
- E: RHS checking for "console", double checking for "a" passing it into log



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

function N(name) {
	this.name = name;
}

let me = new N("Filip");
console.log(me.name);       // "Filip"


```

2) explicit binding - using the specified object

```js
function P() {
	console.log(this.age);
}

let p = {
	age: 18
};

P.call(p);        // 2
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

### __proto__  or [[Prototype]] 
* each object has a private property - __proto__ (holds a link to another object down in the prototype chain)
* that prototype object has a __proto__ of its own, and so on until an object is reached with **null** as its __proto__ (end of the chain)  
* ```setPrototypeOf``` methods sets the __proto__ (it has **NOTHING** to do with the **.prototype** !!!!)

### .prototype 
* is created just on functions in case you want to use the constructors with "new"  
* sets what will become the __proto__ property on the constructed object  
* it is a protototype of things constructed with the function (NOT ITS PROTOTYPE)   

```js

let human = {
    group: "Triblastica"
}

let filip = {
    name: "Filip"
}

Object.setPrototypeOf(filip, human); // this actually sets the __proto__ !!!!!!
human.age = 18;


console.log(filip.group) 	// Diblastica
console.log(filip.__proto__) 	// {group: "Diblastica", age: 18}
console.log(filip.age) 		// 18

```

```js
function Person() {}
Person.prototype.name = "Karel";

let karel = new Person();
console.log(karel.name)
console.log(Person.prototype === karel.__proto__) // TRUE karel.__proto__ is {name: "Karel", constructor: ƒ} 
console.log(Person.__proto__ === Function.prototype) // TRUE

console.log(Person.prototype)	 // {name: "Karel", constructor: ƒ}
console.log(Person.__proto__) 	 // ƒ () { [native code] }
```

## Another example
```js
// .prototype sets what will become the proto property on the constructed object
let a = new Number(9);
let b = 9;
console.log(Number.prototype === b.__proto__); // TRUE


console.log(a == b); // TRUE
console.log(a === b); // FALSE 




function P(name){
    this.name = name;
}

P.prototype.age = 18;

let w = new P("Terka")
console.log(w.__proto__.age === P.prototype.age) // TRUE
```



## Prototype is an Object
```js
function Foo() { /* .. */ }

Foo.prototype = { /* .. */ }; // create a new prototype object

var a1 = new Foo();
console.log(a1.constructor === Foo) // FALSE because we set the prototype to Object
console.log(a1.constructor === Object)// TRUE because we set the prototype to Object

```

## Beware
* The ability of a JS function to access ```call(..)```, ```apply(..)```, and ```bind(..)``` is because functions themselves are objects, and function-objects also have a ```[[Prototype]]``` linkage, to the ```Function.prototype``` object, which defines those default methods that any function object can delegate to. 

```js
Window.prototype.__proto__ == Window.prototype.constructor.prototype.__proto__ // true
```



## New 
```js
function Person(name){
    this.name = name;
}

Person.prototype.greet = function(){
    console.log("I am", this.name);
}

function shiny(constructor){
    let obj = {}
    Object.setPrototypeOf(obj, constructor.prototype);
    let argsArr = Array.from(arguments);
    constructor.apply(obj, argsArr.slice(1));
    return obj
}



let filip = shiny(Person, "Filip");
filip.greet();

```
![execution](http://i.imgur.com/2gXCI47.png)
