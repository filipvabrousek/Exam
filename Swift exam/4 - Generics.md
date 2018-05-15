# GENERICS

## Swap
```swift

func swap<T>(_ a: inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}

var str = "Hello"
var str2 = "world"
swap(&str, &str2)
print(str2)         // "Hello"


```

```swift

protocol Sum { static func +(lhs:Self, rhs: Self) -> Self }

extension Int: Sum {}

func add<T: Sum>(a:T, b: T) -> T {
    return a + b
}

let f = add(a: 20, b: 10)

extension String: Sum{}
let addStr = add(a: "Hi, ", b: "Filip")


```


## Container
```swift

protocol Container {
    associatedtype Thing
    func size() -> Int
    func add(thing: Thing)
}

class Crate<Thing> : Container {
    var items = [Thing]()
    
    func size() -> Int {
        return items.count
    }
    
    func add(thing: Thing) {
        items.append(thing)
    }
}

func similarCrates<C1: Container, C2: Container> (crate1: C1, crate2: C2) -> Bool where C1.Thing == C2.Thing {
    return crate1.size() == crate2.size()
}

var stringCrate = Crate<String>()
stringCrate.add(thing: "stickers")

var intCrate = Crate<Int>()
intCrate.add(thing: 22)


/* similarCrates(stringCrate, intCrate) */

var anotherStringCrate = Crate<String>()
similarCrates(crate1: stringCrate, crate2: anotherStringCrate)                 // false
anotherStringCrate.add(thing: "goo")
similarCrates(crate1: stringCrate, crate2: anotherStringCrate)


```




## find
```swift


func find<T: Equatable>(of value: T, in array:[T]) -> Int?  {
    for (i, val) in array.enumerated(){
        if val == value{
            return i
        }
    }
    
    return nil
}

let index = find(of: "B", in: ["A", "B", "C"])
print(index)        // 1

```


## sin wave


```swift
let sinArr = 64
let f = 4.0
let phase = 0.0

let amplitude = 1.0

let wave = (0..<sinArr).map {
    amplitude * sin(2.0 * M_PI / Double(sinArr) * Double($0) * f + phase)   
}

func plot<T>(arr:Array<T>, title: String){
    for curr in arr {
        XCPCaptureValue(identifier: title, value: curr)
    }   
}

plot(arr: wave, title: "wave")
```
