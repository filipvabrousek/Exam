
class E {
  constructor(name, built) {
    this.name = name;
    this.built = built;
  }
}

class Street extends E {
  constructor(name, built, length, size = 3) {
    super(name, built);
    this.length = length;
    this.size = size;
  }

  classify() {
    const c = new Map();
    c.set(1, 'tiny');
    c.set(3, 'normal');
    c.set(5, 'huge');
    console.log(`${this.name}, build in ${this.built}, is a ${c.get(this.size)} street.`);
  }
}


const allStreets = [new Street('Ocean Avenue', 1999, 1.1, 1),
  new Street('Evergreen Street', 2008, 2.7, 3),
];

function calc(arr) {
  const sum = arr.reduce((prev, cur, index) => prev + cur, 0);
  return [sum, sum / arr.length];
}


    
    
function report(s) {
    
  const [totalLength, avgLength] = calc(s.map(el => el.length));
  console.log(`Our ${s.length} streets have a total length of ${totalLength} km, with an average of ${avgLength} km.`);
  s.forEach(el => el.classify());
    
    const i = s.map(el => el.length).findIndex(el => el >= 2);
    console.log(`${s[i].name} is longer than 2km.`);
}

report(allStreets);
    



/*---------------------------EXTENDING ARRAY-------------------------------*/

class Stack extends Array{
   constructor(length){
      super(length);
   }

   top(){
      return this[this.length - 1];
   }
}
    

var s = new Stack();   

s.push("world");
s.push("hello");
console.log(s.top());  // "hello"
console.log(s.length); // 2
    

/*---------------------------EMPTY CONSTRUCTOR-------------------------------*/

class Parent {
    constructor() {
        if (new.target === Parent) {
            console.log("Parent instantiated");
        } else {
            console.log("A child instantiated");
        }
    }
}

class Child extends Parent {}

var a = new Parent();
// Parent instantiated

var b = new Child();
// A child instantiated





/*---------------------------Arrow functions do not create their own this????? Lecture 24-------------------------------*/
    
    this.a = 25;
    
    let print = function(){
        this.a = 50; 
        console.log(this.a); //50
    }
    
    print();
    
    let arrowPrint = () => {
        console.log(this.a); //50
    }
    
    arrowPrint();    
    
    
