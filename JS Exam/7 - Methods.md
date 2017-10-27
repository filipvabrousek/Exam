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
* substring
* toString
* trim - removes whitespace on the sides
* valueOf
* match - str.match(re) - re = regular expression
* normalize
* fromCodePoint



## repeat
```javascript
'oh '.repeat(2);
// "oh oh "
```



## Template literals
```javascript
let count = 10,
    price = 0.25,
    message = `${count} items cost $${(count * price).toFixed(2)}.`;

console.log(message);       // "10 items cost $2.50."
```

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


## get vowels
```js
function vowels(str) {
	let matches;

	if (str && (matches = str.match( /[aeiou]/g ))) {
		return matches;
	}
}

vowels("Hello!"); // ["e","o"]
```
# Other
```js
let s = "Hi there !";


let sliced = s.slice(1, -2);
console.log(sliced); // i there

let split = s.split(' ', 2);
console.log(split); // ["Hi", "there"]


let re = /[A-Z]/g;
let search = s.search(re); 
console.log(search); // 0


let sub = s.substr(0, 2);
console.log(sub); // Hi


let pad = "abc".padEnd(6, "123456"); // abc 123
console.log(pad);

let norm = '\u1E9B\u0323'.normalize('NFC') // NFC, NFD, NFKC, NFKD
console.log(norm); // ẛ̣


console.log(String.fromCodePoint(134071)); // 𠮷
```


----------------------------------------------------------------------------------
# Number
wrapper object allowing you to work with numerical values (number constructor)
```Number.prototype``` returns object with all the methods (inheritenance))
integer (10 and 10.0 - no decimal value)

* isFinite
* isNaN
* toExponential
* toFixed
* toString
* toPrecision
* valueOf
* isSafeInteger - number between -(2<sup>53</sup> - 1) and (2<sup>53</sup> - 1)

## Properties
* MAX_SAFE_INTEGER
* MAX_SAFE_INTEGER

```js
(2).toFixed(2);
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
* setProtoTypeOf
* getOwnPropertyDescriptors
* preventExtensions
* toString
* valueOf
* assign
* defineProperty
* seal
* freeze
* isSealed
* isFrozen


## isPrototypeOf
```javascript
function A(){}
function B(){}
function C(){}

B.prototype = Object.create(A.prototype)

const c = new C();
console.log(C.prototype.isPrototypeOf(c));
```




## assign
```javascript
const obj = { foo: 123 };
Object.assign(obj, { bar: true });
console.log(JSON.stringify(obj));
```

## Property descriptors - defineProperty
* enumerable - will be included if the object's properties are iterated through
```js
let obj = {
    a: 2
};


Object.defineProperty(obj, "a", {
    value: 4,
    writable: false, // not writable
    configurable: true, 
    enumerable: true
});


obj.a; // 4
obj.a = 6;
obj.a; // 4
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

```js

// SPLICE mutates the original array !!!!!! (uncomment other mutation when testing)
const a = ["A", "B", "C", "D"];

a.splice(1);    // B C D -> (same as (1, 3))
a.splice(1, 2);   // B C 
a.splice(0, -2); // [] EMPTY
a.splice(2, 0, "Filip"); // ["A", "B", "Filip", "C", "D"]
a.splice(1, 1, "Filip"); // ["B"]


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




