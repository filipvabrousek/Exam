print("Hello Swift 3!")

/*--------Optionals
----------------------------------------------------------------*/
let nickName: String? = nil
let fullName: String = "Filip Vabrousek"
let informalGreeting = "Hi \(nickName ?? fullName)"

/*--------For/In
----------------------------------------------------------------*/
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

/*--------Simple func
----------------------------------------------------------------*/
func multiply(a:Double, b:Double) -> Double{
return a*b
}

multiply(a: 3,b: 7)

/*--------Sum of numbers
----------------------------------------------------------------*/
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf(numbers: 21, 31, 71)

/*--------Match
----------------------------------------------------------------*/
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


/*--------Map
----------------------------------------------------------------*/
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

/*--------Switch
----------------------------------------------------------------*/

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

/*--------Conditions and loops
----------------------------------------------------------------*/
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




/*-----------------------------Classes
 ---------------------------------------------------------------------------------*/

class S {
    var name: String
    init(name: String) {
        self.name = name
    }
}


class SQ: S {
    var len: Double
    
    init(len: Double, name: String) {
        self.len = len
        super.init(name: name)
    }
    
    func area() ->  Double {
        return len * len
    }
    
}
let test = SQ(len: 5.2, name: "test")



//--------------------triangle--------------------
class T: S {
    var len: Double = 0.0
    
    init(len: Double, name: String) {
        self.len = len
        super.init(name: name)
    }
    
    var perimeter: Double {
        get {
            return 3.0 * len
        }
        set {
            len = newValue / 3.0
        }
    }
    
    
}

var t = T(len: 3.1, name: "my triangle")
t.perimeter = 9.9 //t.len is 3.3


//------------Triangle nad square (willSet)----------------
class TriangleAndSquare {
    var triangle: T {
        willSet {
            square.len = newValue.len
        }
    }
    // if property of the "TriangleAndSquare" (square) is changed, change also a length of a tiangle
    var square: SQ {
        willSet {
            triangle.len = newValue.len
        }
    }
    init(size: Double, name: String) {
        square = SQ(len: size, name: name)
        triangle = T(len: size, name: name)
    }
}

var TS = TriangleAndSquare(size: 10, name: "another test shape")
print(TS.square.len)   // 10
print(TS.triangle.len) // 10
TS.square = SQ(len: 50, name: "larger square")
print(TS.triangle.len) // 50











/*-----------------------------Enumeration
---------------------------------------------------------------------------------*/

enum Places: Int {
    case first = 1
    case second, third
    
    func desc() -> String {
        switch self {
        case .first:
            return "8000"
        case .second:
            return "6000"
        case .third:
            return "3000"
        default:
            return "0"
        }
    }
}

let winnerRawValue = Places.first.rawValue


/*--------Struct (places)
----------------------------------------------------------------*/
struct Results {
    var places: Places
    
    func desc() -> String {
        return "Winner has won \(places.desc()) USD"
    }
}

let winnerPriceMoney = Results(places: .first).desc()




/*-----------------------------Protocols
---------------------------------------------------------------------------------*/
protocol P{
    var desc: String { get }
    mutating func adjust()
}

//---------------Simple class derived from example porotocol--------------
class C: P{
    var desc: String = "Simple class."
    var prop: Int = 69105
    func adjust() {
        desc += " 100% adjusted."
    }
}
var a = C()
a.adjust()
let aDesc = a.desc


//------------------------------Extension of example protocol---------------------
extension Int: P {
    var desc: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

print(7.desc)

let protocolValue: P = a
print(protocolValue.desc)


/*-----------------------------Fridge - defer example
---------------------------------------------------------------------------------*/
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



