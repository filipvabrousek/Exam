
/*--------Class Counter
 ----------------------------------------------------------------*/
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0


/*--------Point SELF PROPERTY
 ----------------------------------------------------------------*/
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"








/*--------Mutating - if you need to MODIFY THE PROPERTIES of your structure or enumeration within a particular method
 ----------------------------------------------------------------*/
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint1.x), \(somePoint1.y))")
// Prints "The point is now at (3.0, 4.0)"

/* NO MEMBER moveBy
let fixedPoint = Point(x: 3.0, y: 3.0)
fixedPoint.moveBy(x: 2.0, y: 3.0)
 
 Could have been written in this way instead:
 struct Point {
 var x = 0.0, y = 0.0
 mutating func moveBy(x deltaX: Double, y deltaY: Double) {
 self = Point(x: x + deltaX, y: y + deltaY)
 }
 }
*/






/*--------SELF is different case for the same ENUM
 ----------------------------------------------------------------*/
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off















/*--------TYPE METHODS - level tracker (LT), HUL = Highest unlocked level
(Because it’s not necessarily a mistake for code that calls the advance(to:) method 
to ignore the return value, this function is marked with the @discardableResult attribute)
-----------------------------------------------------------------
---------------------------------------------------------------*/

struct LT {
    static var HUL = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > HUL { HUL = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= HUL
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LT.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}





/*------Class Player----*/
class Player {
    var tracker = LT()
    let playerName: String
    func complete(level: Int) {
        LT.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}


var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LT.HUL)")
// Prints "hul is now 2"


player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// Prints "level 6 has not yet been unlocked"





/*              

*****************************************************


                  SUBSCRIPT             

subscript(index: Int) -> Int {
    get {
        // return an appropriate subscript value here
    }
    set(newValue) {
        // perform a suitable setting action here
    }
}
*/

/*-----You can use subscript to acess array:

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

*/
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"
