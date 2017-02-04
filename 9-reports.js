
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
    
