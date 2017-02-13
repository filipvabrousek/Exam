/*
History of JavaScript

JavaScript, not to be confused with Java, was created in 10 days in May 1995 by Brendan Eich, 
then working at Netscape and now of Mozilla. 
the original name was Mocha, September of 1995 the name was changed to LiveScript, 
then in December, upon receiving a trademark license from Sun, the name JavaScript was adopted.
In 1996 - 1997 JavaScript was taken to ECMA
*/



/*
After anonymous function returns, STH stays in memory
Then, after sayHi creates new execution content, and find STH sitting there
(due to SCOPE CHAIN, if variable isnt found in local function, it goes down in the scope chain and looks for it there)
*/

function greet(sth){
    return function(name){
        console.log(sth + " " + name);
    }
}

var sayHi = greet("Hi");
sayHi("Tony");


//Promises, generators, iterators, modules
