# Built-in methods

# String
constructor for strings, or a sequence of characters
```String.prototype``` returns object with all the methods (inheritenance)

* startsWith
* endsWith
* includes
* charAt
* charCodeAt
* repeat
* concat
* includes
* indexOf
* repeat
* replace
* search
* splice
* split
* substring
* toString
* trim
* valueOf
* match - str.match(re) - re = regular expression
* fromCodePoint


## repeat
```javascript
'oh '.repeat(2);
"oh oh "
```

## String.fromCodePoint
```javascript
console.log(String.fromCodePoint(134071));
```

## Template literals
```javascript
let count = 10,
    price = 0.25,
    message = `${count} items cost $${(count * price).toFixed(2)}.`;

console.log(message);       // "10 items cost $2.50."
```
# Number
wrapper object allowing you to work with numerical values (* number constructor)
```Number.prototype``` returns object with all the methods (inheritenance)

* isFinite
* isNaN
* toExponential
* toFixed
* toString
* toPrecision
* valueOf


# Object
Object constructor creates an object wrapper

* hasOwnProperty
* isPrototypeOf
* getPrototypeOf
* setProtoTypeOf
* toString
* valueOf
* assign

## isPrototypeOf
```javascript
function A(){}
function B(){}
function C(){}

B.prototype = Object.create(A.prototype)

const c = new C();
console.log(C.prototype.isPrototypeOf(c));
```


## setPrototypeOf, getPrototypeOf
```javascript
let P = {
    g() {
        return "Hello";
    }
};


let F = {
    g() {
        return Object.getPrototypeOf(this).g.call(this) + ", hi!";
    }
};

// set prototype to person
Object.setPrototypeOf(F, P);
console.log(F.g());                      // "Hello, hi!"
console.log(Object.getPrototypeOf(F) === P);  // true
```


## Assign
```javascript
const obj = { foo: 123 };
Object.assign(obj, { bar: true });
console.log(JSON.stringify(obj));
```



# Array 
global object that is used in the construction of arrays


* join
* push
* pop
* of
* shift
* unshift
* fill
* filter
* find
* from
* forEach
* reverse
* include
* reduce
* entries
* bind
* call
* apply
* some
* sort
* slice
* splice

## from

```javascript
function T() {
    return Array.from(arguments, (value) => value + 1);
}
let numbers = T(1, 2, 3);
console.log(numbers);               // 2,3,4
```

## find, findIndex
```js
let n = [8, 16];

console.log(n.find(n => n > 10));         // 16
console.log(n.findIndex(n => n > 10));    // 1
```

## shift, unshift
```javascript
const f = ["Terka", "Filip", "Karel", "Lucy"];
f.shift(); // "Terka"
f.unshift(); // 4
```


## Reduce
```javascript
var n = [65, 44, 12, 4];
const sum = (total, num) => total + num;
n.reduce(sum);
```

## Entries
```javascript
const a = ['a', 'b', 'c'];
const iterator = a.entries();

console.log(iterator.next().value); // [0, 'a']
console.log(iterator.next().value); // [1, 'b']
console.log(iterator.next().value); // [2, 'c']
```



## Filter, Some, Every
```javascript
var ages = [22, 21, 17];
const check = (age) => age >= 18;
ages.filter(check);
```
## Slice
```javascript
let p = ["Terka", "Filip", "Karel", "Lucy"];
let boys = p.slice(1, 3);
```
## Splice
```javascript
let p = ["Terka", "Filip", "Karel", "Lucy"];
let boys = p.splice(1, 2);
```

## Raw
```javascript
function raw(literals, ...substitutions) {
    let result = "";

    // run the loop only for the substitution count
    for (let i = 0; i < substitutions.length; i++) {
        result += literals.raw[i];      // use raw values instead
        result += substitutions[i];
    }

    // add the last literal
    result += literals.raw[literals.length - 1];

    return result;
}

let message = raw`Multiline\nstring`;

console.log(message);           // "Multiline\\nstring"
console.log(message.length);    // 17
```

# Another object methods
## Date

* toString
* toUTCString
* toDateString

```javascript
let d = new Date(99,6,20,20,28,00,0);
// Tue Jul 20 1999 20:28:00 GMT+0200 (CEST)
```
## Math 

* sin
* cos
* tan
* pi
* round
* max
* min
* random
* sqrt
* pow


