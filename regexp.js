const str = "Filip Vabrousek";
const r = str.search(/vabrousek/i);
console.log(r);
//6



const str2 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
const re = /[A-E]/gi;
const matches = str2.match(re);
console.log(matches);
// ['A', 'B', 'C', 'D', 'E', 'a', 'b', 'c', 'd', 'e']



const str3 = 'For more information, see Chapter 3.4.5.1';
const re = /see (chapter \d+(\.\d)*)/i;
const found = str3.match(re);
console.log(found);
//["see Chapter 3.4.5.1",
"Chapter 3.4.5.1",
".1",
index: 22,
​input: "For more information, see Chapter 3.4.5.1"]

