
## Marks

```js
/*------------------------------------------------------------------------------------*/

const dataCtrl = (() => {

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
const UICtrl = ((dataCtrl) => {


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

```html


<input type="number" id = "value" placeholder="Enter mark" value="1" />
<input type="number" id = "weight" placeholder="Enter weight" value="10" />

<button id="btn">+</button>
    








<section id="marks">

<!-----This will be managed by the app------>
</section>

<style>
    * {
    margin: 0;
    padding: 0;
    }
    
    input {
        padding: 1em;
    }
    
    button {
        background: orange;
        color: #fff;
        border: none;
        padding: 1.3em;
        border-radius: 50%;
        margin: 1em;
    }

  
</style>

<!---ALWAYS AT THE BOTTOM!!!!!!!!!!!---->
<script src="practice.js">
	</script>


```
