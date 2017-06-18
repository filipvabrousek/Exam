# Budget app
Warning: insert <script> to the bottom of the <body> element!!!!

## budgetController
Budget controller contains:
* Expense class
* standalone functions and variable data
* BIG return block with other functions


```javascript
const budgetController = ((() => {
    
    /*--------------------------------------Expense class----------------------------*/
  class Expense {
    constructor(id, description, value) {
      this.id = id;
      this.description = description;
      this.value = value;
      this.percentage = -1;
    }

    calcPercentage(totalIncome) {
      if (totalIncome > 0) {
        this.percentage = Math.round((this.value / totalIncome) * 100);
      } else {
        this.percentage = -1;
      }
    }

    getPercentage() {
      return this.percentage;
    }
  }
    
/*-----------------------> standalone functions of Budget Controller IIFE---------------*/
  const Income = function(id, description, value) {
    this.id = id;
    this.description = description;
    this.value = value;
  };

  const calculateTotal = type => {
    let sum = 0;
    data.allItems[type].forEach(cur => {
      sum += cur.value;
    });
    data.totals[type] = sum;
  };

  var data = {
    allItems: {
      exp: [],
      inc: []
    },
    totals: {
      exp: 0,
      inc: 0
    },
    budget: 0,
    percentage: -1
  };

    
    
/*----------------------------------Return of Budget controller IIFE--------------------------
CONTAINS:

addItem()
deleteItem()
calculateBudget
calculatePercentages
getPercentages
getBudget


*/
  return {
      //-------------------------------
    addItem(type, des, val) {
      let newItem;
      let ID;
      
      if (data.allItems[type].length > 0) {
        ID = data.allItems[type][data.allItems[type].length - 1].id + 1;
      } else {
        ID = 0;
      }
      
      if (type === 'exp') {
        newItem = new Expense(ID, des, val);
      } else if (type === 'inc') {
        newItem = new Income(ID, des, val);
      }

      data.allItems[type].push(newItem);
      return newItem;
    },

    //-----------------------------------
    deleteItem(type, id) {
      let ids;
      let index;

      ids = data.allItems[type].map(current => current.id);
      index = ids.indexOf(id);
      if (index !== -1) {
        data.allItems[type].splice(index, 1);
      }
    },

    //-----------------------------------
    calculateBudget() {

      calculateTotal('exp');
      calculateTotal('inc');
      data.budget = data.totals.inc - data.totals.exp;

      if (data.totals.inc > 0) {
        data.percentage = Math.round((data.totals.exp / data.totals.inc) * 100);
      } else {
        data.percentage = -1;
      }
    },

    //------------------------------
    calculatePercentages() {
      data.allItems.exp.forEach(cur => {
        cur.calcPercentage(data.totals.inc);
      });
    },

    //-------------------------------
    getPercentages() {
      const allPerc = data.allItems.exp.map(cur => cur.getPercentage());
      return allPerc;
    },

    //------------------------------
    getBudget() {
      return {
        budget: data.budget,
        totalInc: data.totals.inc,
        totalExp: data.totals.exp,
        percentage: data.percentage
      };
    },

    testing() {
      console.log(data);
    }
  };
}))();
```


## Part 2
* UIcontroller contains:
* 2 standalone functions
big return block of IIFE with other functions

```javascript
const UIController = ((() => {


  const DOMstrings = {
    inputType: '.add__type',
    inputDescription: '.add__description',
    inputValue: '.add__value',
    inputBtn: '.add__btn',
    incomeContainer: '.income__list',
    expensesContainer: '.expenses__list',
    budgetLabel: '.budget__value',
    incomeLabel: '.budget__income--value',
    expensesLabel: '.budget__expenses--value',
    percentageLabel: '.budget__expenses--percentage',
    container: '.container',
    expensesPercLabel: '.item__percentage',
    dateLabel: '.budget__title--month'
  };

    
    /*--------------------------------------> Standalone functions of UIController IIFE----------------------------*/
  
  const formatNumber = (num, type) => {
    var numSplit, int, dec, type;

    num = Math.abs(num);
    num = num.toFixed(2);
    numSplit = num.split('.');

    int = numSplit[0];
    if (int.length > 3) {
      int = `${int.substr(0, int.length - 3)},${int.substr(int.length - 3, 3)}`; //input 23510, output 23,510
    }

    dec = numSplit[1];
    return `${type === 'exp' ? '-' : '+'} ${int}.${dec}`;
  };


  const nodeListForEach = (list, callback) => {
    for (let i = 0; i < list.length; i++) {
      callback(list[i], i);
    }
  };

    
    
/*----------------------------------Return of UIController IIFE--------------------------
CONTAINS:

getInput
addListItem
deleteListItem
clearFields
displayBudget
displayPercentages
displayMonth
changedType
getDOMstrings
*/
  return {
      
//-------------------------------
    getInput() {
      return {
        type: document.querySelector(DOMstrings.inputType).value, // Will be either inc or exp
        description: document.querySelector(DOMstrings.inputDescription).value,
        value: parseFloat(document.querySelector(DOMstrings.inputValue).value)
      };
    },

      
//-------------------------------
    addListItem(obj, type) {
      let html;
      let newHtml;
      let element;

      if (type === 'inc') {
        element = DOMstrings.incomeContainer;

        html = '<div class="item clearfix" id="inc-%id%"> <div class="item__description">%description%</div><div class="right clearfix"><div class="item__value">%value%</div><div class="item__delete"><button class="item__delete--btn"><i class="ion-ios-close-outline"></i></button></div></div></div>';
      } else if (type === 'exp') {
        element = DOMstrings.expensesContainer;

        html = '<div class="item clearfix" id="exp-%id%"><div class="item__description">%description%</div><div class="right clearfix"><div class="item__value">%value%</div><div class="item__percentage">21%</div><div class="item__delete"><button class="item__delete--btn"><i class="ion-ios-close-outline"></i></button></div></div></div>';
      }

      // Replace the placeholder text with some actual data
      newHtml = html.replace('%id%', obj.id);
      newHtml = newHtml.replace('%description%', obj.description);
      newHtml = newHtml.replace('%value%', formatNumber(obj.value, type));
      document.querySelector(element).insertAdjacentHTML('beforeend', newHtml);
    },

      
 //-------------------------------
    deleteListItem(selectorID) {
      const el = document.getElementById(selectorID);
      el.parentNode.removeChild(el);
    },

//-------------------------------
    clearFields() {
      let fields;
      let fieldsArr;

      fields = document.querySelectorAll(`${DOMstrings.inputDescription}, ${DOMstrings.inputValue}`);
      fieldsArr = Array.prototype.slice.call(fields);

      fieldsArr.forEach((current, index, array) => {
        current.value = "";
      });

      fieldsArr[0].focus();
    },

      
 //-------------------------------
    displayBudget(obj) {
      let type;
      obj.budget > 0 ? type = 'inc' : type = 'exp';

      document.querySelector(DOMstrings.budgetLabel).textContent = formatNumber(obj.budget, type);
      document.querySelector(DOMstrings.incomeLabel).textContent = formatNumber(obj.totalInc, 'inc');
      document.querySelector(DOMstrings.expensesLabel).textContent = formatNumber(obj.totalExp, 'exp');

      if (obj.percentage > 0) {
        document.querySelector(DOMstrings.percentageLabel).textContent = `${obj.percentage}%`;
      } else {
        document.querySelector(DOMstrings.percentageLabel).textContent = '---';
      }

    },

 //-------------------------------
    displayPercentages(percentages) {
      const fields = document.querySelectorAll(DOMstrings.expensesPercLabel);
      
        nodeListForEach(fields, (current, index) => {
        if (percentages[index] > 0) {
          current.textContent = `${percentages[index]}%`;
        } else {
          current.textContent = '---';
        }
      });

    },

//-------------------------------
    displayMonth() {
      let now;
      let months;
      let month;
      let year;

      now = new Date();
      months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
      month = now.getMonth();
      year = now.getFullYear();
      document.querySelector(DOMstrings.dateLabel).textContent = `${months[month]} ${year}`;
    },
      
//-------------------------------
    changedType() {

    const fields = document.querySelectorAll(
        `${DOMstrings.inputType},${DOMstrings.inputDescription},${DOMstrings.inputValue}`);

      nodeListForEach(fields, cur => {
        cur.classList.toggle('red-focus');
      });
        
      document.querySelector(DOMstrings.inputBtn).classList.toggle('red');
    },

    getDOMstrings() {
      return DOMstrings;
    }
  };

}))();

```

## Part 3
Part 3 contains:
* many standalone functions
* IIFE return block with init() function

```javascript
const controller = (((budgetCtrl, UICtrl) => {

    
//-------------------------------
  const setupEventListeners = () => {
    const DOM = UICtrl.getDOMstrings();
    document.querySelector(DOM.inputBtn).addEventListener('click', ctrlAddItem);

    document.addEventListener('keypress', event => {
      if (event.keyCode === 13 || event.which === 13) {
        ctrlAddItem();
      }
    });

    document.querySelector(DOM.container).addEventListener('click', ctrlDeleteItem);
    document.querySelector(DOM.inputType).addEventListener('change', UICtrl.changedType);
  };

    
//-------------------------------
  const updateBudget = () => {
    budgetCtrl.calculateBudget();
    const budget = budgetCtrl.getBudget();
    UICtrl.displayBudget(budget);
  };

//-------------------------------
  const updatePercentages = () => {
    budgetCtrl.calculatePercentages();
    const percentages = budgetCtrl.getPercentages();
    UICtrl.displayPercentages(percentages);
  };

//-------------------------------
  var ctrlAddItem = () => {
    let input;
    let newItem;

    input = UICtrl.getInput();

    if (input.description !== "" && !isNaN(input.value) && input.value > 0) {
   
      newItem = budgetCtrl.addItem(input.type, input.description, input.value);
      UICtrl.addListItem(newItem, input.type);
      UICtrl.clearFields();
      updateBudget();
      updatePercentages();
    }
  };

//-------------------------------
  var ctrlDeleteItem = event => {
    let itemID;
    let splitID;
    let type;
    let ID;

    itemID = event.target.parentNode.parentNode.parentNode.parentNode.id;

    if (itemID) {

      splitID = itemID.split('-');
      type = splitID[0];
      ID = parseInt(splitID[1]);
      budgetCtrl.deleteItem(type, ID);
      UICtrl.deleteListItem(itemID);
        
      updateBudget();
      updatePercentages();
    }
  };

    
/*----------------------------------Return of controller IIFE--------------------------
CONTAINS:
init()
*/
  return {
    init() {
      console.log('Application has started.');
      UICtrl.displayMonth();
      UICtrl.displayBudget({
        budget: 0,
        totalInc: 0,
        totalExp: 0,
        percentage: -1
      });
      setupEventListeners();
    }
  };

}))(budgetController, UIController);

//only line of outside code :D
controller.init();
```
