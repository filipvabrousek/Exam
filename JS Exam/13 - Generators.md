# Generators

* they break the typical “run to completion” model of normal functions (can start, pause, and reset)
* generator is a function that returns an iterator
* ```function* generator { … }```
* ```yield``` keyword signals when to ‘pause’ the function and return its current state
* yield / next duality is 2 way message passing mechanism  
* ```yield ...``` expression pauses waiting for a value, and the ```next()``` call passes a value (or undefined) back to that paused yield expression   
* to make ```for - of``` easier to use, many values have default iterators (stops, when there is no value)

## Built-in Iterators
* **entries** returns an iterator whose values are a key-value pair
* **keys** returns an iterator whose values are the keys contained in the collection
* **values** returns an iterator whose values are the values of the collection



## 1

```js
function isIterable(object) {
    return typeof object[Symbol.iterator] === "function";
}

console.log(isIterable([1, 2, 3]));     // true
```

## 2
* Show Fibonacci numbers smaller than 100 (1, 2, 3, 5, 8, 13, 21, 34, 55, 89)
```js

let fib = {
   
    *[Symbol.iterator](){
    let pre = 0,
    cur = 1;
    
    for (;;){
    [pre, cur] = [cur, pre + cur];
    yield cur;
}
}
}

for (let n of fib){
    if (n > 200){
        break;
    }
    console.log(n);
}
```

## 3
```javascript

let greeting = "hello world";
let ita = greeting[Symbol.iterator]();

ita.next(); // { value: "h", done: false }
ita.next(); // { value: "e", done: false }
```

## Iterating
* entries, keys, values
```javascript
let m = new Map();
m.set("Filip", 17);
m.set("cool", true);

for (let e of m.entries()){
    console.log(`Entries: ${e}`)
}
```

## 5
```javascript

let a = [1, 2, 3, 4, 5];
let itd = a[Symbol.iterator]();

let [x, y] = itd; // take just the first two elements from `it`
let [z, ...w] = itd; // take the third, then the rest all at once

itd.next(); // { value: undefined, done: true }

x; // 1
y; // 2
z; // 3
w; // [4,5]
```


## Passing arguments to an Iterator
```js
function *C(){
    let first = yield 1;
    let second = yield first + 2;
    yield second;
}

let it = C();
console.log(it.next());
console.log(it.next(4)); // Object {value: 6, done: false}

```







## 8
```js
function* range(start, end, step) {

    while (start < end) {
        yield start;
        start += step;
    }
}

for (let i of range(0, 10, 2)) {
    console.log(i);
}
```



## 9
```js


function *ret(){
    yield 1;
    yield 2;
    return 3; // ignored by for-of
}

for (const x of ret()){
    console.log(x);
}

// 1, 2
```


## 10
```js
 // x FOR EACH cannot yield inside a function that is not a GeneratorFunction
function* make(items) {
  for (var i in items) {
          yield i;
     }
}

let it = make([1, 2, 3]);
it.next();
```


## 11
```js
function *N(){
    yield 1;
    yield 2;
}

function *C(){
    yield "red";
    yield "green";
}


function *combined(){
    yield *N();
    yield *C();
    yield true;
}

let it = combined();

console.log(it.next());           // "{ value: 1, done: false }"
console.log(it.next());           // "{ value: 2, done: false }"
console.log(it.next());           // "{ value: "red", done: false }"
console.log(it.next());           // "{ value: "green", done: false }"
console.log(it.next());           // "{ value: true, done: false }"
console.log(it.next());           // "{ value: undefined, done: true }"
```







