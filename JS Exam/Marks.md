
## Marks

```js
var dataCtrl = (() => {

  class Mark {
    constructor(value, weight) {
      this.value = value;
      this.weight = weight;
    }
  }



  var storage = [];


  const calc = (data) => {
    const sum = data.reduce((prev, curr) => prev + curr, 0);
    return [sum, sum / data.length];
  };

  const calca = (s) => {

    const l = s.map(el => el.val);
    const [total, avg] = calc(l);
    console.log(total);
  }


  return {

    addMark(val, weight) {

      let newMark = new Mark(val, weight);
      storage.push(newMark);
      calca(storage);
    },

    getData() {
      console.log(storage);
    }
  }





})();


dataCtrl.addMark(1, 10);
dataCtrl.addMark(2, 10);
dataCtrl.getData();


```
