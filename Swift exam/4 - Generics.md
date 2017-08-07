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

