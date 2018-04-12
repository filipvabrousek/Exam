## Big O Notation



```js// O(1) - constant time complexity
let arr = [2,3];
arr[0];
    
    
// O(n) - linear time complexity (for "n" elements, we will require "n" iterations)
for (let i = 0; i < arr.length; i++){
    console.log(arr[i]);
}
    
// O(log n) - logaritmic time complexity
let arr = [8, 2, 6, 7];

function quick(arr){
    if (arr.length < 2) {return arr}
    
    let pivot = arr[0], left = [], right = [];
    
    for (let i = 1; i < arr.length; i++){
       
       switch(true){
            case (arr[i] < pivot) :
                left.push(arr[i]);
                break;
                
            case (arr[i] >= pivot):
               if (arr[i]){
                   right.push(arr[i]);  
                   break;
               }  
        }
   }
    return [].concat(quick(left), pivot, quick(right));
} 
   
let qs = quick(arr);
console.log(qs);
    

    
    
    
// O(n^2) - quadratic time complexity (bubble sort)
 
let arr = [8, 2, 6, 7];

function bubble(arr){
    
for (let j = 0; j < arr.length - 1; j++){ //has O(n) time complexity
    
    for (let i = 0; i < (arr.length - j - 1); i++){ //has O(n^2) time complexity (more.. O(n^4))
        
    if (arr[i] > arr[i + 1]){
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
    }
    }
    
}
    
return arr;
}
    
let res = bubble(arr);
console.log(res);  
    
    
// O(2^n)
function fib(n){
    return fib(n - 1) + fib(n -2)
}
```


![graph](https://cdn-images-1.medium.com/max/1600/1*_8PfaIyJC7dWJOsKxz47ow.png "Logo Title Text 1")


## isPalidrome
```js
function isPalindrome(str){
    str = str.toLowerCase();
    return str == str.split('').reverse().join('');
}

isPalindrome("lol");
// true
```


## reverse string
```js
function reverse(str){
    return str.split(' ').reverse().join(' ').split('').reverse().join('');
}
    
reverse("I love you !");
// I evol uoy !
```





# Asked by Google and Amazon
```js
const arr = [10, 12, 15, 21];
for (var i = 0; i < arr.length; i++){
    setTimeout(function(){
        console.log(`Index: ${i}, element, ${arr[i]}`);
    }, 3000);
}
    
// Index: 4, element: undefined (printed four times)

 
// Solution
for(var i = 0; i < arr.length; i++){
    setTimeout(function(iLocal){
        return function(){
            console.log(`Index is ${iLocal}`);
        }
    }(i), 3000);
}
    
    
// https://medium.com/coderbyte/a-tricky-javascript-interview-question-asked-by-google-and-amazon-48d212890703
```









## Other
```js

    
// Event loop
function print(){
    console.log(1);
    setTimeout(() => console.log(2), 1000);
    setTimeout(() => console.log(3), 0);
    console.log(4);
}
print();
    
// 1, 4, 3, 2
    
  
    
    
    
// Types
console.log(typeof undefined); // undefined
console.log(typeof null); // Object (arr and )
  
    
    
    
    
// Scope
(() => {
    var a = b = 7;
})();
    
console.log(b); // "b" is in the global scope
    
    
    
// == vs ===
false == "0"; // true
false === "0"; // false
NaN === NaN // false
123 === "123" // false
123 == "123" // true
    
    
    
   
// hoisting
var x = 10;
var f = function(){
    console.log(x);
    var x = 20;
};
    
f(); // undefined
    
    
   
   
// coercion
console.log(3 > 2 > 1); 	// false it becomes (true > 1) becomes 1 > 1 -> false
console.log(typeof typeof 1);   // typeof 1 -> "number", typeof "number" -> string
    
    
    
    
    
function hi(){
    return 
    3;
}
    
hi(); // ASI - automated semicolon insertion
    
    
 
    
    
// sum
function sum(x){
    if (arguments.length == 2){
        return arguments[0] + arguments[1];
    } else {
        return function(y) {return x + y};
    }
}
    
sum(2, 3); // 5
sum(2)(3); 
    
    
    
// logical values
console.log(1 || 2) // 1
console.log(0 && 1); // 0
```







