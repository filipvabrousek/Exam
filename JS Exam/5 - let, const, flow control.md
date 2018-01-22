
# LET, CONST
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

```js
let b = false; 
let c = 16;
let a = b || c;
console.log(a); //16
```

# CONTROL FLOW
* while
* if, else if
* for in (never use in arrays)
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
* exits when there is no more value
```js
let values = [1, 2, 3];

for (let num of values) {
    console.log(num);
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
    
    switch(country){ 
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

```js
let a = 10;

switch(a){
    case 1:
    case 2:
    // never gets here
        
        
    default:
        console.log("default");
        
    case 3:
        console.log("3");
        break;
    case 4:
        console.log("4");
}

```


## For

* deprecated approach
```js

let old = [1, 2, 12, 20];
let s = [];
const power = n => n*n;

for(let i = 0; i < old.length; i++){
    if (old[i] > 10){
    s.push(power(old[i]));
    }
}

console.log(old);
```


```js
let arr = [1, 2, 12, 20];
let s = [];

const isBig = n => n > 10;
const power = n => n*n;
const sum = arr.filter(isBig).map(power);
console.log(sum);

```

```js
function up(arr){
const sum = arr.reduce((a,b) => a + b, 0);
const mean = sum / arr.length;
const res = arr.filter(y => y > mean);
return res;
}

// get members above average
let res = up([2, 4, 6, 8]); // 6, 8
console.log(res);
    


```
