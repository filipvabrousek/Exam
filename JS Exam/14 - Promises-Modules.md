# PROMISES

* = proxy for a value not necessarily known when the promise is created
* = placeholder for a result of async opertion
* async. method returns a promise to supply the value at some point in the future
* first appearance 2007 ->  MochiKit, jQuery
* window.onunhandledrejection
* window.onrejectionhandled


## States

* pending: initial value
* fullfilled: success
* rejected: fail
* when either of those options happen, the associated handlers queued up by promise's "then" method is called


## 1

```javascript 
function delay(time) {
	return new Promise((resolve, reject) => setTimeout(resolve, time));
}

delay(100) 
	.then(() => {
		console.log("step 2 (after 100ms)");
		return delay(200);
	})
	.then(() => {
		console.log("step 3 (after another 200ms)");
	})
	.then(() => {
		console.log("step 4 (next Job)");
		return delay(50);
	})
	.then(() => {
		console.log("step 5 (after another 50ms)");
	});

```
## Promise states

### Promise.reject
* returns a P object, that is rejected with a given reason

### Promise.resolve
* returns a P object, that is rejected with a given value

### Promise.all
* Returns a P that either fulfills when ALL of the P in the iterable argument have f. or r. as soon as one of the P in the iterable argument rejects

### Promise.race
* Returns a P that fulfills or rejects as soon as ONE of the P in the iterable f. or r., with the value/reason from that P

```javascript
let work = () => new Promise((resolve, reject) => {
	
	let isDone = true;
	if (isDone) {
		resolve("Did the job!");
	} else {
		reject("ERROR: Didn't do the job.");
	}
});


let earn = (m) => new Promise((resolve, reject) => {
	resolve(`${m} Got 3000$`);
});


work()
	.then(res => earn(res))
	.then(rej => console.log(`Finished. (${rej})`));

Promise.all([work(), earn()]).then(() => console.log("All are finished"));
```

## 4
```js
let P = new Promise((resolve, reject) => {
    console.log("Promise");
    resolve();
});

P.then(() => {
    console.log("Resolved.");
});

console.log("Hi!");

// -> Promise Hi! Resolved.
```


## 5

```js
let P = new Promise((resolve, reject) => {
    resolve(42);
});

P.then(v => v+1).then(v => console.log(v)); // "43"
```



## Extending promises
```js
class Favor extends Promise {

	// use default constructor
	success(resolve, reject) {
		return this.then(resolve, reject)
	}
	failure(reject) {
		return this.catch(reject);
	}
}

let P = new Favor((resolve, reject) => {
	resolve("Yes!")
});

P.success(val => console.log(val)).failure(val => console.log(val)); // "Yes"
```













------------------------------------------------------------------------------------------
## Error handling
```js
let x = 6;

try {
    if (x < 1 || x > 5) {
        throw "Not a mark error.";
    } else {
        console.log(`${x} is a mark`);
    }
}

catch (e) {
    console.log("Error: " + e);
} 

finally {
    console.log("Done!")
}
```



```js
let P = new Promise((resolve, reject) => {throw new Error("Explosion!")});
P.catch(err => console.log(err.message));
```


## Fetch


```js
const url = 'https://randomuser.me/api/?results=10';
fetch(url)
.then(res => res.json())
.then(data => data.results.map(author => console.log(author.name.first)))
.catch(err => console.log(err));
```


## Async
```js
async function async1(){
    return "ONE";
}

async function async2(){
    return "TWO";
}


async function async3(){
    const one = await async1();
    console.log(one);
    const two = await async2();
    console.log(two);
}



async function async4(){
    const [res1, res2] = await Promise.all(
    [async1(), async2()]
    )
    console.log(res1, res2);
}


async4();

// -> ONE TWO
```



-------------------------------------------------------------------------------------------
# MODULES
* imported values are read-only
* value of this in the top level of a module is undefined
* variables created in the top level of a module aren't automatically added to the shared global scope
* they exist only within the top-level scope of the module
* run automatically in strict mode
* <script src="defer"> not parsed 

```javascript
//export * from './module';



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
