## Combinations
```js
function mix(arr){
    let res = [];
    
    const permute = (arr, m = []) => {
   
        if (arr.length === 0){
            res.push(m);
        }
           
            for (let i = 0; i < arr.length; i++){
                let curr = arr.slice();
                let next = curr.splice(i, 1);
                permute(curr.slice(), m.concat(next));
            }
    }
    
    permute(arr);
    return res;
}

let arr = [1, 2, 3];
let r = mix(arr);

console.log(`There are ${r.length} combinations`);
console.log(r);

```
