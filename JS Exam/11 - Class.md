# CLASS
* syntactical sugar over existing prototype-based inheritance
* **first-class citizen** - sth that can be can be used as a value, can be passed into a function, returned assigned to a variable
* "special functions"
* function declarations ARE hoisted and class declarations ARE NOT
* **static** assigned to the function NOT ITS PROTOTYPE!!! (not inherited)
* not methods of instance, but of the whole classes


* you do not have to use the constructor (its the same as empty one ```constructor(){}```)
* all code inside a class runs in a **strict mode**


# Reports
```js
class E {
    constructor(name){
        this.name = name;
    }
}
    
class Park extends E {
    constructor(name, area = 2){
        super(name)
        this.area = area;
    }
    
    classify(){
        let c = new Map();
        c.set(1, "tiny");
        c.set(2, "medium");
        c.set(3, "huge");
        console.log(`${this.name} park is ${c.get(this.area)} park.`)
    }
}
    
let parks = [
    new Park("Central park", 1),
    new Park("Moon park", 2)
];
    
function calc(arr){
    const sum = arr.reduce((prev, cur, index) => prev + cur, 0);
    return [sum, sum / arr.length];
}
    
function report(p){
    let [total, avg] = calc(p.map(el => el.area));
    p.forEach(el => el.classify());
    let i = p.map(el => el.area).findIndex(el => el >= 2);
    console.log(`${p[i].name} is the largest. Average is ${avg}`); 
}
    
report(parks);

console.log(Park === Park.prototype.constructor); // TRUE
console.log(Object.getOwnPropertyNames(Park.prototype)); // ["constructor", "classify"]
 ```


# Getters and setters

```js
class P{
    constructor(name){
        this.name = name;
    }
    
    get name(){
        return this._name;
    }
    
    set name(value){
        this._name = value;
        console.log("Name was changed!")
    }
}

let me = new P("Filip");
me = new P("Terka");
console.log(me.name); // Terka
```
* internally...
```
Object.defineProperties(P.prototype, {
    name:{
        get().......
    }
    ...
})
```

# You can extend data types
* make more simple!!!
```js
class M extends String {
    constructor(length) { super(length) }
    last() {
        return this[this.length - 1];
    }
}

let me = new M("Filip");
me.last(); // "p"
```
   
 # New.target
  ```js
class P {
 constructor() {
    new.target === C ? console.log("Child instantiated") : 0;   
 }
}

class C extends P {}
let me = new C();
// Child instantiated
```



# Class creation
```javascript
function create(text){
    return class {
        say(){
             console.log(text);
        }
       
    }
}

let x = create("Hi");
new x().say(); // Hi
```



# Computed names
```javascript
let mName = "say";

class P {

    constructor(name) {
        this.name = name;
    }

    [mName]() {
        console.log(this.name);
    }
}

let me = new P("Filip");
me.say();    
```

# New.target
```js


class R {
    constructor(length, width) {
        console.log(new.target === R);
        this.length = length;
        this.width = width;
    }
}

class S extends R {
    constructor(length) {
        super(length, length)
    }
}

// new.target is Square
var obj = new S(3);      // outputs false
```


# Clonning

```js
class S {
    static get [Symbol.species]() { return this; /*or S if we want to hide*/}

    constructor(value) {this.value = value;}
    clone() { 
        return new this.constructor[Symbol.species](this.value);
    }
}

class SE extends S { }

let a = new SE("foo"),
clone1 = a.clone();
   
console.log(clone1 instanceof S);    // true
```



# ES5 Inheritance

```
function Person(name, born){
    this.name = name;
    this.born = born;
}

Person.prototype.age = function(){
    console.log(2017 - this.born);
}

var me = new Person("Filip", 1999);
me.age();

var terka = Object.create(me);
terka.name = "Terka";
terka.born = 2000;
terka.age();
```
