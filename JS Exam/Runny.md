## Runny
```javascript
const UICtrl = (() => {
	class Run {
		constructor(id, title, dist, date) {
			this.id = id;
			this.title = title;
			this.dist = dist;
			this.date = getDate();
		}
	}
	
	class Bike {
		constructor(id, title, dist, date) {
			this.id = id;
			this.title = title;
			this.dist = dist;
			this.date = getDate();
		}
	}
	
	let data = {
			activities: {
				Run: [],
				Bike: []
			},
			total: {
				Run: 0,
				Bike: 0,
			}
		}
	
		//--------------------------------------
	const getDate = () => {
		let now;
		let months;
		let month;
		let year;
		now = new Date();
		months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		month = now.getMonth();
		year = now.getFullYear();
		day = now.getDate();
		if (day < 10) {
			day = `0` + day;
		}
		if (month > 10) {
			month = "0" + month;
		}
		return `  ${day} ${months[month]} ${year}`;
	}
	
	
	
	
	return {
		//--------------------------------------
		add(type, title, dist, date) {
			let ID;
			let newActivity;
			if (data.activities[type].length > 0) {
				ID = data.activities[type][data.activities[type].length - 1].id + 1;
			} else {
				ID = 0;
			}
			if (type === "Run") {
				newActivity = new Run(ID, title, dist);
			}
			if (type === "Bike") {
				newActivity = new Bike(ID, title, dist);
			}
			data.activities[type].push(newActivity);
			return newActivity;
		},
		
		delete() {
			//......
		},
		
		//--------------------------------------
		calc(type) {
			let sum = 0;
			let avg = 0;
			data.activities[type].forEach(cur => {
				sum += cur.dist;
			});
			data.total[type] = sum;
			return data.total[type];
		}
	}
	
})();




/*------------------------------------------------------------------------------------------------------------------------*/
const DOMCtrl = ((UICtrl) => {
	const DOMStrings = {
		date: "#date",
		desc: "#desc",
		dist: "#dist",
		btn: "#btn",
		total: "#total",
		data: "#data",
		selected: "#sel"
	};
	
	return {
		//--------------------------------------      
		addList(obj, type) {
			let html;
			if (type === "Run") {
				html = `<h2 class="run" id="${obj.id}">${obj.title} ${obj.dist} <span class="date">${obj.date}</span></h2>`;
			}
			if (type === "Bike") {
				html = `<h2 class="bike" id="${obj.id}">${obj.title} ${obj.dist} <span class="date">${obj.date}</span></h2>`;
			}
			document.querySelector(DOMStrings.data).insertAdjacentHTML("beforeend", html);
		},
		
		deleteList() {
			//....    
		},
		
		//--------------------------------------
		getInput() {
			return {
				type: document.querySelector(DOMStrings.selected).value,
				desc: document.querySelector(DOMStrings.desc).value,
				dist: parseFloat(document.querySelector(DOMStrings.dist).value),
				date: new Date().getFullYear()
			}
		},
		
		//--------------------------------------
		add2DOM() {
			let data = DOMCtrl.getInput();
			let newActivity = UICtrl.add(data.type, data.desc, data.dist, data.date)
			DOMCtrl.addList(newActivity, data.type);
			let sum = UICtrl.calc("Run") + UICtrl.calc("Bike");
			document.querySelector(DOMStrings.total).innerHTML = `${sum}`;
			return newActivity;
		},
		
		//--------------------------------------      
		addEL() {
			document.querySelector(DOMStrings.btn).addEventListener("click", this.add2DOM);
		},
		
		//--------------------------------------    
		init() {
			console.log("App has started.");
			this.addEL();
		}
		
	}
})(UICtrl);


DOMCtrl.init();
```


```html



<input id="desc" placeholder="Enter Description"/>
<input id="dist" placeholder="Enter distance" placeholder="Distance"/>

<select id="sel">
<option value = "Run">Run</option>
<option value = "Bike">Bike</option>
</select>


<button id="btn">+</button>

<section id="total">
</section>

<section id="data">



</section>

<style>
    #data,#total{width:30em;margin:1em;padding:1em;color:#fff}#data,button{background:#fff}*{font-family:Arial,sans-serif;margin:0;padding:0}input{padding:1em;margin-top:1em;margin-left:1.3em}#total{display:flex;justify-content:center;align-items:center;height:3em;font-size:1em;font-weight:700;background:#66BB6A}#data{height:10em}.run,button{color:#66BB6A}button{border:none;font-size:1.3em;margin-left:2em}.bike{color:#FF5722}.date{color:#000}
</style>
```
