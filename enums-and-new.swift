
// 1
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
        case .black: self = white
        case .white: self = black
        }
    }
}

var color = Color.black
color.change()
print(color)




// STATIC you do not need to create an instance
struct P{
    static func name() -> String{
        return "Filip"
    }
}

P.name() // we can call methods directly on them, for classes we use "class" keyword


