# How the code is executed

![execution](http://i.imgur.com/2gXCI47.png)




# Execution contexts


Execution context is a concept in the language spec equates to the 'environment' a function executes in; that is, variable scope (and the scope chain, variables in closures from outer scopes), function arguments, and the value of the this object

# Phases:


## Creation phase
A) Argument object is created with all the parameters passed into function  
   Code is scanned for function declarations  
   Code is scanned for variable declarations (set to undefined) (hoisting) 
   
 B) Creation of the scope chain
 
 C) determining value of **this** 


## Execution phase
Code is ran line by line


------------------------------------------------------------------------------------------------------------
## Scope

* area with set of variables and objects you have access to 
* LOCAL - can be only acessed within the same function
* GLOBAL variables are deleted when you close the browser window (or tab), but remains available to new pages loaded into the same window

```js


```

## Hoisting
* default behavior of moving all declarations to the top of the current scope (to the top of the current script or the current function)


------------------------------------------------------------------------------------------------------------
# This

"**this**" points in:
* *regular function call* at global (Window) object
* *method call* to the object, that is calling the method

* the **this** keyword is not assigned a value until a function where it is defined is actually called 
* (when the new execution context is created)
