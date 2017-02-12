var names = ["Filip", "Terezka", "Karel"];
 
    
names.pop();                        //Filip, Terezka

names.push("Honza");                //Filip, Terezka, Karel, Honza
    
names.shift();                      //Terezka, Karel
    
names.unshift("Marco");             //Marco, Filip, Terezka, Karel
    
names.slice(1,0, "Kryštof");        //Filip, Terezka, Karel
    
names.splice(1,0, "Kryštof");       //Filip, Kryštof, Terezka, Karel  
   
names.fill("Me!");                  //Me!, Me!, Me!

    

let graterThan10 = (val) => {
    return val > 10;
}
    
const filtered = [3,20].filter(graterThan10);
console.log(filtered);
     
/*------------------------SOME, EVERY, FIND, SORT---------------*/
let big = (element, index, array) => {
  return element > 10;
}

const some = [3, 20, 8].some(big); // true
console.log(some);
    
const every = [3, 20, 8].every(big); //false
console.log(every);
    
const find = [3, 20, 8].find(big); //20
console.log(find);

const sorted = [10, 21, 2].sort(); //10, 2, 21
console.log(sorted);
//'10' comes before '2' in Unicode code point order.
