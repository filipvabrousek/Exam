# Protocols

* Comparable -type that can be compared using <, >,<=, >=
*  Equatable - type that can be compared for value equality
* Codable - type, that can convert itself into and out of an external represnetation  
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
protocol S{
    var desc: String {get}
    mutating func square()
}

extension Int:S{
    var desc: String{
        return "The number \(self)"
    }
    
    mutating func square(){
        self = self * self
    }
}

print(8.desc)
```


## Protocol inheritenance
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



## 4
* CSC - type with customizable textual representation

```swift
protocol K: CustomStringConvertible{
    var description: String { get }  // required by CSC
    var isActive: Bool {get set}
    mutating func activate()
}

struct U:K{
    var isActive: Bool = false
    
    var description: String{
        if isActive{
            return "active"
        } else {
            return "non-active"
        }
    }
    
    mutating func activate() {
        isActive = true
    }
}


var user = U()
var userb = U()
user.activate()

var arr: Array<U> = [user, userb]
for account in arr{
    print(account.description) // active, non active
}

```


## Equatable
```swift
struct Country{
    let name:String
}

let czechia = Country(name: "Czechia")
let USA = Country(name: "USA")

let list = [czechia, USA]

extension Country:Equatable{
    static func == (lhs: Country, rhs:Country) -> Bool {
        return lhs.name == rhs.name
    }
}

czechia == USA // false, obviously

```


