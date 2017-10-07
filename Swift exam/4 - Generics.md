# GENERICS


```swift

func swap<T>(_ a: inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}

var str = "Hello"
var str2 = "world"
swap(&str, &str2)
print(str2)         // "Hello"


```

```swift

protocol Sum { static func +(lhs:Self, rhs: Self) -> Self }

extension Int: Sum {}

func add<T: Sum>(a:T, b: T) -> T {
    return a + b
}

let f = add(a: 20, b: 10)

extension String: Sum{}
let addStr = add(a: "Hi, ", b: "Filip")


```












```swift

struct Q<Element: Equatable>{
    fileprivate var arr: [Element] = []
    
    mutating func enqueue(new: Element){
        arr.append(new)
    }
    
    mutating func dequeue() -> Element? {
        guard !arr.isEmpty else { return nil }
        return arr.remove(at: 0)
    }
    
    
    
}


extension Q {
    func isHomogenous() -> Bool {
        guard let first = arr.first else {return true}
        return !arr.contains {$0 != first}
    }
}

var q = Q<Int>()
q.enqueue(new: 4)
q.enqueue(new: 2)
q.isHomogenous()


q.dequeue()
q.dequeue()

q.isHomogenous()

class Box<T>{
    
}

class Gift<T>: Box<T>{
    func wrap(){
        print("plain paper wrap")
    }
}

class Rose{
    
}

class Valentine: Gift<Rose>{
    override func wrap(){
        print("Wrap with ♥♥♥ paper")
    }
}


let gift = Gift<Rose>()
let valentine = Valentine()
gift.wrap()
valentine.wrap()


// plain paper wrap
// Wrap with ♥♥♥ paper



```





```swift


func find<T: Equatable>(of value: T, in array:[T]) -> Int?  {
    for (i, val) in array.enumerated(){
        if val == value{
            return i
        }
    }
    
    return nil
}

let index = find(of: "B", in: ["A", "B", "C"])
print(index)        // 1

```


## sin wave


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
