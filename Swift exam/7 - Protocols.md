# Protocols

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


