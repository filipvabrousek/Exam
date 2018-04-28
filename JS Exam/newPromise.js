// synchronous
/*
const second = () => {
   setTimeout(() => { // exc. c. 4 (timer is created inside WEB APIs environment and runs behind the scenes), 
      // then both second and setT, pops out, so the first writes i am second
       console.log("I am third because I am async.");
   }, 2000);
};
    
const first = () => {
    console.log("I am first"); // exc. c. 2 pops
    second(); // exc. c 3
    console.log("I am second") // exc. c. 5 for "log" and the function returns
}
    
    
first(); // exc. c. 1


once the code run in a SYNCHRONOUS way and the timer finishes, callback of setTimeout gets into "message queue"
here it waits to be executed, once the execution stack is empty, same for "event listeners"
EVENT LOOP makes function in the queqe run, once the excution stack is empty

*/
    
    
// callback hell :o
function getRecipe(){
    setTimeout(() => {
        const recipeID = [200, 300];
        console.log(recipeID);
        
        setTimeout(id => {
            const recipe = {title: "Fresh tomato", author: "Filip"}
           console.log(`${id}: ${recipe.title}`);
            
        }, 1000, recipeID[2]);
        
    }, 1000);
}
    
getRecipe();
    
    
// promises
const getIDS = new Promise((resolve, reject) => {
   setTimeout(() => resolve([200, 300]), 1000);
});
    
const getMovie = mID => {
    return new Promise((resolve, reject) => {
        setTimeout(id => {
            const movie = {title: "MI: Fallout", released: 2018};
            resolve(`${id}: ${movie.title}`);
        }, 2000, mID);
    })
}
    
/*
getIDS
.then(IDs => getMovie(IDs[1]))
.then(movie => console.log(movie))
.catch(err => console.log(err));
*/

async function getData(){
    const IDs = await getIDS;
    console.log(IDs);
    const movie = await getMovie(IDs[1]);
    console.log(movie);
}
    
getData().then(res => console.log(`${res}`));

    
    
    
// PEOPLE

async function getData(){
const res = await fetch('https://randomuser.me/api/?results=10');
const data = await res.json();
data.results.map(a => console.log(a.name.first));
}
getData();
    
