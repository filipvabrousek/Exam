

function sum(... numbers) {
  let result = 0;
  numbers.forEach(number => {
    result += number;
  });
  return result;
}
    
    
console.log(sum(1)); // 1
console.log(sum(1, 2, 3, 4, 5)); // 15

   
/*---------------------------------NEXT EXAMPLES-------------------------------*/
var a = [2, 3, 4];
var b = [1, ...a, 5];
console.log(b); //1, 2, 3, 4, 5

function foo(x, y, ...z) {
    console.log(x, y, z);
}

foo(1, 2, 3, 4, 5); // 1 2 [3,4,5]


function foo(...args) {

    args.shift();
    console.log(...args);
}

/*-----------------------REFLECT----------------------*/

Reflect.has({x: 0}, 'x'); //true
   
var obj = { x: 1, y: 2 };
Reflect.get(obj, 'x'); // 1
Reflect.get(['zero', 'one'], 1); // "one"
    
  
Reflect.apply(''.charAt, 'ponies', [3]); // "i"  
    
var target = { foo: 'bar', baz: 'wat' }
Reflect.deleteProperty(target, 'foo')
console.log(target) // { baz: 'wat' }


var d = Reflect.construct(Date, [1776, 6, 4]);
d instanceof Date; // true
console.log(d.getFullYear()); // 1776
    
    
    
