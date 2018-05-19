import Foundation


let str = "\u{2665}"
print(str)

let char: Character = "a"
switch char{ // you can switch the expression
case "a":
    print("The a")
    fallthrough // default will alway be executed
default:
    print("is a letter")
}
// The letter "a"
// is a letter


indirect enum exp { // w/o indirect it won't work
    case number(Int)
    case addition(exp, exp)
}


func evaluate(_ expr: exp) -> Int{
    switch expr{
    case let .number(val):
        return val
    
    case let .addition(lhs, rhs):
    return evaluate(lhs) + evaluate(rhs)
    
    }
}

let sum = exp.addition(exp.number(1), exp.number(2))
print(evaluate(sum)) // 3

// lazy var = ComplexOperation() value won't b computed until actually used
// "static" in struct means that the property belongs only to the struct/class but NOT its instances


@discardableResult // WTF ?????
 func add(a: Int, b:Int) -> Int{
    return a + b
}

add(a: 1, b: 2)

assert(2 > 1)

// CLASS: you can prevent a method property or subscript from being overriden by marking it as "final"
// you can have 2 inits

struct Color{
    let r, g, b: Double
    
    init(r:Double, g:Double, b:Double){
        self.r = r
        self.g = g
        self.b = b
    }
    
    init(w:Double){
        r = w
        g = w
        b = w
    }
}

let c = Color(w: 0.6) // transparent


func simple(){
    defer{
        print("I will be run before the current scope disappears")
    }
    
    print("I will be run first")
}

simple()

// Any = instance of any type
// AnyObject = instance of any class type



// Nested types
class O{
    var person = P()
    class P{
        var name = "Filip"
        
        func greet() -> String{
            return self.name
        }
    }
}


let res = O()
res.person.greet() // "Filip"



// Advanced operators

struct V{
    var x = 0.0, y = 0.0
}

extension V{
    static prefix func -(vector: inout V) -> V{
        return V(x: -vector.x, y: -vector.y)
    }
}

var doubled = V(x: 0, y: 1)














