# Data types  
* JS is high-level, dynamic, untyped, interpreted run-time language  
* variables don't have types - value have types  
* has 7 data types (6 primitives + Object)
----------------------------------------------------------------------------------------
### Number 
### String
### Boolean 
### Symbol
### Null  
### Undefined

### Object  
     1) regular objects  
     2) Function - code snippet that can be called by other code or by itself, or a variable that refers to the function  
     3) Date  
     4) Error  
     5) indexed collections (Arrays, typed Arrays)  
     6) keyed collections (Map, Set, WeakMap, WeakSet)  
     7) RegExp  




## Common natives (in constructors)
* String()
* Number()
* Boolean()
* Array()
* Object()
* Function ()
* RegExp()
* Date()
* Error()
* Symbol()
----------------------------------------------------------------------------------------


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

```javascript
TypedArray.of(...items)
```

```javascript
Int8Array.of(127, 126, 125).map(x => 2 * x)
Int8Array // [ -2, -4, -6 ]
```

# Formatting text in console 
```js
console.log("%cDo you %c♥%c web? → %cjoinUs();", "color: #ADADAD; font-weight: bold; font-size: 18px;", "color: #f63939; font-weight: bold; font-size: 22px;", "color: #ADADAD; font-weight: bold; font-size: 18px;", "color: #4ac366; font-weight: bold; font-size: 18px;")

```


# Coercion
* JSON.stringify will omit undefined, function and symbol values
* will be coerced to false: undefined, null, false, +0, -0, NaN
* **typeof** returns a string indicating the type of the unevaluated operand
* when comparing use === (won't allow coercion)

```js
let d = new Date( "Mon, 18 Aug 2014 08:53:06 CDT" );
+d; // 1408369986000
```
