

class Perceptron {
    constructor(){
        this.weights = [];
        this.treshold = 1;
        // this.data = []; wo ?
        // leanring rate - if used just once, dont declare here
    }
    
    // called first
    train(inputs, expected){

        this.weights.length = inputs.length;
        this.weights.fill(Math.random());
        
      
        const res = this.calc(inputs);
        
        // if (res == expected){ return true}
        
        this.weights.forEach((el, index) => {
            const input = (index == inputs.length) ? 1 : inputs[index];
            this.adjust(res, expected, input, index);
        })
       // console.log(res);
        //return false;
        
        
        
    }
    
    adjust(result, expected, input, index){
        const d = (expected - result) * input * 0.1; // 0.1 is learning rate
        this.weights[index] += d;
    }
 
    calc(inputs){
        let res = 0;
        inputs.forEach((el, index) => res += inputs[index] * this.weights[index]);
        res += 1 * this.weights[this.weights.length - 1]; // last member (bias)
        return this.sigmoid(res);
    }
    
    sigmoid(x){
        return 1 / (1 + Math.exp(-x));
    }
}


let e = new Perceptron();
e.train([0,1], 1);
e.train([0,0], 0);

let smaller = e.calc([0,0]);
let bigger = e.calc([0,1]);
console.log(smaller, bigger); // add retraining algorithm
