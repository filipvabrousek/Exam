# Collection types

```swift

## Dictionary
```swift

var names: Dictionary = [String: Int]()
names["Filip"] = 18
names["Sara"] = 17
print(names["Sara"])


let near = ["A", "B", "C"]
let dict = [3, 6, 4]
let data = Dictionary(uniqueKeysWithValues: zip(near, dict))
let closest = data.filter { $0.value > 3} // trailing closure
print(closest) // [3, 4]


let dictf: [String: (Int, Int) -> Int] = [
    "add": (+)
]
dictf["add"]?(1,2) // 3
```
