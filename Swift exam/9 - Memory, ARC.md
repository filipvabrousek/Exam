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
* ARC - handles memory management of objects for us
* for each objects keeps count of how many strong references are pointing to that object

```swift


// 1 -----------------------------------------------------------------
class P {
    var mac: Mac?
    deinit {
        print("Person deinit")
    }
}

class Mac {
   weak var person: P? // with "weak" before Person deinit
    deinit { // if this gets called, we do not have a retain cycle
        print("Mac deinit")
    }
}

var filip:P? = P()
var eda:Mac? = Mac()
filip?.mac = eda
eda?.person = filip

filip = nil
```


## Unowned vs weak in closures
* unowned is used when there is NO POSSIBILITY for the reference becoming nil until the ```self``` object exists

```swift
class S {
    let m:String = "Mobile"
    
    lazy var summary: () -> String = { [unowned self] in
        return "\(self.m)" // if self.m is nil, it will crash the whole program
    }
    /* without UNOWNED, memory leak would happen, because closures have to capture entire block
     and if anything reffers to self, it never gets deallocated, even when the "S" class may have been deallocated */
    
    lazy var summaryb: () -> String = { [weak self] in
        return "\(self!.m)"
    }
}

var s = S()
s.summary()
s.summaryb()

// https://medium.com/@sergueivinnitskii/most-common-memory-leak-trap-in-swift-4565dbae5445

```




# Access control
* restricts access to parts of your code from code in other source files and modules
* this feature enables you to hide the implementation details of your code
* variables and classes are implicitly internal
* used for class, var, let
```swift
internal, public, private fileprivate
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



