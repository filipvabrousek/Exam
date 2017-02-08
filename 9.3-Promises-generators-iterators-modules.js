/*--------------------PROMISES-------------------*/
function timeout(duration) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, duration);
    });
}

const m = timeout(5000).then(() => {
    console.log("done!");
});

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



