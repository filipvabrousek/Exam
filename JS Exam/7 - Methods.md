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
* accepts negative position from the end of the string, substring does not

**slice(start, end)**
* if start > stop args WILL NOT  be swapped,  

**substr (start, length)**
* if start > stop args WILL NOT  be swapped,  
* negative start -> goes from end


**substring(start, inclusive stop)** 
* if start > stop args WILL be swapped 
* x > 0, NaN -> 0, end omitted -> chars to end :)

```js
let s = "ABCDEF";
s.slice(1, 2); // B
s.substring(1, 2); // B
s.substr(1, 2); // BC
s.search(/[A-Z]/g); // 0

    
"abc".padEnd(6, "123456"); // abc 123
'\u1E9B\u0323'.normalize('NFC') // NFC, NFD, NFKC, NFKD     // ẛ̣
String.fromCodePoint(134071); // 𠮷

```


----------------------------------------------------------------------------------
# Number

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

```js
let obj = {
    name: "Terka"
};


Object.seal();
// prevents adding or deleting
// Object.freeze prevents changing properties


// can change sealed Object
Object.defineProperty(obj, "name", {
    value: "Filip",
    writable: false,
    configurable: true, // if may be changed and deleted
    enumerable: false // included when iterated through - required
});



obj.name = "xxx";
console.log(obj.name); // still Filip, because sealed



Object.getOwnPropertyDescriptor(obj, "name");
// {value: "Filip", writable......
Object.getOwnPropertyNames(obj);
// ["name"]



let copy = Object.assign({}, obj);

```


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
* shift - removes and returns the first element
* unshift - adds elements to the beginning and returns its new length
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


## find, findIndex, reduce, filter
```js
let arr = [8, 16];
console.log(arr.find(n => n > 10));         // 16
console.log(arr.findIndex(n => n > 10));    // 1

// Reduce
const arr = [65, 44, 12, 4];
let sum = (total, num) => total + num;
arr.reduce(sum) // 125

// Filter
var ages = [22, 21, 17];
const check = (age) => age >= 18;
ages.filter(check); // 22, 21
```


## Slice vs Splice
* **Slice(start, end)** - does not change original array, returns selected els. as a new object
- end > start, or end omitted, els to the end removed

* **Splice(start, delete, item1...)** - changes original array  
- arg 1: index (neg. values to count from the end)
- arg 2: how many to delete 0: 0 removed, missing: all items from the selected index removed  
- arg 3, 4..: what should be added 

```js
const a = ["A", "B", "C", "D"];

a.slice(1);     // BCD
a.slice(1, 3);  // BC
a.slice(0, -2); // AB

//------------------------------------------
a.splice(1, 2);     // returns [B, C] -> mutes to [A, D]
a.splice(1, 0, "Filip");    // ["A", "Filip", "B", "C", "D"] (1, "Filip") does nothing
a.splice(1, 1, "Filip");    // ["A", "Filip", "C", "D"]
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

---------------------------------------------------------------
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




