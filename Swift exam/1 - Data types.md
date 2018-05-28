# DATA TYPES




## Basic and numeric Values
```swift
struct Bool {}
struct Int {}
struct Double {}
struct Float {}
struct Range {}
struct ClosedRange {}
protocol Error {} - type representing Error that can be thown
enum Optional {} - type representing wrapped value / nil - has to be unwrapped
https://developer.apple.com/documentation/swift/numbers_and_basic_values
```

## Strings
```
struct String {}
struct Character {}
enum Unicode {}
struct staticString {}
```

## Collections
```swift
struct Array {}
struct Dictionary {}
struct Set {}
protocol OptionSet {}
(strides, ranges, sequence, zip, collection of one, emptyCollection, DictionaryLiteral
```



## Basic behaviors
```swift
 protocol Comparable, Equatable, Codable, Encodable, Decodable, Encoder, Decoder, Expressable by Array literal
```




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


```swift
let text = """
 One line
 Second line
 Third line
 """
print(text)
```
