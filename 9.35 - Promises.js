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

Promise.all([clean(), win()]).then(() => {
    console.log("All are finished.");
});
//.race -> One of them is finished
