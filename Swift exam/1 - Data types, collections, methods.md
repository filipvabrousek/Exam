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

## 1
* .union, .substracting, .symmetricDifference
```swift
var doubles = Array(repeating: 2.5, count: 3)
```

```swift
var list = ["Eggs", "Milk"]
list.append("Haribo")
list.insert("JoJo", at: 0)
let jojo = list.remove(at: 0)
```
## 2
```swift
let ha: Set = ["🐶", "🐱"]
let fa: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let ca: Set = ["🐦", "🐭"]

ha.isSubset(of: fa)
fa.isSuperset(of: ha)
fa.isDisjoint(with: ca)
// all are true


let oddDigits: Set = [1, 3, 5, 7, 10]
let evenDigits: Set = [0, 2, 4, 6, 10]
oddDigits.intersection(evenDigits).sorted()

 
var letters = Set<Character>()
letters.insert("A")
print("letters is of type Set<Character> with \(letters.count) items.")

```

## 3
```swift
var list = ["Filip", "Terka", "Karel", "Kája"]
list[2...3] = ["X", "X"]
list
```
## 4
```swift
var a2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//or airports2.values (key:value)
for airportCode in a2.keys {
    print("Airport code: \(airportCode)")
}

let airportNames = [String](a2.values)
```

## 5

```swift
let arr = [2, 4, 6]
let half = (arr.count - 1) / 2
let openFirstHalf = arr[0..<half] // [2]


let tuples = [("Mon", 21), ("Tue", 21)]
let dict = Dictionary(uniqueKeysWithValues: tuples)
let anotherDict = Dictionary(uniqueKeysWithValues: zip(1..., tuples))
print(dict)
print(anotherDict)
```
## 6
```swift
var seasons = ["Spring": 20, "Summer": 30]

if let springTemp = seasons["Spring"]{
    //seasons["Spring"] = springTemp + 6
    seasons["Spring", default: 0] += 6
}

let f1 = seasons.mapValues{$0 * 2}
let f2 = seasons.filter{$0.value > 20}

print(f1)
print(f2)

```

## 7
```swift
let scores = [7, 20, 5, 30]
let grouped = Dictionary(grouping: scores, by: {String($0).count})
print(grouped)

```

## 8
```swift

let string = "Hi Filip!"
let index = string.index(of: " ")
let substr = string[..<index!]

```

# METHODS


```swift
let scores = ["ba", "c"]
let filtered =  scores.filter({$0.hasSuffix("a")})
print(filtered)

```


## Tuples

```swift
var tuple = (a: 1, b:2)
tuple  = (0, 2)
// tuple = (x:1, y:2) -> Error
```
