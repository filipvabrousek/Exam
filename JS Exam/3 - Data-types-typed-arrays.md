# DATA TYPES
* JS is high-level, dynamic, untyped, interpreted run-time language  
* variables don't have types - value have types  
* has 7 data types (6 primitives + Object)
* you can use two dots to call the method ``` 123..toString() ``` with just one, parser would think its decimal
* you can change types in another assignment
----------------------------------------------------------------------------------------
### Number 
### String
### Symbol
### Boolean 
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

# number
* NaN is not equal to itself (more approprietly "invalid number")
* ```-(2^53 - 1) to (2^53 - 1)``` both inclusive
* Number.MAX_SAFE_INTEGER
* Number.MIN_SAFE_INTEGER
* Number.EPSILON (distance between 1 and smallest floating point number grater than 1)
* Number.POSITIVE_INFINITY (and neg.)


```js
let m = 1e6; // 1000000


function notN(n){
    return n !== n;
};

notN(NaN); // TRUE

0.1 + 0.2 !== 0.3 // TRUE!
1 / 0 // -> Infinity (Number.positiveInfinity)
```



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


* ```JSON.stringify``` will omit ```undefined```, ```function``` and ```symbol``` values
* will be coerced to false: ```undefined```, ```null```, ```false```, ```+0```, ```-0```, ```NaN```
* **typeof** returns a string indicating the type of the unevaluated operand
* when comparing use === (won't allow coercion)




```js
let d = new Date( "Mon, 18 Aug 2014 08:53:06 CDT" );
+d; // 1408369986000
```

```js
parseInt("Infinity", 19) // 18 (I coerces to 18, n has no representation and parsing stops)

let x = true;
let y = "42";

x == y; // false - true is corced to 1 and "42" to 42 (1 == 42 is false)


0 == [] // true
0 == {} // false

// if either side of comparison is TRUE or FALSE dont ever use == (also [], "", 0)

let a = {b:42};
let b = {b: 43};

a < b; // false
a == b; // false
a <= b // TRUE (because a <= b will evaulate b < a first and then NEGATE the result)


[] + 6 // "6" both are coerced into string



```
