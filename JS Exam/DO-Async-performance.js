function now(){
    return 21;
}


function later(){
    // executed later
    answer = answer * 2;
    console.log(`Meaning of life ${answer}`);
}

let answer = now();
setTimeout(later, 1000);


/*--------------------------------------------------------------*/
let eventLoop = [];
let event;

//keep going forever
while(true){
    // perform a tick()
    if(eventLoop.length > 0){
        
        // get the next event in the queue
        event = eventLoop.shift();
        
        //now, execute the next event
        try{
            event();
        }
        
        catch(){
            reportError(err);
        }
    }
}





/*--------------------------------------------------------------*/
doA( function(){
	doC();

	doD( function(){
		doF();
	} )

	doE();
} );

doB();



/*--------------------------------------------------------------*/
listen( "click", handler );

function handler() {
	setTimeout( request, 500 );
}

function request(){
	ajax( "http://some.url.1", response );
}

function response(text){
	if (text == "hello") {
		handler();
	}
	else if (text == "world") {
		request();
	}
}





/*--------------------------------------------------------------*/
function add(a, b){
    if (typeof a != "number" || typeof b  != "number"){
        throw Error("Wrong parameters")
    }
    
    /*
    x = Number(x);
    y = Number(y);
    */
    return a + b;
}


add(3, 3); // 4
add(21, "Filip"); // -> Error


/*--------------------------------------------------------------*/
var p = Promise.resolve( 21 );

p.then( function(v){
	console.log( v );	// 21

	// create a promise to return
	return new Promise( function(resolve,reject){
		// introduce asynchrony!
		setTimeout( function(){
			// fulfill with value `42`
			resolve( v * 2 );
		}, 100 );
	} );
} )
.then( function(v){
	// runs after the 100ms delay in the previous step
	console.log( v );	// 42
} );




/*--------------------------------------------------------------*/
function delay(time) {
	return new Promise( function(resolve,reject){
		setTimeout( resolve, time );
	} );
}

delay( 100 ) // step 1
.then( function STEP2(){
	console.log( "step 2 (after 100ms)" );
	return delay( 200 );
} )
.then( function STEP3(){
	console.log( "step 3 (after another 200ms)" );
} )
.then( function STEP4(){
	console.log( "step 4 (next Job)" );
	return delay( 50 );
} )
.then( function STEP5(){
	console.log( "step 5 (after another 50ms)" );
} )


/*--------------------------------------------*/
let x = 1;

function A(){
    x++;
    B();
    console.log(x);
}

function B(){
    x++;
}

A();

/*----------------------------------------------*/
let x = 1;

function *A(){
    x++;
    yield;
    console.log(x);
}

function B(){
    x++;
}

let it = A();
it.next();
x;
B();
x;
it.next();


/*------------------------------------------------*/
function A(x,y){
    return x * y;
}

function *main(){
    try{
        let text = yield A(3, 3);
        console.log(text);
    }
    catch (err){
        console.log(err);
}
}


let it = main();
let P = it.next().value;

P.then(
function(text){
    it.next(text);
},
function (err){
    it.throw(err);
}
);



/*-------------------------------------------------------*/

function run(gen){
    let args = [].slice.call(arguments, 1);
    
    //initialize generator in the current context
    let it = gen.apply(this, args);
    
    return Promise.resolve()
    .then(function handleNext(value){
        let next = it.next(value);
        
        return (function handleResult(next){
            
            //generator has completed running
            if (next.done){
                return next.value;
            }
            
            else {
                return Promise.resolve(next.value)
                .then(
                handleNext,
                    
                function handleErr(err){
                    return Promise.resolve(
                    it.throw(err)
                    )
                    .then(handleResult);
                }
                );
            }
        })(next);
    });
}


run(main);


/*
The yield / next(..) duality is not just a control mechanism, it's actually a two-way message passing mechanism. A yield .. expression essentially pauses waiting for a value, and the next next(..) call passes a value (or implicit undefined) back to that paused yield expression.

*/


if (!Array.isArr){
    Array.isArr = function(arg){
        return Object.prototype.toString.call(arg) === "[object Array]";
    };
}
