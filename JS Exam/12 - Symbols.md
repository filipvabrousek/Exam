# SYMBOLS

* values that programs can create and use as property keys without risking name collisions
*  ```Symbol.for(string)``` - this accesses a set of existing symbols called the symbol registry 
* symbols in the symbol registry are shared
* not always unique, if you call ```Symbol.for("cat")``` thirty times, it will return the same symbol each time
* ONLY way to iterate is ```Object.getOwnPropertySymbols()```


# 1
```js
let sym = Symbol("text");
let sym2 = Symbol("text");
console.log(sym === sym2); //false
sym.toString() //works ("Text " + sym => error)
    
    
// retrieves a shared symbol key from the global symbol registry for the given symbol
let g = Symbol.for("filip");
Symbol.keyFor(g); // Filip
```

# 2
```js
Array.prototype.mapo = function(cb) {
    const val = this.constructor[Symbol.species](this.length);
    this.forEach((item, index, array) => 
       val[index] = cb(item, index, array));
    
    return val;
}

[2, 3].mapo(x => x * 2);
```

# 3

```js
class S {
    constructor(value) {
        this.value = value;
    }
    [Symbol.search](string) {
        return string.indexOf(this.value);
    }
}

let a = 'foobar'.search(new S('bar'));
console.log(a); //  3
```


# 4

```js

class TM {
	constructor(deg) {
		this.deg = deg;
	}

	[Symbol.toPrimitive](hint) {
		switch (hint) {
			case "string":
				return this.deg + "\u00b0";
		}
	}
}

let freezing = new TM(32);
console.log(String(freezing));
```


# 5
```js
class coolArray extends Array{
    static get[Symbol.species](){ return Array; }
}

let x = new coolArray(1, 2, 3);
let mapped = x.map(x => x*x);
console.log(mapped);

console.log(mapped instanceof coolArray); // false
console.log(mapped instanceof Array);   // true
```


# 6
* instanceof - 
test whether prototype property of a constructor apppears anywhere in the prototype property of the object

```js
class A{
    static [Symbol.hasInstance](instance){
        return Array.isArray(instance);
    }
}

console.log([] instanceof Array); 
```


# 7
```js
class V{
    get [Symbol.toStringTag](){
        return "Validator";
    }
}
    
let res = Object.prototype.toString.call(new V());
console.log(res);
```


# 8
```js
const a = [1, 2, 3]; 
const b = [2, 4, 8];
    
b[Symbol.isConcatSpreadable] = false;
let res = a.concat(b);  // (4) [1, 2, 3, Array(3)]

```



# 9

```js
// used to specify an object value of whose own and inherited property names are excluded from the with
const obj = {
    prop: 20
};
    
obj[Symbol.unscopables] = {
    prop: true
}
    
with (obj1){
    console.log(prop);
}

// match, split, unscopables

```
