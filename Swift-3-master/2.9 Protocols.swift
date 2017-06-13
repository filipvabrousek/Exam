
import UIKit
/*--------Basic protocol
 ----------------------------------------------------------------*/
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
// john.fullName is "John Appleseed"



/*--------Starship class
 ----------------------------------------------------------------*/
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
//USS Enterprise






/*--------RNG (Random number generator)
 ----------------------------------------------------------------*/
protocol RNG {
    func random() -> Double
}

class RNG1: RNG {
    func random() -> Double {
        return Double(arc4random_uniform(10))
    }
}

let generator = RNG1()
print("Here's a random number: \(generator.random())")

extension RNG {
    func randomBool() -> Bool {
        return random() > 5
    }
}


print("Here's a random number: \(generator.random())")



/*--------Dice
 ----------------------------------------------------------------*/
class Dice {
    let sides: Int
    let generator: RNG
    init(sides: Int, generator: RNG) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: RNG1())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}



/*--------extension of dice
 ----------------------------------------------------------------*/
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}


let d12 = Dice(sides: 12, generator: RNG1())
print(d12.textualDescription)
// Prints "A 12-sided dice"





/*--------Lot of protocols
 ----------------------------------------------------------------*/
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person1: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person1(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)
// Prints "Happy birthday, Malcolm, you're 21!"




/*--------HAS AREA
 ----------------------------------------------------------------
 ----------------------------------------------------------------*/
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}


class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}


/*--------objects
 ----------------------------------------------------------------*/
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}
// Area is 12.5663708
// Area is 243610.0
// Something that doesn't have an area









/*
 
 extension Collection where Iterator.Element: TextRepresentable {
 var textualDescription: String {
 let itemsAsText = self.map { $0.textualDescription }
 return "[" + itemsAsText.joined(separator: ", ") + "]"
 }
 }
 
 
 let murrayTheHamster = Hamster(name: "Murray")
 let morganTheHamster = Hamster(name: "Morgan")
 let mauriceTheHamster = Hamster(name: "Maurice")
 let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
 
 
 print(hamsters.textualDescription)
 // Prints "[A hamster named Murray, A hamster named Morgan, A hamster named Maurice]"
 
 
 
 
 
 
 
 
 
 
 */
