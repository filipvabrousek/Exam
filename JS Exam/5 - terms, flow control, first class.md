# Important terms
## Scope

* area with set of variables and objects you have access to 
* LOCAL - can be only acessed within the same function
* GLOBAL variables are deleted when you close the browser window (or tab), but remains available to new pages loaded into the same window

## Hoisting
* default behavior of moving all declarations to the top of the current scope (to the top of the current script or the current function)



## Let, const 
* Let, const - block scoped
* var - function scoped



```javascript
{
    let a = 3;
}

console.log(a); // Reference error (same for const)


{
    var a = 3;
}

console.log(a); // 3

```
# Shorthand
```javascript
let a = 1;
let b = 2;
const obj = { a, b }
```

## Control-flow
* while
* if, else if
* switch

## Switch
* allows a program to evaluate an expression and attempt to match the expression's value to a case label

```javascript
function daysToMaturity(birth, country){
    
   let age = new Date().getFullYear() - birth; 
   let daysAlive = age * 365.5; 
   let maturityAge = 0; 
    
   let days = 0;
    
    switch(country){ // Czech
        case "Czech":
            maturityAge = 18;
            days = maturityAge * 365.5 - daysAlive;
            console.log(`You will be mature in ${days} days in Czech republic`);
            break;
            
        case "USA":
            maturityAge = 21;
            days = maturityAge * 365.5 - daysAlive;
            console.log(`You will be mature in ${days} days in USA`);
            break;
            
        default: 
            days = "I dont know";
            console.log(`Days: ${days}`);
            break;
    }
}


daysToMaturity(2011, "USA");


```



## First class functions
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
