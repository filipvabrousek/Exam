# Execution contexts


Execution context is a concept in the language spec equates to the 'environment' a function executes in; that is, variable scope (and the scope chain, variables in closures from outer scopes), function arguments, and the value of the this object

# How Execution contexts work in closures
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
