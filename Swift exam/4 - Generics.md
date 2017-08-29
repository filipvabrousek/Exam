# GENERICS




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


## 2
```swift
func genericAdder<T: Strideable>(number: T) -> T {
    return number + 1
}

genericAdder(number: 15)
genericAdder(number: 15.0)
```

## 3
```swift
func doubleMultiplier(lhs: Double, rhs: Double) -> Double {
    return lhs * rhs
}

intMultiplier(lhs: 2, rhs: 5)
doubleMultiplier(lhs: 2.0, rhs: 5.0)

//: Create a protocol to handle multiplication
//: so we can use generics
protocol Numeric {
    func *(lhs: Self, rhs: Self) -> Self
}
// Add extensions to the types we want to support
extension Double: Numeric {}
extension Float: Numeric {}
extension Int: Numeric {}

//: Now genericMultiplier will work with any number
//: type we have extended (In this case, Double, Float
//: and Int)
func genericMultiplier<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

genericMultiplier(lhs: 2.1, rhs: 5)
genericMultiplier(lhs: 5, rhs: 5)


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

## 3
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

```

## stack extension
```swift
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

