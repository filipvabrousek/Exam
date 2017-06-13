
/*--------Struct Fahrenehit
 ----------------------------------------------------------------*/

struct Farenheit{
    var temperature: Double
    init(){
    temperature = 32.0
    }
}

var f = Farenheit()
print("Temp is \(f.temperature)° Fahrenheit")

/*--------Struct Celsius
 ----------------------------------------------------------------*/

struct Celsius {
    var tempInC:Double
   
    init(fromF f:Double){
    tempInC = (f - 32.0)/1.8
    }
    
    init(fromK k:Double){
    tempInC = k - 273.15
    }
}

let boilingPointOfWater = Celsius(fromF: 212.0)
// boilingPointOfWater.tempInC is 100.0
let freezingPointOfWater = Celsius(fromK: 273.15)
//freezingPointOfWater.tempInC is 100.0


/*--------struct Q (question)
 it is possible to write :
 let text:String
 ----------------------------------------------------------------*/


class Q {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = Q(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."










/*----BLA BLA BLA ABOUT INIT() and RULES----*/











/*--------Initialzer inhertenance and overriding
 ----------------------------------------------------------------*/

//this HAS initializer by deafult
class V {
    var wheels = 0
    var desc: String {
        return "\(wheels) wheel(s)"
    }
}

//override overwrites DEFAULT initializer from above
class Bicycle: V {
    override init() {
        super.init()
        wheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.desc)")
// Bicycle: 2 wheel(s)










/*--------Food
 ----------------------------------------------------------------*/
class Food{
    var name: String
    init(name:String){
    self.name = name
    }
    //will be used if name is NIL
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name:"Bacon")
namedMeat.name
let mysteryMeat = Food()
mysteryMeat.name



class Ingredient:Food {
    var q:Int
    init(name:String, q:Int){
    self.q = q
    super.init(name:name)
    }
    override convenience init(name:String){
        self.init(name: name, q: 1)
    }
}

let oneMysteryItem = Ingredient()
let oneBacon = Ingredient(name: "Bacon")
let sixEggs = Ingredient(name: "Eggs", q: 6)



/*--------ShoppingListItem (SLI)
 ----------------------------------------------------------------*/

class SLI: Ingredient {
    var purchased = false
    var desc: String {
        var output = "\(q) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    SLI(),
    SLI(name: "Bacon"),
    SLI(name: "Eggs", q: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.desc)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘





/*--------Failable initializers
 ----------------------------------------------------------------
----------------------------------------------------------------
 */
struct Animal {
    let species:String
    init?(species:String){
        if species.isEmpty { return nil}
        self.species = species
    }
}

let x = Animal(species: "Girrafe")
let anonymous = Animal(species: "")
if anonymous == nil {
    print("The anonymous creature could not be initialized")
}



/*--------Doc class
 ----------------------------------------------------------------*/
class Doc {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}


/*--------Automatic naming
 ----------------------------------------------------------------*/

class AutomaticalyNamedDoc:Doc{
    override init(){
    super.init()
        self.name = "[Untitled]"
    }


override init(name:String) {
super.init()
    if name.isEmpty {
    self.name = "[Untitled]"
    } else {
    self.name = name
    }
}
}

class UntitledDoc: Doc{
    override init() {
        super.init(name: "[Untitled]")!
    }
}


/*--------REQUIRED INIT
 ----------------------------------------------------------------*/
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

