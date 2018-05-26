import Foundation


// Data types are defined as structs

// INT-------------------------------------
var n = 10
n.addingReportingOverflow(2) // subtract, reporting, divided, reminderReporting
n.quotientAndRemainder(dividingBy: 3) // (quotient -3, remainder -1)
n.unsafeAdding(2) // No checking for owerflow
n.signum() // 1 or 0, + / -
n.negate() // -10
abs(n)
min(10, 2) // 2
// n.words ??


// DOUBLE-------------------------------------
var d = 10.0
d.addProduct(2, 3) // 16
d.squareRoot() // form square root
d.exponent // exponent value (4)
// nan, pi  infinty


// STRING------------------------------------
let str = "I am Filip"
str.lexicographicallyPrecedes("S") // Prefix, Split
let o = str.split(whereSeparator: {$0 == " "})
// https://schani.wordpress.com/2014/06/06/generators-in-swift/
// forEach


// ARRAY (add)-------------------------------------
var arr = [1, 2, 3]
let num = arr.partition(by: { $0 > 2 })
print(num)

let a = 1...3
a.elementsEqual([1, 2, 3])

let pos = ["1", "two", "3"]
let mapped: [Int?] = pos.map{str in Int(str)}
let cmapped :[Int] = pos.compactMap { str in Int(str)}

let po = [1, 2, 3]
po.prefix(2) // [1, 2]
po.suffix(10) // [1, 2, 3]



// DICTIONARY ---------------------------
let dict: [String:Int] = [String: Int]()
// filter, map, compactMap, removeAll, forEach
// https://developer.apple.com/documentation/swift/dictionary


// SET - removeAll, isStrictSubset, CompactMap, forEeach, MakeIterator
// Option set protocol







/*
 extension Int {
 func half() -> Int? {
 guard self > 1 else { return nil }
 return self / 2
 }
 }
 
 20.half()?.half?().half()*/




// Optional map 166


/*
 let isEven = {(i: Int8) -> Bool in i % 2 == 0}
 isEven {2}
 */

