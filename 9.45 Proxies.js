let v = {
  set(source, property, value) {
    if (value === 'age') {
      if (!Number.isInteger(value)) {
        throw new TypeError('age is not a whole number');
      }
      if (value > 200) {
        throw new RangeError('Age is incorrect');
      }
    }

    // Obvyklé chování je uložit hodnotu
    source[property] = value;
  }
};

let p = new Proxy({}, v);

p.age = 100;
console.log(p.age); // 100
p.age = 'mladý'; // Vyhodí chybu
p.age = 300; // Vyhodí chybu
