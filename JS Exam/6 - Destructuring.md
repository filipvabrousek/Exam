# Destructuring
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
let a, b, res;
[a, b, ...rest] = [10, 20, 30, 40, 50];
console.log(a); // 10
console.log(b); // 20
console.log(rest); // [30, 40, 50]
```

# 3
```javascript
let {foo, bar} = {foo: 'lorem', bar: 'ipsum', choo: 'uhoh'};
console.log("foo:", foo, "bar:", bar);
```

# 4
```javascript
let list = [ 7, 42 ];
let [a = 1, b = 2, c = 3, d] = list;
console.log( a,  b,  c,  d);
// 7, 42, 3, undefined
```

# 5
```javascript
let set = new Set([1, 2, 3]);
set = new Set([...set].map(x => x * 2));
//{2, 4, 6}
```



