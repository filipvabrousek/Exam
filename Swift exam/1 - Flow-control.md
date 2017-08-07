# FLOW CONTROL



## Optionals
```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}


let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

if assumedString != nil {
    print(assumedString)
}
// Prints "An implicitly unwrapped optional string."
if let definiteString = assumedString {
    print(definiteString)
}
```


```swift
let nickName: String? = nil
let fullName: String = "Filip Vabrousek"
let informalGreeting = "Hi \(nickName ?? fullName)"
```

## Loops
```swift
let individual = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individual {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
```




```swift
var n = 2
while n < 100 {
    n = n * 2
}
print(n)
 
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

for index in 1...7 {
    print("\(index) times 7 is \(index * 7)")
}

//names
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
```
## Switch
```swift
let event = "hard race"

switch event{
case "race":
    print("It will be funny!")
case "hard":
    print("It will be very hard!")
    
case let x where x.hasPrefix("hard"):
    print("It will be very hard")
default:
    print("It will be something interesting")
    
}
```

# Enum
* defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code
```swift
enum Places: Int {
    case first = 1
    case second, third
    
    func desc() -> String {
        switch self {
        case .first:
            return "8000"
        case .second:
            return "6000"
        case .third:
            return "3000"
        default:
            return "0"
        }
    }
}

let winnerRawValue = Places.first.rawValue


struct Results {
    var places: Places
    
    func desc() -> String {
        return "Winner has won \(places.desc()) USD"
    }
}

let winnerPriceMoney = Results(places: .first).desc()

```
# Codable
```swift
soon...
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


