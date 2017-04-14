# ES6 Module pattern

```javascript
const budget = ((() => {
    
    const x = 23;
    const add = (a) => x + a;
    
    return{
        public(b) {
            return add(b);
        }
    }
}))();



const controller = (((budgetC) => {
   var z = budget.public(4);

    return {
       nextPublic(){
           console.log(z);
       } 
    }
}))(budget); //This name can't change!!! (the above can be whatever you want)



controller.nextPublic();

```
