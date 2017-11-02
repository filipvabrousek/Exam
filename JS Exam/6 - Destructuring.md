# DESTRUCTURING
* JS expression that makes it possible to extract data from arrays or objects using a syntax that mirrors the construction of array and object literals.

# 1
```javascript
let a = 1;
let b = 3;

[a, b] = [b, a];
console.log(a); // 3
console.log(b); // 1
```

# 2
```javascript
let e, s, w, rest;
[e, s, w,  ...rest] = [10, 20, 30, 100];
// rest is 100
```

# 3
```javascript
let {x, y} = {x: 2, y: 1};
 // x:2, y:1
```

# 4
```javascript
let list = [2];
let [a = 1, b = 3, c] = list
console.log(a, b, c); 
// 2, 3, UNDEFINED
```
# 5
```js
let colors = ["red"];
let [a, b = "green"] = colors;
// a is "red"
// b is "green"
```




# 6
```javascript
const people = [
    "Filip",
    ["Terka", "Lucka"]
];

const [man, [g1, g2]] = people;
// g1 is Terka
```

# 7
```javascript

const p2 = {
     filip:"Filip",
    terka: "Terka",
    lucka: "Lucka"
}
   const {
       filip: a,
       terka: b,
       lucka: c
   } = p2;
   
 // b is Terka
```

# 8
```javascript
const p3 = {
    filip: "Filip",
    friends: {
        best:{
            karel: "Karel",
            terka: "Terka"
        }
    }
};

const { friends: {best}} = p3;
console.log(best); 
// {karel: "Karel", terka: "Terka"}
```
