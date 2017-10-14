# ERROR HANDLING

```swift
enum loginError: Error {
    case empty
}

struct username {
    let name: String
    init(name: String) throws {
        if name == "" { throw loginError.empty }
        self.name = name
    }
}


do {
    try username(name: "Filip")
} catch loginError.empty {
    print("You need to enter the name")
}

```



# ARC

## 1
```swift
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var filip: Customer?


filip = Customer(name: "Filip Vabrousek")
filip!.card = CreditCard(number: 1234_5678_9012_3456, customer: filip!)

filip = nil
// Prints "Filip Vabrousek is being deinitialized"
// Prints "Card #1234567890123456 is being deinitialized"


```

## 2
```swift
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Canada's capital city is called Ottawa"

```

# Access control
* restricts access to parts of your code from code in other source files and modules
* this feature enables you to hide the implementation details of your code
```swift

public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}
 
public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}
```

```swift
class SomeInternalClass {}              // implicitly internal
let someInternalConstant = 0            // implicitly internal



```

# OPTIONAL CHAINING

```swift
class P {
    var amount: Money?
}

class Money{
    var value = 2000
}


let Filip = P()
Filip.amount = Money()

if let money = Filip.amount?.value{
    print("I have \(money) USD")
}
```



