# METHODS

# String
constructor for strings, or a sequence of characters
```String.prototype``` returns object with all the methods (inheritenance)
when using ``` "Text".length;``` JS automatically boxes the value (wraps to ```String(...)```)
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
* slice
* split
* substr - (start, length)
* substring - (start, index)
* toString
* trim - removes whitespace on the sides
* valueOf
* match - str.match(re) - re = regular expression
* normalize
* fromCodePoint





## Raw 
* only method of template literals
```js
String.raw({ raw: 'test' }, 0, 1, 2);
```

```js
function F(strings, ...values){
    console.log(strings);
    console.log(values);
}

let desc = `Filip`
F`I am ${desc}`;
```



# Other
**slice**
* start = neg. -> slice() will set char from the end of the str.
* stop = neg. -> slice() will set stop to (string.length - 1) - stop

**substring(start, stop)** 
* if start = stop, it returns an empty String
* if start > stop args will be swapped 
* if we omit stop chars to the end of the string are extracted
* treates negative and NaN as 0

**substr (start, length)**
```js
let s = "Hi there !";

let sliced = s.slice(1, -2); // i there

let split = s.split(' ', 2);
 // ["Hi", "there"]

let v = s.substr(1, 3); //(i t)

let q = s.substring(1, 3) //i


let re = /[A-Z]/g;
let search = s.search(re); // 0


let pad = "abc".padEnd(6, "123456"); // abc 123

let norm = '\u1E9B\u0323'.normalize('NFC') // NFC, NFD, NFKC, NFKD     // ẛ̣

String.fromCodePoint(134071); // 𠮷

```


----------------------------------------------------------------------------------
# Number
wrapper object allowing you to work with numerical values (number constructor)
```Number.prototype``` returns object with all the methods (inheritenance))

* isFinite
* isNaN
* toExponential
* toFixed
* toString
* toPrecision
* valueOf
* isSafeInteger - number between -(2<sup>53</sup> - 1) and (2<sup>53</sup> - 1)
* toLocaleString

```js
(2).toFixed(2);
12000..toLocaleString("de-DE", {style: "currency", currency: "EUR"}); //  // 12.000,00 € (Germany)
```
```js
if (!Number.isNaN){
    Number.isNaN = function(n) {
        return n !== n
    }
}

```

## binary and octal literals
```js
0b111110111 === 503 // true
0o767 === 503 // true

```

----------------------------------------------------------------------------------
# Object
Object constructor creates an object wrapper

* hasOwnProperty
* isPrototypeOf
* getPrototypeOf
* setPrototypeOf
* getOwnPropertyDescriptor - 2 arg.
* getOwnPropertyDescriptors - 1
* getOwnPropertyNames - 1
* getOwnPropertySymbols - 1
* preventExtensions
* toString
* valueOf
* assign
* defineProperty
* seal
* freeze
* isSealed
* isFrozen


## isPrototypeOf (is __proto__ of)
```javascript
function A(){}
function B(){}
function C(){}

B.prototype = Object.create(A.prototype)

const c = new C(); 
console.log(C.prototype.isPrototypeOf(c)); // TRUE
console.log(c.__proto__ == C.prototype); // TRUE
```




## assign
```javascript
let obj = {a: 1};
let copy = Object.assign({}, obj);
console.log(copy); // {a: 1};
```

## Property descriptors - defineProperty
* enumerable - will be included if the object's properties are iterated through
```js
let obj = {
    a: 2
};


Object.defineProperty(obj, "a", {
    value: 4,
    writable: false, 
    configurable: true, 
    enumerable: true
});


obj.a; // 4
obj.a = 6;
obj.a; // 4

```

```js
let obj = {
    name: "Filip",
    age: 18
};

let des = Object.getOwnPropertyDescriptor(obj, "name");
// {value: "Filip", writable: true, enumerable: true, configurable: true}
let alldes = Object.getOwnPropertyDescriptors(obj);
// age: {v.....} 
// name:{v.....}
let names = Object.getOwnPropertyNames(obj);
 // ["name", "age"]


```
## freeze, seal
* seal: prevents addign or deleting
* freeze: same as seal, but prevents changing existing properties
```js
let obj = {
    name: "Filip"
};


Object.seal(obj);
obj.a = "Text";
console.log(obj.a); // Undefined
obj.name = "Terka";
console.log(obj.name); // Terka


Object.freeze(obj);
obj.name = "Kaja";
console.log(obj.name); //Terka


```
## Get 
```js
let obj = {
   arr: ["Filip", "Terka"],
    get latest(){
        if (this.arr.length !== 0){
            return this.arr[this.arr.length - 1];
        }
    }
}

console.log(obj.latest);


```

----------------------------------------------------------------------------------
# Array 
global object that is used in the construction of arrays
array with empty lots (holes) = sparse array

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
* every
* all
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


## other
```js
let n = [8, 16];

console.log(n.find(n => n > 10));         // 16
console.log(n.findIndex(n => n > 10));    // 1

const f = ["Terka", "Filip", "Karel", "Lucy"];
f.shift(); // "Terka"
f.unshift(); // 4

const n = [65, 44, 12, 4];
let sum = (total, num) => total + num;
n.reduce(sum) // 125

var ages = [22, 21, 17];
const check = (age) => age >= 18;
ages.filter(check); // 22, 21
```


## Slice vs Splice
**Slice** - does not change original array, returns selected els. as a new object
**Splice** - changes original array  
arg 1: index (neg. values to count from the end)
arg 2: optional, how many removed, 0: nothing remvoed, missing: all items from the selected index removed  
arg 3: what should be added  

```js
// SPLICE mutates the original array !!!!!! (uncomment other mutation when testing)
const a = ["A", "B", "C", "D"];

a.splice(1);    // B C D -> (same as (1, 3))
a.splice(1, 2);   // B C 
a.splice(0, -2); // [] EMPTY
a.splice(2, 0, "Filip"); // ["A", "B", "Filip", "C", "D"]
a.splice(1, 1, "Filip"); // ["B"]
a.splice(1, 2, "Filip"); // ["A", "Filip", "D"]


a.slice(1);    // B C D 
a.slice(1, 2); // B
a.slice(0, -2); // A B

```

## isArray polyfill
```js
if (!Array.isArr){
    Array.isArr = function(arg){
        return Object.prototype.toString.call(arg) === "[object Array]";
    };
}
```


----------------------------------------------------------------------------------
# Date

* toString
* toUTCString
* toDateString

```javascript
let d = new Date(99,6,20,20,28,00,0);
// Tue Jul 20 1999 20:28:00 GMT+0200 (CEST)
```
# Math 

* sin
* cos
* tan
* pi
* round
* max
* min
* random - from interval <0, 1)
* sqrt
* pow
* LOG10
* SQRT1_2

```js
let e = Math.pow(9, 3);
console.log(e);
```
-----------------------------------------------------

## Defining own methods


```js
String.prototype.longerThan = function(limit){
    return this.length > limit;
}

console.log("Car".longerThan(2));
```




