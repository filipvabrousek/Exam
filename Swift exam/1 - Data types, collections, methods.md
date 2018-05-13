# DATA TYPES

* String
* Boolean
* Rang
* Int
* Double
* Floating point
* Array
* Set
* Dictionary
* Character


# COLLECTIONS

## Strings
```swift

// Strings are collections
let names = ["Filip", "Sára"]
for name in names[..<1]{
    print(name)
}

var s = "Filip 😁"
for char in s{
    print(char)
}

for scalar in s.unicodeScalars{
    print(scalar.value) // or hasValue
}

s.count
s.isEmpty
s.dropFirst() // dropLast()
s.insert("j", at: s.index(before: s.endIndex))

var m = "Filip"
let range = m.index(m.endIndex, offsetBy: -6)..<m.endIndex
m.removeSubrange(range)

let str = "Filip"
let end = str.index(str.startIndex, offsetBy: 3)
let substr = str[str.startIndex...end]
print(substr)
```


## Arrays

```swift

// ---------------------------------------------- Arrays
var a = [2, 8, 9]

a.distance(from: 0, to: 1)
a.popLast()
a.dropLast(2)
a.append(contentsOf: [2, 3])
a.insert(7, at: 2) // els at that index are shifted back
a.remove(at: 0)
a.removeAll()
a.index(of: 8) // 1
a.reserveCapacity(10)
print(a)
```

```swift
let arr = [2, 4, 6]
let half = (arr.count - 1) / 2
let openFirst = arr[0..<half]
```

## Filter, contains, map, reduce
```swift
let scores = ["ba", "c"]
let filtered = scores.filter({$0.hasSuffix("a")})
print(filtered) // ba

let l = ["S", "F"]
let f = l.filter {$0.contains("F")}
print(f) // [F]

for (i, val) in l.enumerated(){
    print("Item \(i + 1) + \(val)")
}


let points = ["Filip": 100, "Terka": 60]
let reduced = points.reduce(10){
    (res, tuple) in res + tuple.value // tuple.key + ""
}
print(reduced) // 170

let arrs = [1, 2, 3].filter{$0 % 2 == 0}.map{$0 * $0}.reduce(0, +)
print(arrs) // sum of even numbers

var list = ["Filip", "Terka", "Karel", "Kája"]
list[2...3] = ["X", "X"]


var air = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//or airports2.values (key:value)
for code in air.keys {
    print("Airport code: \(code)")
}

let names = [String](air.values)
print(names)
```

## Sets

```swift
// ---------------------Set
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
print(letters) // ["A"]\n"


let datas:Set = [1.0, 2.0]
let red = datas.reduce(0.0, +)
print(red)
```



## Dictionaries
```js
let evenKeys = ["two", "four", "six", "eight", "ten"]
var sequence = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sequence = sequence.filter { $0 % 2 == 0 } // even numbers
let evenDict = Dictionary(uniqueKeysWithValues: zip(evenKeys, sequence))
print(evenDict)

var dict: Dictionary = [String: String]()
dict["swift"] = "great language"
dict["JS"] = "the best language"
print(dict["JS"])


let nearest = ["A", "B", "C"]
let dist = [3, 6, 4]
let dicty = Dictionary(uniqueKeysWithValues: zip(nearest, dist))
let closest = dicty.filter{ $0.value < 6}
print(closest)
```
