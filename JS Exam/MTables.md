# String

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
startsWith | repeat| concat| substring
endsWith | indexOf| search | toString 
substring | trim  | valueOf  | match
normalize| from code p.

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

## Slice, Substr, Subsstring
**slice(start, end)**

**substr (start, length)** negative start -> goes from end

**substring(start, inclusive stop)** only method to swap arguments (start > stop) x > 0, NaN -> 0, end omitted -> chars to end :)

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


# Number

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
toExponential | toString| isFinite| isNan
toPrecision | valueOf| toFixed | isSafeInteger 
toLocaleString 

```js
(2).toFixed(2);
12000..toLocaleString("de-DE", {style: "currency", currency: "EUR"}); //  // 12.000,00 € (Germany)

if (!Number.isNaN){
    Number.isNaN = function(n) {
        return n !== n
    }
}

// binary and octals litelars
0b111110111 === 503 // true
0o767 === 503 // true

```

# Object

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
hasOwnProperty| getPrototypeOf| setPrototypeOf| getOwnPropertyDescriptor
getOwnPropertyDescriptors | getOwnPropertyNames| getOwnPropertySymbols |  preventExtensions 
| valueOf| assign |  defineProperty  | seal 
| freeze | isSealed | isFrozen





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

```js
function A(){}
function B(){}
function C(){}

B.prototype = Object.create(A.prototype)

const c = new C(); 
console.log(C.prototype.isPrototypeOf(c)); // TRUE
console.log(c.__proto__ == C.prototype); // TRUE
```

## Array

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
join | push |pop |of
shift | unshift| fill| filter
find| from |forEach| reverse
include |reduce |entries| bind
call |apply |some| every 
all |sort| slice |splice
keys |values| lastIndexOf | xxx


## find, findIndex, reduce, filter
```js
let arr = [8, 16];
arr.find(n => n > 10);         // 16
arr.findIndex(n => n > 10);    // 1

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

```js
Array.prototype.addToStart = function(a){
    return this.unshift(a);
}

let r = [1, 2, 3];
r.addToStart("K"); // [K, 1, 2, 3]
```
    
```js    
let indicies = [];
let arr = ["A", "B", "A", "D"];
let el = "A";
let idx = arr.lastIndexOf(el);
    
    
while(idx != -1){
    indicies.push(idx);
    idx = (idx > 0 ? arr.lastIndexOf(el, idx - 1) : -1);
}
    
indicies // [2, 0]
```


## Date

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
toString | toUTCString |toDateString |xxx

```js
let d = new Date(99,6,20,20,28,00,0);
// Tue Jul 20 1999 20:28:00 GMT+0200 (CEST)
```
