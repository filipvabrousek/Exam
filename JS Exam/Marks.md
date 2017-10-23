
## Marks

```js
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


dataCtrl.addMark(1, 10);
dataCtrl.addMark(1, 10);
dataCtrl.addMark(5, 10);
dataCtrl.getData();
```
