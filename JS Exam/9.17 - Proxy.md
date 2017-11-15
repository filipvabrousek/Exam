# PROXY
* used to define custom behavior for fundamental operations (e.g. property lookup, assignment, enumeration, function invocation, etc)

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



## 1
```js

const obj = {
    get(target, name){
        return name in target ? target[name] : "doesnt exist";
    }
};

const P = new Proxy({}, obj);
P.a = 1;
console.log(P.a);
console.log("c" in P, P.c);

```

## 2

```js
let T = {};

let PX = new Proxy(T, {});

PX.name = "proxy";
console.log(PX.name);        // "proxy"
console.log(T.name);       // "proxy"

T.name = "target";
console.log(PX.name);        // "target"
console.log(T.name);       // "target"


```
## 3
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
console.log(PX.apply(null, [3, 4]));



```
## Validating properties using set trap
**set Trap** receives 4 args:
* **TR** trap target - object, that will recive property
* **K** key - the property key (String / Symbol) to write to
* **V** value - value being written to property
* **R** receiver - the object on which the operation took place
you can assign to name because it EXIST ON TARGET already

```js
let T = {
    name: "Filip"
}


let PX = new Proxy(T, {
   set(TR, K, V, R){
       
       if(!TR.hasOwnProperty(K)){
           if (isNaN(V)){
               throw Error("Not a number");
           } 
       }
       
       Reflect.set(TR, K, V, R);
   } 
});



PX.count = 1;
console.log(PX.count);
// PX.n = "Text"; // -> Error

```


## Hiding property existence
* with ```js handler.has()``` you can hide any property you want
* works with "deleteProperty"

```
let R2 = delete proxy.name;
console.log(R2);               
console.log("name" in proxy);
```

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


## Proxy.revokable()
```js
let T = {
    name: "target"
};

let { proxy, revoke } = Proxy.revocable(T, {});

console.log(proxy.name);        // "target"
revoke();

// console.log(proxy.name); -> ERROR


```

## Prototype proxy traps


```js
let T = {};

let PX = new Proxy(T, {

    getPrototypeOf(trapT) {
        return null;
    },
    
    setPrototypeOf(trapT, proto) {
        return false;
    }
});


let TP = Object.getPrototypeOf(T); //Object object
let proxyProto = Object.getPrototypeOf(PX); // (null, because of trap)
console.log(TP === Object.prototype);      // true

Object.setPrototypeOf(T, {});
//  Object.setPrototypeOf(PX, {}); -> ERROR
```

# Defining properties
```js
let T = {};


let PX = new Proxy(T, {
    defineProperty(TR, K, D) {
        return Reflect.defineProperty(TR, K, D);
    },
    getOwnPropertyDescriptor(TR, K) {
        return Reflect.getOwnPropertyDescriptor(TR, K);
    }
});


Object.defineProperty(PX, "name", {
    value: "Filip"
});



let desc = Object.getOwnPropertyDescriptor(PX, "name");
console.log(desc.value); // Filip

```

## Object.create
```js


let T = {};
let thing = Object.create(new Proxy(T, {
    get(TR, K, R){
        throw new ReferenceError(`${key} doesn't exist`);
    }
}));


thing.name = "thing";

console.log(thing.name);        // "thing"
// let unknown = thing.unknown


```
