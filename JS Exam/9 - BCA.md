# Characteristics (B, C, A)
* Methods defined in the function prototype, which allow us to control what **this** is

```javascript
let func = function () {};
Object.getPrototypeOf(func).hasOwnProperty('bind') //true
```




# Bind
* creates a new function that, when called, has **this** set to the provided value
* creates a new **bound function (BF)** - *boundGetX* - exotic function object that wraps the original function obj
* calling a BF generally results in the execution of its wrapped function

```javascript
this.x = 9;    
var module = {
  x: 81,
  getX: function() { return this.x; }
};

module.getX(); // 81

var retrieveX = module.getX;
retrieveX(); // 9
var boundGetX = retrieveX.bind(module);
boundGetX(); // 81
```
# Call
* method calls a function with a given *this* (null) and args provided individually
* the slice method from array prototype is **called** on args

```javascript
const students = ["Filip", "Tereza", "Kaja"];

function w(){
    let args = Array.prototype.slice.call(arguments);
    console.log(`Welcome!  ${args.join(" ")}`);
}

w.apply(null, students);
```


# Apply
* apply() method calls a function with a given **this** value, and args provided as an array (or an array-like object)
* The first arg to apply() sets the **this**, but **this** is not defined in Math.max, so we pass null (non - existent)

```javascript
var numbers = [5, 6, 2, 3, 7];
var max = Math.max.apply(null, numbers); 

// max = Math.max(numbers) -> NaN
```




# 1
* the **this: terka object**, **argument: "evening"** 

```javascript
const filip = {
  name: "Filip",
  P(time) {
    console.log(`Good ${time}. I am ${this.name}.`);
  }
};

const terka = {
  name: "Terka"
};

filip.P("morning");

filip.P.bind(terka)("evening");
filip.P.call(terka, "morning");
filip.P.apply(terka, ["evening"]);



```