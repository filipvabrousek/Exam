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


## Unowned
* unowned is used when there is NO POSSIBILITY for the reference becoming nil until the ```self``` object exists

```swift
// 2 -----------------------------------------------------------------
// Weak vs Unowned



class PE {
    var card: C?
}

class C {
    unowned let me: PE
    init(me: PE){
        self.me = me
    }
}

var marco:PE? = PE()
var cd:C? = C(me: marco!)

marco = nil
cd


/* "PE" may or may not have "C", but a "C" will always be associted with PE
 "PE"s card is allowed to be nil and "C"s me cannot be nil

 UNOWNED: "C"s me is always expected to have value it GUARANTEES
 that when "PE" gets deallocated, the "C" gets deallocated as well
 ensures "C" will never  outlive its "PE" instance
 
 WEAK: is allowed to have NO value, allowed to be OPTIONAL (?)


 PE === (strong) ===> C
 PE <=== (unowned) === C
 
 
 */

// grafika ponělí 1. týd. v březnu
//

// https://stackoverflow.com/questions/41061217/what-good-are-unowned-references



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



