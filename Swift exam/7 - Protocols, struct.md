# Protocols


```swift

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
