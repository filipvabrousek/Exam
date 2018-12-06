
# Enums
* defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code

## Basic enum
```swift
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
    
    init(){
        self = .running
    }
}

let def = sports() // running (from init)

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
```

## enum with methods
```swift
enum P {
    case center(Double, Double)
    
    func sum() -> Double{
        switch self{
        case .center(let x, let y):
            return x + y
        }
        
    }
}

var point = P.center(3, 3)
point.sum() // 6

switch point{
case .center(let x, let y):
    print("Some point with [\(x), \(y)]")
}
```

## mutating method in enum
```swift
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
```

## Trans
```swift
class Trans{
    
    enum O{
        case lower
        case uppen
    }
    
    var into: O
    var val: String
    
    init(val:String, into: O){
        self.val = val
        self.into = into
    }
    
    func res() -> String{
        switch into{
        case .lower:
            return val.lowercased()
        case .uppen:
            return val.uppercased()
            
        }
    }
}


let up = Trans(val: "filip", into: .uppen)
up.res()
```


## indirect enums
```swift
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
```
