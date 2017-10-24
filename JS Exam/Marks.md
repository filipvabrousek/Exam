
## Marks

```js
/*------------------------------------------------------------------------------------*/

var dataCtrl = (() => {

  class Mark {
    constructor(value, weight) {
      this.value = value;
      this.weight = weight;
    }
  }

  let storage = {
    data: {
      marks: []
    },
    totals: {
      total: 0,
      avg: 0
    }
  }


  return {
    addMark(val, weight) {

      let newMark = new Mark(val, weight);
      storage.data["marks"].push(newMark)
    },


    calc() {
      let sum = 0;
      let avg = 0;


      storage.data["marks"].forEach(cur => {
        sum += cur.value * cur.weight * 0.1;
      });

      avg = sum / storage.data["marks"].length;

      storage.totals["total"] = sum;
      storage.totals["avg"] = avg;
      return storage.totals["total"]
    },


    getData() {
      //  console.log(storage);
      this.calc();
      console.log(storage.totals["avg"]);
    }
  }




})();




/*------------------------------------------------------------------------------------*/
var UICtrl = ((dataCtrl) => {


  const DOMStrings = {
    marks: "#marks",
    val: "#value",
    weight: "#weight",
    btn: "#btn"
  };

 

  return {

    getInput() {
      return {
        value: parseFloat(document.querySelector(DOMStrings.val).value),
        weight: parseFloat(document.querySelector(DOMStrings.weight).value)
      }
    },


    add2DOM() {
      let input = UICtrl.getInput();
      console.log(`input weight: ${input.weight}`);
    },

     
      
        addELs() {
 document.querySelector(DOMStrings.btn).addEventListener("click", this.add2DOM);
    },
 
   
      
    init() {
      UICtrl.addELs();
    }
  }

})(dataCtrl);





dataCtrl.addMark(1, 10);
dataCtrl.addMark(5, 10);
dataCtrl.getData();
//UICtrl.add2DOM(); // got from input
UICtrl.init(); // why ???
```
