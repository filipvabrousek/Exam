# FLOW CONTROL



## Optionals
```swift
let pos = "123"
let conv = Int(pos)


if let act = Int(pos){
    print(" act has int value of \(act)")
} else {
    print("cannot be converted")
}
```


```swift
let nickName: String? = nil
let fullName: String = "Filip Vabrousek"
let informalGreeting = "Hi \(nickName ?? fullName)"
```

## Loops
```swift
let individual = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individual {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
```



## while, repeat, for in
```swift
var n = 2
while n < 100 {
    n = n * 2
}
print(n)
 
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

for index in 1...7 {
    print("\(index) times 7 is \(index * 7)")
}


```
## Switch
```swift
let event = "hard race"

switch event{
case "race":
    print("It will be funny!")
case "hard":
    print("It will be very hard!")
    
case let x where x.hasPrefix("hard"):
    print("It will be very hard")
default:
    print("It will be something interesting")
    
}
```

# Enum
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
    
case let .ncenter(x: xval, y: yval): // with parameters, let has to be used
    print("Some other point with specifed x: \(xval)")
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

# Operators
```swift
let b = 10
var a = 5
a = b
// a is now equal to 10
let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2
9 % 4    // equals 1
-9 % 4   // equals -1
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"

let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6

(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```


