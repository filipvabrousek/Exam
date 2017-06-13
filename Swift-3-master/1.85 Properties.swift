/*--------STORED properties
 ----------------------------------------------------------------*/

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// 6, 7, and 8

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//  0, 1, 2, and 3

/*------rangeOfFourItems.firstValue = 6
/this will report an error, even though firstValue is a variable property*/










/*--------LAZY
 ----------------------------------------------------------------
 A lazy stored property is a property whose initial value is not calculated until the first time it is used*/

class DImporter{
    var fileName = "data.txt"
}


class DManager {
    lazy var importer = DImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}


let manager = DManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property HAS NOT YET BEEN CREATED

print(manager.importer.fileName)
//instance HAS BEEN CREATED





/*--------COMPUTED properties
----------------------------------------------------------------
----------------------------------------------------------------*/
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"







/*--------READ ONLY Computed Properties
 ----------------------------------------------------------------
 */
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"







/*--------PROPERTY OBSERVERS
 ----------------------------------------------------------------
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
print(stepCounter.totalSteps)









/*--------READ ONLY Computed Properties (FROM ANOTHER SOURCE)----*/
struct TaylorFan {
    static var favoriteSong = "Shake it Off"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)




