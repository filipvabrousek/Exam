# Data types
* JS is high-level, dynamic, untyped, interpreted run-time language
* variables don't have types - value have types

## Primitive:
* Number
* String
* Boolean
* Symbol
* Null
* Undefined


## Object:
* Objects
* Functions - code snippet that can be called by other code or by itself, or a variable that refers to the function
* Dates
* Indexed collections (Arrays, typed Arrays)
* Keyed collections (Map, Set, WeakMap, WeakSet)
* Reg - exp

# Comparing 
* **typeof** returns a string indicating the type of the unevaluated operand
* when comparing use ===



# Typed arrays
* differences from arrays:
* same type of items 
* contiguous (no holes)
* iterable

```javascript
let ui8 = Uint8Array.of(0,1,2);
for (let byte of ui8) {
    console.log(byte);
}
// Output:
// 0
// 1
// 2
```






```javascript
let typedArray = new Uint8Array([0,1,2]);
console.log(typedArray.length); // 3
typedArray[0] = 5;
let normalArray = [...typedArray]; // [5,1,2]
```


## Static typed array methods
```javascript
TypedArray.of(...items)
```

```javascript
Int8Array.of(127, 126, 125).map(x => 2 * x)
Int8Array [ -2, -4, -6 ]
```

# Formatting text in console 
```js
console.log("%cDo you %c♥%c web? → %cjoinUs();", "color: #ADADAD; font-weight: bold; font-size: 18px;", "color: #f63939; font-weight: bold; font-size: 22px;", "color: #ADADAD; font-weight: bold; font-size: 18px;", "color: #4ac366; font-weight: bold; font-size: 18px;")

```

# Undefined
```js
var a;

a; // undefined
b; // ReferenceError: b is not defined

typeof a; // UNDEFINED
typeof b; // UNDEFINED
```
