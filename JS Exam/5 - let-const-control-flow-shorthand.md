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


# Control-flow
* while
* if, else if
* switch

## Switch
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
