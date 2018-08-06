# FUNCTIONS


## 1
```swift
func multiply(a:Double, b:Double) -> Double{
return a*b
}

multiply(a: 3,b: 7)
```
## Rest
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


## Factorial
```swift
func factorial(num: Int) -> Int{
    
    if num == 1{
        return 1
    } else {
        return num * factorial(num: num - 1)
    }
}

factorial(num: 8)
```


## Matches
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

## Contains

```swift
var isOpen = false
let content = ["milk", "eggs"]

func contains(_ food: String) -> Bool{
isOpen = true
    
    defer {
    isOpen = false
    }
    
    let result = content.contains(food)
    return result
}

contains("milk")
print(isOpen)

```


## MinMax
```swift


func minMax(arr: [Int]) -> (min: Int, max: Int){
    var currMax = arr[0]
    var currMin = arr[0]
    
    for val in arr[1..<arr.count]{
        if val > currMax{
            currMax = val
        }
        
        if val > currMin{
            currMin = val
        }
    }
    return (currMin, currMax)
}


let bounds = minMax(arr: [2, 3, 8])
print("min: \(bounds.min), max: \(bounds.max) ")
```


## Closure
```swift
let names = ["Filip", "Sára", "Karel"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var rev = names.sorted(by: backward)
var reva = names.sorted(by: { s1, s2 in s1 > s2 } )
// both: [Sára, Karel, Filip]
```

## Capturing
*  A closure can capture constants and variables from the surrounding context in which it is defined.
 The closure can then refer to and modify the values of those constants and variables from within its body,
 even if the original scope that defined the constants and variables no longer exists.
```swift
func makeInc(for amount: Int) -> () -> Int {
    var t = 0
    func incrementer() -> Int {
        t += amount
        return t
    }
    return incrementer
}


let incByTen = makeInc(for: 10)

incByTen()
// returns a value of 10
incByTen()
// returns a value of 20
let alsoIncrementByTen = incByTen
alsoIncrementByTen()
// returns a value of 50 (reference type)
```


## Escaping closures 
 * a closure is said to escape a function when the closure is passed as an argument to the function,
 but is called after the function returns
```swift
var handlers: [() -> Void] = []

func escaping(h: @escaping () -> Void){ // without @escaping error - with @escaping closure is invoked before function returns
    handlers.append(h)
}

escaping { var x = 0 }
print(handlers.count)
```



## Autoclosures
* autoclosures work only with anonymous arguments (not even generics)
* not need to use complex brackets
```swift

func f(p: @autoclosure () -> Bool){
    if p(){
        print("true")
    }
}

f(p: {2 > 1}())
f(p: 2 > 1)
// without @autoclosure f(p: {2 > 1})

```


## Capture lists
```swift

var a = 0
var b = 0
let smart: () -> () = { [a, b] in // without this it would return 2, 3
    print(a, b)
}

a = 2
b = 3

smart() // still 0, 0 (capture list in closure has been created)



var barr: [() -> ()] = []

var i = 0
for _ in 1...3{
    barr.append { [i] in // without this, it would print 3 every time
        print(i)
    }
    i += 1
}
barr[0]() // 0
```

## Trailing closures
```swift
func greet(name: String, closure: () -> ()){
    print("Hello \(name)")
    closure()
}

greet(name: "Filip"){
    print("The closure was run")
}
```


# Defer
* runs before current scope disappears
```swift
func simple(){
    defer{
        print("I will be run before the current scope disappears")
    }
    
    print("I will be run first")
}

simple()
```
