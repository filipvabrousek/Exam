# History
## Chris Lattner (1978-)
*  works at Google, Tesla, Apple
* University of Portland, Oregon (OS Dev. DYNIX)
* creator of LLVM - platform independent Swift, Obj-C D, Go, Rust compilator
* written in C++
* develepment started in July 2010 (JS just 10 days :D)
* one of the fastest growing languages in history

## Swift versions
* 2/6/2014 released (WWDC first Swift app)
* 9/9/2014 Swift 1.0 (strings are collections)
* 21/9/2015 Swift 2.0
* 13/9/2016 Swift 3.0 (are not)
* 19/9/2017 Swift 4.0 (are again)
* waiting for Swift 5 :D

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


## Typealias
```swift
typealias Name = String // a fake name
func greet(name: Name){
    print(name)
}

greet(name: "Filip")
```


## Bubble sort
```swift
func bubble(_ array: [Int]) -> [Int] {
    var arr = array
    for j in 0..<arr.count - 1{
        for i in 0..<arr.count - j - 1{
            if (arr[i] > arr[i + 1]){
                let temp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = temp
            }
        }
    }
    return arr
}

let res = bubble([8, 2, 6, 7]) // _ array in function means that we do not have to specify label
print(res)
```



# Operators
```swift
let b = 10
var a = 5
a = b
// a is now equal to 10
let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2
9 % 4    // equals 1
-9 % 4   // equals -1
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"

let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6

(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```

## Singleton
```swift
// https://medium.com/if-let-swift-programming/the-swift-singleton-pattern-442124479b19
final class Singleton{
    static let shared = Singleton()
    var info = "Filip loves Swift"
    private init() {}
}

Singleton.shared.info // Filip loves Swift
```
