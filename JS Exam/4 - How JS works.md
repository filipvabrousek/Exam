# Execution contexts

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


------------------------------------------------------------------------------------------------------------
# Scope
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
# Hoisting
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
# This

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

**Rules:**:
1) default binding - inside function at global object  
2) implicit binding
```js
function foo() {
	console.log( this.a );
}

var obj = {
	a: 2,
	foo: foo
};

obj.foo(); // 2

```
3) explicit binding

```js
function foo() {
	console.log( this.a );
}

var obj = {
	a: 2
};

foo.call( obj ); // 2
```

4) ```new``` binding
```js
function foo(a) {
	this.a = a;
}

var bar = new foo( 2 );
console.log( bar.a ); // 2


```
---------------------------------------------------------------------------
# Inheritenance

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


---------
# LHS, RHS

## RHS = Right-hand side assignment
we are looking up for the value of "a"

```js console.log(a);```


## LHS - Left-hand side assignment
we don't care about value, we simply want to find the variable as a target for the assignment operation

```js a = 2 ```

## Conversation

```js
function F(a){
    console.log(a);
}

F(2);

```

- Egine: I have an RHS refrence for "F()". Ever heard of it?
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
