# String

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

**substr (start, length)** negative start -> goes from end

**substring(start, inclusive stop)** only method to swap arguments (start > stop) x > 0, NaN -> 0, end omitted -> chars to end :)

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


# Number

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
toExponential | toString| isFinite| isNan
toPrecision | valueOf| toFixed | isSafeInteger 
toLocaleString 

```js
(2).toFixed(2);
12000..toLocaleString("de-DE", {style: "currency", currency: "EUR"}); //  // 12.000,00 € (Germany)

if (!Number.isNaN){
    Number.isNaN = function(n) {
        return n !== n
    }
}

// binary and octals litelars
0b111110111 === 503 // true
0o767 === 503 // true

```

# Object

Name | Name | Name| Name
------------ | ------------- | -------------| -------------
hasOwnProperty| getPrototypeOf| setPrototypeOf| getOwnPropertyDescriptor - 2 arg.
getOwnPropertyDescriptors - 1 | getOwnPropertyNames - 1| getOwnPropertySymbols - 1
 preventExtensions | valueOf| assign |  defineProperty
 | seal | freeze | isSealed | isFrozen












seal
freeze
isSealed
isFrozen


```js
let obj = {
    name: "Terka"
};


Object.seal();
// prevents adding or deleting
// Object.freeze prevents changing properties


// can change sealed Object
Object.defineProperty(obj, "name", {
    value: "Filip",
    writable: false,
    configurable: true, // if may be changed and deleted
    enumerable: false // included when iterated through - required
});



obj.name = "xxx";
console.log(obj.name); // still Filip, because sealed



Object.getOwnPropertyDescriptor(obj, "name");
// {value: "Filip", writable......
Object.getOwnPropertyNames(obj);
// ["name"]



let copy = Object.assign({}, obj);
```


