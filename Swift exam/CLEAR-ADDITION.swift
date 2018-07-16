
// 1 Sports
enum sports: Int {
    case running
    case climbing
    
    func desc() -> String{
        switch self{
        case .running:
            return "the best"
        case .climbing:
            return "wow!"
        }
        
    }
    
    init(){
        self = .running
    }
}

let def = sports()

let act = sports.running.rawValue

struct List{
    var sport: sports
    func desc() -> String{
        return "Running is \(sport.desc())"
    }
}

let info = List(sport: .running).desc()





// 2 Function inside enum
enum PE{
    case center(Double, Double)
    
    func sum() -> Double{
        switch self{
        case .center(let x, let y):
            return x * y
        }
    }
}



var point = PE.center(3, 3)

switch point{
case .center(let x, let y):
    print("Some point with \(x) \(y)")
}








// 3 mutating
enum Color { // does NOT have rawValue (type not specified)
    case black
    case white
    
    mutating func change(){
        switch self{
        case .black:
            self = .white
        case .white:
            self = .black
        }
    }
}

var color = Color.black
color.change()
print(color)




enum Ager{
    case filip
    case sára
    
    func desc() -> Int{
        switch self{
        case .filip:
            return 18
        case .sára:
            return 20
        }
    }
}

let e = Ager.filip
e.desc() // 18




// inirect enums
indirect enum exp{
    case number(Int)
    case addition(exp, exp)
}

func eval(_ expr: exp) -> Int {
    switch expr{
    case let .number(val):
        return val
        
    case let .addition(lhs, rhs):
        return eval(lhs) + eval(rhs)
    }
}


let sum = exp.addition(exp.number(2), exp.number(2))
eval(sum)


// Int
let i = 9
i.addingReportingOverflow(2)
i.dividedReportingOverflow(by: 3)
i.signum()


// Double
var d = 8.0
d.advanced(by: 2.0)
d.addProduct(2, 3)
d.squareRoot()
d.formSquareRoot()
d.exponent // property


// String
var s = "I am the text"
s.lowercased()
s.uppercased()
s.dropFirst()
s.dropLast()
s.append("CH")
s.isEmpty // prop.
// s.prefix(upTo: str)
s.split(separator: " ")
//s.insert("F", at: 3) FIX
s.index(s.startIndex, offsetBy: 3)
s.lexicographicallyPrecedes("I")


var m = "Filip"
let range = m.index(m.endIndex, offsetBy: -2)..<m.endIndex
m.removeSubrange(range)

let end = s.index(s.startIndex, offsetBy: 3)
let substr = s[s.startIndex...end]
print(substr)



// Array
var arr = [2, 3, 8]
arr.append(2)
arr.popLast()
arr.dropFirst()
let part = arr.partition(by: {$0 > 3})
print("Part \(part)")



// arr.formIndex(after: &2) // ????
let ft = arr.filter { $0 > 3}
//arr.split(separator: "a")
let strs = ["1", "two", "3"]
let mapped: [Int?] = strs.map { str in Int(str)}
let cmappped:[Int] = strs.compactMap {str in Int(str)}
let sq = arr.map { val in val * val }
print(sq)


// https://medium.com/@micosmin/swift-enums-basics-b2b306750e7e
// Bond 26 4.11.2022




class P {
    let name: String
    var macbook:Macbook? // with weak "deinit" is logged
    init(name:String, macbook: Macbook?){
        self.name = name
        self.macbook = macbook
    }
    
    deinit {
        print("\(name) deinit")
    }
}


class Macbook{
    let name:String
    var owner: P?
    
    init(name: String, owner: P?){
        self.name = name
        self.owner = owner
    }
    
    deinit {
        print(" \(name) deinit")
    }
}

var filip:P?
var eda:Macbook?

filip = P(name: "Filip", macbook: nil)
eda = Macbook(name: "Eda", owner: nil)

filip?.macbook = eda
eda?.owner = filip

eda = nil

// https://www.youtube.com/watch?v=VcoZJ88d-vM

// add odd number katas to this question


//....



