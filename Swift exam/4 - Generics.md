# GENERICS




## Adder

```swift

func adder<T: Strideable>(n: T) -> T {
return n + 1
}

adder(n: 8)

```

## Swap
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




## 3
```swift
protocol N {
    func *(a: Self, b:Self) -> Self
}

extension Double: N {}
extension Float: N {}
extension Int: N {}


func m<T:N>(a: T, b:T) -> T{
return a * b
}

m(a: 2, b: 3)

```

## 4

* not every type can be compared => equatable
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

## 5
```swift
func make<I>(repeating item: I, num: Int) -> [I]{
    var res = [I]()
    
    for _ in 0..<num{
        res.append(item)
    }
    
    return res
}

make(repeating: "knock", num: 3)
```

## Stack

```swift
protocol C{
    associatedtype Item
    mutating func push(_ item: Item)
    subscript(i: Int) -> Item {get}
}


struct STACK<E>: C{
    var items = [E]()
    
    mutating func push(_ item: E) {
        items.append(item)
    }
    
    
    subscript(i: Int) -> E{
        return items[i]
    }
    
    
    
}


extension STACK where E: Equatable{
    func isTop(_ item: E) -> Bool{
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

var database = STACK<String>()
database.push("Filip")
database.push("Terka")

let e = database[1]
print(e)

if database.isTop("Terka"){
    print("Terka is top!")
}


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
