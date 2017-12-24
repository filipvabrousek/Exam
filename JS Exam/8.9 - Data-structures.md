# DATA STRUCTURES
* Set - a list of values that cannot contain duplicates
* Map - collection of keys that correspond to specific values

**Methods:**
* has
* delete - remove a single value (in arg.)
* clear - remove all values


## Map
* ordered key-value pairs where the key can be any data type
```js
let m = new Map();
m.set("Filip", 18);
m.set("Terka", 17);
m.forEach((item, key, target) => console.log(target)); 
// Map(2) {"Filip" => 18, ...} // item is 18, key is "Filip" 
```

## Set
* if the add() method is called again with same value, all calls ignored
* values ARE NOT coerced to determine equivalence, no keys


## Problem
```js
let map = Object.create(null);
map[2] = "hi";
console.log(map["2"]); // "hi (2 is coerced to string)

// Solution
let set = new Set([1, 2, 3, 3]);
console.log(set.size);    // 3
```


## 1
```js
let family = new Set();
family.add("Mother");
family.add("Father");

family.has("Mother");
family.size;
family.delete("Mother");

```

## 2
```js
let set = new Set([1, 2, 3, 3, 3, 4, 5]),
    array = [...set];

console.log(array);             // [1,2,3,4,5]
```

## 3
```javascript
function e(items) {
    return [...new Set(items)];
}

let numbers = [1, 2, 3, 3, 3, 4, 5],
    noDuplicates = e(numbers);

console.log(noDuplicates);      // [1,2,3,4,5]
```

## 4
```js
let s = new Set();
s.add("O", 1);

for (let item of s.keys()){ // entries, values
    console.log(item);
}
s.get("O"); 
```



## WeakSet, WeakMap
* collections of **objects only** (primitive data types as keys ARE NOT allowed)
* “WeakSet” doesn’t provide any methods or functions to work with the whole set of keys (just .clear)
*  not iterables, no ```.size .entries .forEach```

## Regular set vs wekaset
```js
let x = 12;
let y = {};
    
let set = new Set();
let wm = new WeakSet();
    
set.add(x, "m");
wm.add(y, "wm");
    
x = null;
y = null;
    
// wm is empty, set is not
```

