# Essentials

```swift
print("Hello Swift 3!")
```

## Optionals
```swift
let nickName: String? = nil
let fullName: String = "Filip Vabrousek"
let informalGreeting = "Hi \(nickName ?? fullName)"
```

## for in
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
# Func
```swift
func multiply(a:Double, b:Double) -> Double{
return a*b
}

multiply(a: 3,b: 7)
```
# Rest
```swift
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf(numbers: 21, 31, 71)
```

# Matches
```swift
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
```

# Map (add more)
```swift
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

```

# Switch
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

# Loops
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
```

