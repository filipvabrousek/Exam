
var names = ["Filip", "Terezka", "Karel"];
  
names.pop();
names.push("Honza");
names.shift();
names.slice(1,2);
names.splice(1,2);


    
/*------------------------FILTER---------------*/
function graterThan10(val){
return val >= 10;
}
    
const filtered = [3,20].filter(graterThan10);
console.log(filtered);
    
    
/*------------------------SOME, EVERY, FIND, SORT---------------*/
function big(element, index, array) {
  return element > 10;
}

const some = [3, 20, 8].some(big); // true
console.log(some);
    
const every = [3, 20, 8].every(big); //false
console.log(every);
    
const find = [3, 20, 8].find(big);
console.log(find);

const sorted = [10, 21, 2].sort();
console.log(sorted);
//'10' comes before '2' in Unicode code point order.
