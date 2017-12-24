
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
            let res = storage.totals["avg"].toPrecision(3);
            console.log(res);
            return res;
        }
    }




})();




/*------------------------------------------------------------------------------------*/
const UICtrl = ((dataCtrl) => {


    const DOMStrings = {
        marks: "#marks",
        avg: "#avg",
        val: "#value",
        weight: "#weight",
        btn: "#btn"
    };



    return {

        getInput() {

            let selected = document.querySelector(DOMStrings.val);
            let index = selected[selected.selectedIndex].value;

            return {
                value: parseFloat(index),
                weight: parseFloat(document.querySelector(DOMStrings.weight).value)
            }

        },


        add2DOM() {
            let input = UICtrl.getInput();
            console.log(`input value: ${input.value} input weight: ${input.weight} `);

            // add the mark
            dataCtrl.addMark(input.value, input.weight);

            let html = "<h2 class='mark'>" + input.value + "(" + input.weight + ")" + "</h2>";
            document.querySelector(DOMStrings.marks).insertAdjacentHTML("beforeBegin", html);
            // get weighted average
            let e = dataCtrl.getData();
            document.querySelector(DOMStrings.avg).innerHTML = e;
        },



        addELs() {
            document.querySelector(DOMStrings.btn).addEventListener("click", this.add2DOM);
        },


        init() {
            UICtrl.addELs();
        }
    }

})(dataCtrl);


UICtrl.init(); 

```

```html
<section id="input">
    <select id="value">
<optgroup>
    
    <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
    </optgroup>


</select>


    <input type="number" id="weight" placeholder="Enter weight" value="10" min="1" max="10" />



    <button id="btn">+</button>

</section>




<h2 id="avg">Average will appear here (currently works just with same weights)</h2>

<section id="marks">

    <!-----This will be managed by the app------>
</section>

<style>
    * {
        margin: 0;
        padding: 0;
        font-family: Arial;
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

    #marks {
        padding: 1em;

    }

    .mark {
        color: blue;
        padding: 0.6em;
    }

    select {
        padding: 2em;
    }

    h2 {
        padding: 1em;
    }


    #input {
        background: gray;
        display: flex;
        justify-content: center;

    }

    #input>* {
        margin: 1em;
    }
</style>

```
