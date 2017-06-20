# How the code is executed

![execution](http://i.imgur.com/2gXCI47.png)




# Execution contexts


Execution context is a concept in the language spec equates to the 'environment' a function executes in; that is, variable scope (and the scope chain, variables in closures from outer scopes), function arguments, and the value of the this object

# Phases:

1) **Creation phase**  
A) Creation of the variable object (VO)  
B) Creation of the scope chain  
C) Determining value of "this" variable  

2) **Execution phase**    
Code is ran line by line.  


## Creation phase
A) Argument object is created with all the parameters passed into function  
   Code is scanned for function declarations  
   Code is scanned for variable declarations (set to undefined) (hoisting) 
   
 B) JS Engine goes all the way up of scope chain
 
 C) Value of "this is determined"  


## Execution phase
Code is ran line by line

# How execution contexts work in closures
After anonymous function returns, STH stays in memory
Then, after sayHi creates new execution content, and find STH sitting there
(due to SCOPE CHAIN, if variable isnt found in local function, it goes down in the scope chain and looks for it there)


```javascript
function greet(sth){
    return name => {
        console.log(`${sth} ${name}`);
    }
}

const sayHi = greet("Hi");
sayHi("Tony");

```
