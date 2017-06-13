
var doubles = Array(repeating: 2.5, count: 3)


/*--------Shopping list
 ----------------------------------------------------------------*/
var list: [String] = ["Eggs", "Milk"]

var list2 = ["Eggs", "Milk"]
list2.append("Haribo")
list2 += ["Sugar"] //["Eggs", "Milk", "Haribo", "Sugar"]

var firstItem = list2[0]
list2[0] = "Corn"
list2 //["Corn", "Milk", "Haribo", "Sugar"]


list2.insert("JoJo", at: 0)

let jojo = list2.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 4 items, and no JoJo

list2 // ["Corn", "Milk", "Haribo", "Sugar"]


let apples = list2.removeLast()
list2 //["Corn", "Milk", "Haribo"]







/*--------For/In
 ----------------------------------------------------------------*/
for (index, value) in list2.enumerated() {
    print("Item \(index + 1): \(value)")
}






/*--------Sets
 ----------------------------------------------------------------*/
var letters = Set<Character>()
letters.insert("A")
print("letters is of type Set<Character> with \(letters.count) items.")








/*--------Gengres
 ----------------------------------------------------------------*/
var gengres: Set<String> = ["Rock", "Classical", "Hip hop"]
var gengres2: Set = ["Rock", "Classical", "Hip hop"]


if let removedGenre = gengres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

for genre in gengres.sorted() {
    print("\(genre)")
}







/*--------Množiny
 ----------------------------------------------------------------
 ----------------------------------------------------------------
 ----------------------------------------------------------------*/
let oddDigits: Set = [1, 3, 5, 7, 10]
let evenDigits: Set = [0, 2, 4, 6, 10]
oddDigits.intersection(evenDigits).sorted()
/*
 + .union, .substracting, .symmetricDifference
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
// all are true








/*--------Airport
 ----------------------------------------------------------------
 ----------------------------------------------------------------
 ----------------------------------------------------------------*/
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var a2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
a2["LHR"] = "London"
a2


/*--------Airport If Let - update end remove value
 ----------------------------------------------------------------*/
if let oldValue = a2.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
a2

if let removedValue = a2.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."


/*--------Airport For/In
 ----------------------------------------------------------------*/
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//or airports2.values (key:value)
for airportCode in a2.keys {
    print("Airport code: \(airportCode)")
}

let airportNames = [String](a2.values)




