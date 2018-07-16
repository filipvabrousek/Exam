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
class P {
    let name: String
    var macbook:Macbook?
    init(name:String, macbook: Macbook?){
        self.name = name
        self.macbook = macbook
    }
    
    deinit {
        print("\(name) deinit")
    }
}


class Macbook{
    let name:String
    weak var owner: P? // allows  "Filip" to be deinitialized
    /*with weak before "owner" "deinit" is logged
    NO strong refernce form "Eda" to "Filip" (Filip to Eda still has)
     */
    
    init(name: String, owner: P?){
        self.name = name
        self.owner = owner
    }
    
    deinit { // if this gets called, we DO NOT have retain cycle
        print(" \(name) deinit")
    }
}


var filip:P? = P(name: "Filip", macbook: nil) // Filip has STRONG ref. to itself
var eda:Macbook? = Macbook(name: "Eda", owner: nil) // eda has STRONG ref. to itself

filip?.macbook = eda // RETAIN CYCLE (both refs point to each other)
eda?.owner = filip

filip = nil // "Filip deinit" with "weak before var owner" (if eda = nil nothing is logged)
```


## Unowned
* unowned is used when there is NO POSSIBILITY for the reference becoming nil until the ```self``` object exists

```swift
class Test{
    var name: String
    
    init(name:String){
        self.name = name
    }
    
    lazy var greet:String = { [weak self] in
        guard let strong = self else { return ""}
        return "Hello \(strong.name) !"
        }()
    
    lazy var greetA:String = { [unowned un = self] in //should be used if we are sure it won't be nil
        return "Hello \(un.name)"
        }()
} // lazy only for class / struct members

var test = Test(name: "Filip")
let res = test.greet
print(res)  // Hello Filip, (without assignment) unresolve l-value


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



