# Symbols

* values that programs can create and use as property keys without risking name collisions
*  Symbol.for(string). This accesses a set of existing symbols called the symbol registry 
* symbols in the symbol registry are shared
* not always unique if you call Symbol.for("cat") thirty times, it will return the same symbol each time

# 1
```javascript
let sym = Symbol("text");
let sym2 = Symbol("text");
console.log(sym === sym2); //false
sym.toString() //works ("Text " + sym => error)
```

# 2
```javascript
class MySearch {
    constructor(value) {
        this.value = value;
    }
    [Symbol.search](string) {
        return string.indexOf(this.value);
    }
}
var fooSearch = 'foobar'.search(new MySearch('foo'));
var barSearch = 'foobar'.search(new MySearch('bar'));
var bazSearch = 'foobar'.search(new MySearch('baz'));
assert.equal(fooSearch, 0);
assert.equal(barSearch, 3);
assert.equal(bazSearch, -1);
```


# 3
```javascript
Array.prototype.map = function (callback) {
    var Species = this.constructor[Symbol.species];
    var returnValue = new Species(this.length);
    this.forEach(function (item, index, array) {
        returnValue[index] = callback(item, index, array);
    });
    return returnValue;
}
```
