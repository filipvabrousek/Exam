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
        switch n.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
        
        print("")
        
    }
}


let n = [-8, 0, 8]
show(n) // - 0 +


```
