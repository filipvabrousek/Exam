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



