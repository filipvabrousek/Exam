# FLOW CONTROL



## Optionals
```swift
let pos = "123"
let conv = Int(pos)


if let act = Int(pos){
    print(" act has int value of \(act)")
} else {
    print("cannot be converted")
}
```


```swift
let nickName: String? = nil
let fullName: String = "Filip Vabrousek"
let informalGreeting = "Hi \(nickName ?? fullName)"
```

## Guard
```swift
let a:Double? = 3 // if nil guard with go

func check(){
    guard let a = a else {
        print("No value")
        return
        
    }
}

check() // 3
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



## while, repeat, for in
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

for i in 0..<10 where i % 2 == 0{
    print(i) // 0, 2, 4, 6, 8
}

```
## letter combo
```swift
let letters = ["A", "B", "C"]
let num = [1, 2, 3]

let combo = letters.map { letter in
    num.map{ num in
        (letter, num)
    }
}

print(combo) // ("A", 1), ("A", 2), ("A", 3) ... ("B", 1)....
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

```swift
let char: Character = "a"
switch char{ // you can switch the expression
case "a":
    print("The a")
fallthrough // default will alway be executed
default:
    print("is a letter")
}
// The letter "a"
// is a letter
```


```swift
let arr = [("Filip", 18), ("Sara", 17)]

for data in arr{
    switch data{
    case ("Filip", let age):
        print("You are Filip \(age)")
    case (_, 0...17):
        print("You are old but not Filip")
    case (_, _):
        print("No data available")
    }
}

// You are Filip 18
// You are old but not Filip

```



