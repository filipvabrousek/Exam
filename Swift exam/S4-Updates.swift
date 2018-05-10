import UIKit


let arr = [2, 4, 6]
let half = (arr.count - 1) / 2
let openFirst = arr[0..<half]



var ints = [Int:String]()
ints[16] = "sexteen"

var dict: Dictionary = [String: String]()
dict["swift"] = "great language"
dict["JS"] = "the best language"
print(dict["JS"])





let scores = ["ba", "c"]
let filtered = scores.filter({$0.hasSuffix("a")})
print(filtered) // ba






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




