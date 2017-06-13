/*--------Person class
 ----------------------------------------------------------------*/
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?


ref1 = Person(name: "John Appleseed")


ref2 = ref1
ref3 = ref1
ref3 = nil



/*--------IMPORTANT!!!
 Both WEAK and UNOWNED references do not create a strong hold on the referred object
 -distinction has to do with Optional types
 ----------------------------------------------------------------*/



/*--------WEAK
 A WEAK reference allows the posibility of it to become nil
 (added weak before: "var tenant: Person?")
 ----------------------------------------------------------------*/
class P {
    let name: String
    init(name: String) { self.name = name }
    var A: A?
    deinit { print("\(name) is being deinitialized") }
}

class A {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: P?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var j:P?
var unit4A1: A?

j = P(name: "John Appleseed 2")
unit4A1 = A(unit: "4A")

j!.A = unit4A1
unit4A1!.tenant = j



j = nil
// Prints "John Appleseed is being deinitialized"
unit4A1 = nil
// Prints "Apartment 4A is being deinitialized"






/*--------An UNOWNED reference presumes that it will never become nil
 ----------------------------------------------------------------*/
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






/*--------Unowned References and Implicitly Unwrapped Optional Properties
 ----------------------------------------------------------------*/

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





/*--------STRONG REFERENCE CYCLE FOR CLOSURES
 could be:
 .... lazy var asHTML: () -> String = {
 [unowned self] in if let
 ----------------------------------------------------------------*/
class HTML {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

let heading = HTML(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// Prints "<h1>some default text</h1>"

var p: HTML? = HTML(name: "p", text: "hello, world")
print(p!.asHTML())
// Prints "<p>hello, world</p>"
p = nil





/*--------(Resolving string reference cycles for closures)
 ----------------------------------------------------------------
 lazy var someClosure: (Int, String) -> String = {
 [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
 // closure body goes here
 }
 
 
 lazy var someClosure: () -> String = {
 [unowned self, weak delegate = self.delegate!] in
 // closure body goes here
 }
 */
