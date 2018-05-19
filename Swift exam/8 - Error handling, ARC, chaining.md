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
* automatically frees up memory, when object is not used anymore

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

## Weak, strong reference cycle
* we need to add ```weak``` before ```var person: P? ``` so it will have WEAK reference, there will be a weak retain cycle 
* and if one variable becomes nil, the second WILL NOT be dealocatted as well
```swift


class P{
    var name: String
    var h:H?
    init(name:String){
        self.name = name
    }
    
    deinit{
        print("deinit")
    }
}

/*
var me:P? = P(name: "Filip")
var ref = me // has STRONG refernce to where me was pointing ot
me = nil

// ref = nil -> "deinit"
*/

class H{
    var hobby:String = "running"
    var person: P? // with "WEAK" ("deinit" is loggedd)
}

var me: P? = P(name: "Filip") // has a STRONG refernce cycle to property "hobby" which points at "H"
var hobby: H? = H() // has a property person with a STRONG refernce pointing at employee
me?.h = hobby
hobby?.person = me
me = nil
hobby = nil 
// Nothing logs to the console (we made a STRONG REFERNCE cycle)
// STRONG REFERNCE CYCLES means that if one goes nil, both instances will be deallocated

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



