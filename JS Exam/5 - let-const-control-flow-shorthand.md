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
# Shorthand
```javascript
let a = 1;
let b = 2;
const obj = { a, b }
```

# Control-flow
* while
* if, else if
* switch

## Switch
* allows a program to evaluate an expression and attempt to match the expression's value to a case label
```javascript
let salary = 3000

switch (salary){
    case 0:
        console.log("You have no money");
        break;
    case 1000:
        console.log("Not bad");
        break;
    case 3000:
        console.log("You are rich!");
        break;
        
    default: 
        console.log("You have at least some money")
}

// -> You are rich!
```
