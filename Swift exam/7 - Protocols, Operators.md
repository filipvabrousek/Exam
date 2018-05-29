# Protocols

* Comparable -type that can be compared using <, >,<=, >=
*  Equatable - type that can be compared for value equality* Codable - type, that can convert itself into and out of an * external represnetation
```swift typealias Codable = Decodable & Encodable```
* Encodable, Decodable - type that can enode / decode itself from actual repreentation
* Encoder
* Decoder


## 1
```swift
protocol N {
    var name: String { get }
}

protocol A {
    var age: Int { get }
}

struct P: N, A{
    var name: String
    var age: Int
}

func W(to celebrator: N & A){
    print("Happy birthday \(celebrator.name), you are \(celebrator.age) !")
}

let me = P(name: "Filip", age: 18)
W(to: me)

```

## 2
```swift
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



```


## 3
```swift
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
print(a.desc)


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
```

## 4
```swift

protocol A: CustomStringConvertible{
    
    var isActive: Bool { get set}
    var description: String { get }
    mutating func activate()
    
}



struct U1:A{
    var isActive: Bool = false
    
    var description: String {
        if isActive{
            return "active"
        } else {
            return "non-active"
        }
    }
    
    mutating func activate() {
        if isActive {
            print("already active")
        } else {
            isActive = true
            print("just activated")
        }
    }
}


class U2:A{
    var isActive: Bool = false
    
    var description: String {
        if isActive{
            return "active"
        } else {
            return "non-active"
        }
    }
    
    func activate() {
        if isActive {
            print("already active")
        } else {
            isActive = true
            print("just activated")
        }
    }
}

var user = U1()
user.activate()

var user2 = U2()
user2.activate()



var arr: Array<A> = [user, user2]

for account in arr{
    print("\(account.description)")
}

```

## Optional
```swift

protocol P{
    var name: String {get set}
    func greet()
}


protocol Ethan:P{
    var canFly:Bool {get set}
}

extension Ethan{
    func say(){
        print("J")
    }
}

struct S:Ethan{
    var name:String = "Ethan"
    func greet() {
        print("Hi there")
    }
    var canFly: Bool = true
    func say() {
        print("Hi")
    }
}

let conforms = S(name: "Filip", canFly: true)
print(conforms.name) // Filip


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
