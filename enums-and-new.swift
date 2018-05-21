//: Playground - noun: a place where people can play

import Foundation

// 0  - Climate

enum Climate{
    case Iceland
    case Santorini
}

var season = Climate.Iceland

switch season {
case .Iceland:
    print("Climate is cold")
    
case .Santorini:
    print("Climate is hot")
    
default:
    "Climate is not predictable"
}




// 1 - replace Iceland and Places
enum sports:Int{
    case running
    case climbing
    
    func desc() -> String{
        switch self{
        case .running:
            return "the best"
        case .climbing:
            return "Amazing"
        }
    }
}

let activity = sports.running.rawValue // without the types listed, enums can't get get .rawValue

struct List{
    var sport:sports
    func desc() -> String{
        return "Running is \(sport.desc())"
    }
}

let info = List(sport: .running).desc()
print(sports.running) // "running"
let first = sports.running.rawValue // 1





// 2 Function inside enum
enum Position{
    case center(Double, Double)
    case ncenter(x:Double, y:Double)
    
    func sum() -> Double{
        switch self { // has to be exahustive
        case .center(let x, let y): return x * y
        case .ncenter(let x, let y): return x * y
        }
    }
}

var point = Position.center(3, 2)
point.sum() // 2

switch point{
case .center(let x, let y):
    print("It is some point with x \(x)")
    
case let .ncenter(x: xval, y:yval): // with parameters, let has to be used
    print("Center = x: \(xval)")
}



// 3 mutating
enum Color { // does NOT have rawValue (type not specified)
    case black
    case white
    
    mutating func change(){
        switch self{
        case .black: self = .white
        case .white: self = .black
        }
    }
}

var color = Color.black
color.change()
print(color)




// 4 indirect enum
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

// https://medium.com/@micosmin/swift-enums-basics-b2b306750e7e
