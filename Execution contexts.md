# Execution contexts


# How Execution contexts work in closures
After anonymous function returns, STH stays in memory
Then, after sayHi creates new execution content, and find STH sitting there
(due to SCOPE CHAIN, if variable isnt found in local function, it goes down in the scope chain and looks for it there)


```javascript
function greet(sth){
    return function(name){
        console.log(sth + " " + name);
    }
}

var sayHi = greet("Hi");
sayHi("Tony");


// + Promises, generators, iterators, modules
```
