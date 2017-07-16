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

----------------------------------------------------------------------------------
# Object
Object constructor creates an object wrapper

* hasOwnProperty
* isPrototypeOf
* getPrototypeOf
* setProtoTypeOf
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

## defineProperty
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
```js
let obj = {
    name: "Filip"
};

// prevents addign or deleting
Object.seal(obj);
obj.a = "Text";
console.log(obj.a); // Undefined
obj.name = "Terka";
console.log(obj.name); // Terka

// same as seal, but prevents changing existing properties
Object.freeze(obj);
obj.name = "Terka";
console.log(obj.name);


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
const n = [65, 44, 12, 4];
let sum = (total, num) => total + num;
n.reduce(sum);
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




