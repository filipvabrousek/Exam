## Basics
```js

console.log("Hello world");

var a = 8;
if (a > 8){
console.log(a * 3);
}
```

## Functions
```

function count(a, b){
    return a * b;
}

var res = count(3, 4);
console.log(res);
```

## Methods
```
let num = 18.2345;
let f = num.toPrecision(2);
let m = Math.exp(2, 3);

let str = "String";
let r = str.indexOf("r");

let array = [1, 2, 3];
array.forEach(function(a) {
    console.log(a * a);
});
```
            
## Objects
```
var P = {
  name: "Martin",
  age: 18
};

console.log(P.age);


// Object constructor:

function person(name, age){
    this.name = name;
    this.age = age;
}

person.prototype.greet = function(){
    return "Hi " + this.name + "! " + "You are " + this.age;
}

var me = new person("Martin", 18);
me.greet();

```
