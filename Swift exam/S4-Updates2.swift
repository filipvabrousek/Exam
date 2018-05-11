import UIKit










/*
 let duplicates = [("one" 1), ("one", 2), ("three", 3)]
 let nonDupDict = Dictionary(duplicates, uniquingKeysWith: { (first, _) in first })
 print(nonDupDict)  // ["three": 3, "four": 4, "five": 5, "one": 1, "two": 2]
 */

let evenKeys = ["two", "four", "six", "eight", "ten"]
var sequence = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sequence = sequence.filter { $0 % 2 == 0 } // even numbers
let evenDict = Dictionary(uniqueKeysWithValues: zip(evenKeys, sequence))
print(evenDict)

// https://www.raywenderlich.com/163857/whats-new-swift-4


let str = "Filip 🐮"

for char in str{
    print(char)
}

str.count
str.isEmpty
str.dropFirst() // dropLast()

/*
 str.filter { char in
 let isASCII = char.unicodeScalars.reduce(true, { $0 && $1.isASCII })
 return isASCII
 }
 */



let nearest = ["A", "B", "C"]
let dist = [3, 6, 4]

let dicty = Dictionary(uniqueKeysWithValues: zip(nearest, dist))
//let closest = dicty.filter{ $0.value < 6}
//print(closest)



/*
 func bubble<T: Comparable>(_ array:[T]) -> [T]{
 var sorted = array
 for i in 0..<sorted.count - 1{
 for j in 1..<sorted.count {
 if (sorted[j - 1] > sorted[j]){
 sorted.swapAt(j-1, j)// new method
 }
 }
 }
 return sorted
 }
 
 
 bubble([6, 2, 9])
 */

// Array

var arra = [2, 8, 9]
arra.distance(from: 0, to: 1)
arra.popLast()
arra.dropLast(2)
arra.append(contentsOf: [2, 3])
arra.insert(7, at: 2) // els at that index are shifted back
arra.remove(at: 0)
arra.removeAll()
arra.index(of: 8) // 1
arra.reserveCapacity(10)
print(arra)

let arr = [2, 4, 6]
let half = (arr.count - 1) / 2
let openFirst = arr[0..<half]

let end = str.index(str.startIndex, offsetBy: 3)
let substr = str[str.startIndex...end]
print(substr)

let scores = ["ba", "c"]
let filtered = scores.filter({$0.hasSuffix("a")})
print(filtered) // ba






// Dictionary

var ints = [Int:String]()
ints[16] = "sexteen"

var dict: Dictionary = [String: String]()
dict["swift"] = "great language"
dict["JS"] = "the best language"
print(dict["JS"])

// Set

let ha: Set = ["🐶", "🐱"]
let fa: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let ca: Set = ["🐦", "🐭"]

ha.isSubset(of: fa)
fa.isSuperset(of: ha)
fa.isDisjoint(with: ca)
// all are true


let odd: Set = [1, 3, 5, 7, 10]
let even: Set = [0, 2, 4, 6, 10]
odd.intersection(even).sorted()

var letters = Set<Character>()
letters.insert("A")
print("letters is of type Set<Character> with \(letters.count) items.")

for i in stride(from: 0, to: 10, by: 1){
    print(i)
} // and from through


// repeatElement, sequence zip

struct Countdown: Sequence, IteratorProtocol{
    var count: Int
    
    mutating func next() -> Int?{
        if count == 0{
            return nil
        } else {
            defer{ count -= 1}
            return count
        }
    }
}

let three = Countdown(count: 3)
for i in three{
    print(i)
}



// Higher order (callback) functions

func add(a: Double, b:Double) -> Double{
    return a + b
}

func perform(op:(_ x:Double, _ y:Double) -> Double, x: Double, y:Double){
    return op(x, y)
}

perform(op: add, x: 3, y: 2)

let data = [3, 4]
let arro: [Int] = []
//for value in data { arro.append(value * 2)}

// or use "map"
let new = arro.map {$0 * 2}

let len:Set = [2, 3]
let feet = len.map(m in m * 3.28)
print(len)


// zip ???
// https://medium.com/@abhimuralidharan/higher-order-functions-in-swift-filter-map-reduce-flatmap-1837646a63e8

// Strings (string is a struct)


