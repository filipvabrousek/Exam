## Codable

```swift
class P:Codable{
    let name:String
    let age:Double
    
    init(name:String, age:Double){
        self.name = name
        self.age = age
    }
    
}

let me = P(name: "Filip", age: 18)



let encoder = JSONEncoder()
let data = try encoder.encode(me)
let str = String(data:data, encoding: .utf8)


let decoder = JSONDecoder()
let decodedMe = try decoder.decode(P.self, from: data)
let info = "\(decodedMe.name)"
print(info)

let ageKeyPath = \P.age
let myAge = me[keyPath: ageKeyPath]
print(myAge)

```


## Filtering
```swift
let scores = ["ba", "c"]
let filtered =  scores.filter({$0.hasSuffix("a")})
print(filtered)

```

## Extension
```swift

let primeNumbers = [3, 7, 5, 19, 11, 13]

extension Array where Element: Comparable {
    
    subscript(minValue: Element, maxValue: Element) -> [Element] {
        var array: [Element] = []
        if let minimum = self.min(), minimum == minValue {
            array.append(minValue)
        }
        if let maximum = self.max(), maximum == maxValue {
            array.append(maxValue)
        }
        return array
    }
}


let greetings = ["Hello", "Hey", "Hi", "Goodbye", "Bye"]

let onlyMin = primeNumbers[3, 13] //    3
let onlyLast = greetings["Goodbye", "Hi"] //    "Hi"


```

## Array
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


## How to call it? :D
```swift
var seasons = ["Spring": 20, "Summer": 30]

if let springTemp = seasons["Spring"]{
    //seasons["Spring"] = springTemp + 6
    seasons["Spring", default: 0] += 6
}
```

## Dictionaries
```swift
let scores = [7, 20, 5, 30]
let grouped = Dictionary(grouping: scores, by: {String($0).count})
print(grouped)

```

## Strings
```swift

let string = "Hi Filip!"
let index = string.index(of: " ")
let substr = string[..<index!]

```
