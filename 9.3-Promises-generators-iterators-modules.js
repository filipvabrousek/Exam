/*------------------------PROMISES--------------1----------*/
function timeout(duration) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, duration);
    });
}

const m = timeout(5000).then(() => {
    console.log("done!");
});

    
/*------------------------PROMISES---------------2---------*/ 
let P = new Promise((resolve, reject) => {
    
    //cleaning the room
    let isClean = true;
    
    if (isClean){
        resolve("CLEAN!");
    } else {
        reject("NOT CLEAN!");
    }
});
    
P.then(fromResolve => {
    console.log(`The room is ${fromResolve}`);
}).catch(fromReject => {
    console.log(`The room is ${fromReject}`);
});
    
//-> The room is CLEAN!
    
      
/*------------------------PROMISES-----------------3-------*/ 
let clean = (message) => new Promise((resolve, reject) => {
  resolve("Cleaned the room.");  
});
    
 
let win = (message) => new Promise((resolve, reject) => {
  resolve(`${message} Won an IceCream.`);  
});
    
 clean()
     .then(res => win(res))
     .then(res => {
        console.log(`Finished. (${res})`);
    });
  
//-> Finished. (Cleaned the room. Won an IceCream.)





/*--------------------ITERATORS-------------------*/
var arr = [4, 5, 6, 7, 8, 9];

arr[Symbol.iterator] = function*() {
    var idx = 1;
    do {
        yield this[idx];
    } while ((idx += 2) < this.length);
};

for (var v of arr) {
    console.log(v);
}
// 5 7 9 (just values from odd indexes)

    
/*--------------------GENERATORS-------------------*/
const myGen = function*(){
const one = yield 1;
const two = yield 2;
const three = yield 3;
console.log(one, two, three);
};

const gen = myGen();
console.log(gen.next());
console.log(gen.next());
console.log(gen.next());
console.log(gen.next());


//next....
function* foo() {
    try {
        yield 1;
        yield 2;
        yield 3;
    } finally {
        console.log("cleanup!");
    }
}

for (var v of foo()) {
    console.log(v);
}
// 1 2 3
// cleanup!

foo().next(); // { value: 1, done: false }
foo().return(42); // cleanup!
// { value: 42, done: true }


    
    

/*--------------------MODULES-------------------*/

//utility.js
function generateRandom() {
    return Math.random();
}

function sum(a, b) {
    return a + b;
}

export { generateRandom, sum }

//app.js
import { generateRandom, sum } from 'utility';

console.log(generateRandom()); //logs a random number
console.log(sum(1, 2)); //3


// var utils = {}   export default utils;



