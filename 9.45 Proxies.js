const manager = {
    get(source, prop) {
        if(prop in source){
            return source[prop];
        }else{
            return 37;
        }
    }
};

const p = new Proxy({}, manager);
p.a = 1;
p.b = undefined;

console.log(p.a, p.b); // 1, undefined
console.log('c' in p, p.c); // false, 37
