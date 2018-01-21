# Methods

## String

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
startsWith | repeat| concat| substring
endsWith | indexOf| search | toString 
substring | trim  | valueOf  | match
normalize| from code p.

## Raw 
* only method of template literals
```js
String.raw({ raw: 'test' }, 0, 1, 2);
```

```js
function F(strings, ...values){
    console.log(strings);
    console.log(values);
}

let desc = `Filip`
F`I am ${desc}`;
```

## Slice, Substr, Subsstring
**slice(start, end)**

**substr (start, length)**
* negative start -> goes from end

**substring(start, inclusive stop)** 
* only method to swap arguments (start > stop) 
* x > 0, NaN -> 0, end omitted -> chars to end :)

```js
let s = "ABCDEF";
s.slice(1, 2); // B
s.substring(1, 2); // B
s.substr(1, 2); // BC
s.search(/[A-Z]/g); // 0

    
"abc".padEnd(6, "123456"); // abc 123
'\u1E9B\u0323'.normalize('NFC') // NFC, NFD, NFKC, NFKD     // ẛ̣
String.fromCodePoint(134071); // 𠮷

```
