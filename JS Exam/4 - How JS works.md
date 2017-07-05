# Theory

## Execution contexts

**Execution context** = 'environment' a function executes in  
(variable scope, and the scope chain, variables in closures from outer scopes, args, value of **this**)


## Creation phase
A) Argument object is created with all the parameters passed into function  
   Code is scanned for function declarations  
   Code is scanned for variable declarations (set to undefined) (hoisting) 
   
 B) Scope chain is created
 
 C)value of **this**  is determined


## Execution phase
Code is ran line by line

![execution](http://i.imgur.com/2gXCI47.png)


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




------------------------------------------------------------------------------------------------------------
# This

"**this**" points in:
* *regular function call* at global (Window) object
* *method call* to the object, that is calling the method

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
