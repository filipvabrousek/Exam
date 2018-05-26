# GENERICS
* enables you to write functions which can be used with any type


*  inout means: passing by REFERENCE, witout this, initial values would stay the same beacuse copy would be created
## Swapping ints
```swift
func nswap(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

var x = 2
var y = 3
nswap(&x, &y)
print(x) // 3


// Genric example
func swap<T>(_ a: inout T, _ b:inout T){
    let tempA = a
    a = b
    b = tempA
}

var a = 1
var b = 2
swap(&a, &b)
print(a) // 2
```


## Usage with protocols
```swift
protocol Sum {
    static func +(lhs:Self, rhs:Self) -> Self // has to be "+" self becomes "str" ??
}

extension Int: Sum {}

func add<T:Sum>(a: T, b:T) -> T{
    return a + b
}

let f = add(a: 1, b: 2) // 3

extension String: Sum{}
let st = add(a: "a", b: "b") // "ab"
```

## Library example
```swift
protocol S {
    associatedtype Thing
    func size() -> Int
    func add(thing: Thing)
}

class Library<Thing> : S {
    var items = [Thing]()
    
    func size() -> Int {
        return items.count
    }
    
    func add(thing: Thing) {
        items.append(thing)
    }
}

func similiar<C1: S, C2: S> (a: C1, b: C2) -> Bool where C1.Thing == C2.Thing {
    return a.size() == b.size()
}

var strs = Library<String>()
strs.add(thing: "stickers")

var ints = Library<Int>()
ints.add(thing: 22)


var another = Library<String>()
similiar(a: strs, b: another)  // FALSE
another.add(thing: "goo")
similiar(a: strs, b: another) // TRUE
```

## Finding index of item
```swift
func find<T:Equatable>(of value: T, in array: [T]) -> Int? {
    for (i, val) in array.enumerated(){ // like forEach in JS
        if val == value{ return i }
    }
    return nil
}

let index = find(of: "B", in: ["A", "B", "C"]) // 1


```


## generic callbacks
```swift
func map<T, U>(arr: [T], cb: (T) -> U) -> [U]{
    var res: [U] = []
    for i in 0..<arr.count{
        res.append(cb(arr[i]))
    }
    return res
}

let res = map(arr: [2, 4, 6], cb: {$0 * $0})
print(res) // [4, 16, 36]
```


## sin wave
* UIKit required
```swift
let sinArr = 64
let f = 4.0
let phase = 0.0

let amplitude = 1.0

let wave = (0..<sinArr).map {
    amplitude * sin(2.0 * M_PI / Double(sinArr) * Double($0) * f + phase)   
}

func plot<T>(arr:Array<T>, title: String){
    for curr in arr {
        XCPCaptureValue(identifier: title, value: curr)
    }   
}

plot(arr: wave, title: "wave")
```
