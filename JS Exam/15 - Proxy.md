# PROXY
* used to define custom behavior for fundamental operations (e.g. property lookup, assignment, enumeration, function invocation, etc)


## 1
```js
const obj = {
    get(target, name){
        return name in target ? target[name] : "doesn't exist";
    }
};

const P = new Proxy({}, obj);
P.a = 1;
console.log(P.a);
console.log("c" in P, P.c);
```



## 2 - Validating properties using set trap
**set Trap** receives 4 args:
* **TR** trap target - object, that will recive property
* **K** key - the property key (String / Symbol) to write to
* **V** value - value being written to property
* **R** receiver - the object on which the operation took place
you can assign to name because it EXIST ON TARGET already
```js
let T = {}
let PX = new Proxy(T, {
   
    set(TR, K, V, R){
    if (isNaN(V)) { throw "Error"; }
    Reflect.set(TR, K, V, R);
   } 
});

PX.count = 1;
console.log(PX.count);
```


## 3 - Define property trap
```js
let proxy = new Proxy({}, {
    defineProperty(t, k, d){
        
        if (typeof k === "symbol"){
            return false;
        }
        
        return Reflect.defineProperty(t, k, d);
    }
});


let s = Symbol("Hi");

Object.defineProperty(proxy, s, {
    value: "proxy"
});
```

## 4 - Hiding property existence
```js
let T = {
    name: "target",
    value: 42
}

let PX = new Proxy(T, {
    has(T, K){
        return K === "value" ? false : Reflect.has(T, K)
    }
});


console.log("value" in PX);      // false
console.log("name" in PX);       // true
console.log("toString" in PX);   // true
```



## 5 - Proxy.revocable
```js
let T = {
    name: "target"
};

let { proxy, revoke } = Proxy.revocable(T, {});

console.log(proxy.name);        // "target"
revoke();

// console.log(proxy.name); -> ERROR
```


## 6 - Apply = function call trap
```js
let twice = {
    apply(target, ctx, args){
        return Reflect.apply(... arguments) * 2;
    }
}

const sum = (a, b) => a + b;

let PX = new Proxy(sum, twice);

console.log(PX(1,2));
console.log(PX(...[3,4]));
```



## Trap handlers
* has - traps ```in```
* get
* set
* deleteProperty - traps ``` delete```
* defineProperty - traps ``` Object.defineProperty()```
* enumerate - traps ``` for...in```
* ownKeys - traps ``` Object.keys()``` ```Object.getOwnPropertyNames / Symbols```
* apply - traps function calls
* construct - traps function calls with ```new```
* getOwnPropertyDescriptor
* getPrototypeOf
* setPrototypeOf
* preventExtensions
* isExtensible
