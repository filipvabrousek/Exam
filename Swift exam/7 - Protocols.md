# Protocols


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

# RNG
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
```


```swift
//: ## Devslopes POP
//: ### Protocol Oriented Programming
//: Protocols

import UIKit

protocol Vehicle: CustomStringConvertible {
    var isRunning: Bool { get set }
    var description: String { get }
    mutating func start()
    mutating func turnOff()
}

struct SportsCar: Vehicle {
    var isRunning: Bool = false
    
    var description: String {
        if isRunning {
            return "Sports car currently running"
        } else {
            return "Sports car currently turned off"
        }
    }
    
    mutating func start() {
        if isRunning {
            print("Already started!")
        } else {
            isRunning = true
            print("Vrooom")
        }
    }
    
    mutating func turnOff() {
        if isRunning {
            isRunning = false
            print("Crickets")
        } else {
            print("Already dead")
        }
        
    }
}

class SemiTruck: Vehicle {
    var isRunning: Bool = false
    var description: String {
        if isRunning {
            return "Semi truck currently running"
        } else {
            return "Semi truck currently shut down"
        }
    }
    
    func start() {
        if isRunning {
            print("Already started!")
        } else {
            isRunning = true
            print("Rumble")
        }
    }
    
    func turnOff() {
        if isRunning {
            isRunning = false
            print("put..put...silence")
        } else {
            print("Already shut down!")
        }
    }
    
    func blowAirHorn() {
        print("TOOOOOOT :)")
    }
}


var car1 = SportsCar()
var truck1 = SemiTruck()

car1.start()
truck1.start()
truck1.blowAirHorn()

car1.turnOff()
truck1.turnOff()

var vehicleArray: Array<Vehicle> = [car1, truck1]
for vehicle in vehicleArray {
    print("\(vehicle.description)")
//    if let vehicle = vehicle as? SemiTruck {
//        print("\(vehicle.description)")
//    }
}



```


