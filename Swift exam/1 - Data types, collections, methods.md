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
