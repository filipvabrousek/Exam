# EXTENSIONS

* add new functionality to an existing class, structure, enumeration, or protocol type
* includes the ability to extend types for which you do not have access to the original source code


## Double extension 
```swift

extension Double{
    var ft: Double {return self / 3.28084 }
    var m: Double {return self}
}

let feet = 3.ft
print(feet)
```

## String extension
```swift
import UIKit

extension String {
    func replace(target:String, with:String) -> String{
        return self.replacingOccurrences(of: target, with: with)
    }
}

let s = "Hi there".replace(target: "Hi", with: "Hallo")
```

## Repetitions
```swift

extension Int {
    func reps(task: () -> Void){
        for _ in 0..<self{
            task()
        }
    }
}


3.reps {
    print("Hello!")
}
```

## Square
```swift

extension Int{
    mutating func square(){
        self = self * self
    }
}

var x = 3
x.square()

```

## Equatable (rhs, lhs)
```swift

struct P{
    let age:Double
}


extension P: Equatable{
    static func ==(lhs: P, rhs:P) -> Bool{
        return lhs.age == rhs.age
    }
}

P(age: 18) == P(age: 18) // -> True
```

## Use with enum
```swift
enum OS{
    case iOS
    case android
}

extension OS:Comparable{
    static func <(lhs: OS, rhs:OS) -> Bool{
        return lhs == .iOS ? true : false
    }
}

OS.iOS < OS.android // TRUE




```

## Sum of array elements
```swift
extension Array where Element: Numeric{
    func sum() -> Element{
        return reduce(0, +)
    }
}

let n = [1, 3, 8]
n.sum() // 12

```



## Kind
```swift

extension Int{
    enum K{
        case negative, zero, positive
    }
    
    var kind: K{
        switch self{
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


func show(_ numbers: [Int]){
    for n in numbers{
       
        switch n.kind{
        case .negative:
         print("-")
        case .zero:
            print("0")
        case .positive:
            print("+")
        }
    }
}


let n = [-8, 0, 8]
show(n) // - 0 +
```

## prefix
```swift
struct V{
    var x = 0.0, y = 0.0
}

extension V{
    static prefix func -(vector: inout V) -> V{
        return V(x: -vector.x, y: -vector.y)
    }
}

var inv = V(x: 0, y: 1) // inv.x
```


# SUBSCRIPTS
* enables you to query instances of a type by writing one or more values in square brackets after the instance name

```swift
struct T{
    let m: Int
    subscript(index: Int) -> Int{
        return m * index
    }
}


let three = T(m: 3)
print("6 times 3 is \(three[6])") // 18
```
