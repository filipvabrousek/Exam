# Extensions

* add new functionality to an existing class, structure, enumeration, or protocol type
* includes the ability to extend types for which you do not have access to the original source code
```swift
/*--------Extensions
 ----------------------------------------------------------------*/

extension Double {
    var km: Double{ return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft:Double { return self / 3.28084 }
}


let oneFeet = 3.ft
print("One feet is \(oneFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"


let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// Prints "A marathon is 42195.0 meters long"




/*--------Rect
 ----------------------------------------------------------------*/
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}


let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))


extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)




/*--------Repetitions
 ----------------------------------------------------------------*/
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!


/*--------Square
 ----------------------------------------------------------------*/
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9


```
