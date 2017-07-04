
# Let, const 
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


# Control flow
* while
* if, else if
* for in
* for of (only iterable collections)
* switch

## while
```js
let i = 1;

do {
    i++;
}
while (i < 10);
```

## for in
```js
let filip = {
    name: "Filip",
    age: 18
}

for (prop in filip){
    console.log(prop);
}


```

## for of
```js
let arr = ["Filip", "Terka"];

for (p of arr){
    console.log(p);
}

```


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




