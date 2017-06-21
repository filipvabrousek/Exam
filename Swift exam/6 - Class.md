# Class

```swift
class S {
    var name: String
    init(name: String) {
        self.name = name
    }
}


class SQ: S {
    var len: Double
    
    init(len: Double, name: String) {
        self.len = len
        super.init(name: name)
    }
    
    func area() ->  Double {
        return len * len
    }
    
}
let test = SQ(len: 5.2, name: "test")


class T: S {
    var len: Double = 0.0
    
    init(len: Double, name: String) {
        self.len = len
        super.init(name: name)
    }
    
    var perimeter: Double {
        get {
            return 3.0 * len
        }
        set {
            len = newValue / 3.0
        }
    }
    
    
}

var t = T(len: 3.1, name: "my triangle")
t.perimeter = 9.9 //t.len is 3.3

```


## Triangle and square
```swift
class TriangleAndSquare {
    var triangle: T {
        willSet {
            square.len = newValue.len
        }
    }
    // if property of the "TriangleAndSquare" (square) is changed, change also a length of a tiangle
    var square: SQ {
        willSet {
            triangle.len = newValue.len
        }
    }
    init(size: Double, name: String) {
        square = SQ(len: size, name: name)
        triangle = T(len: size, name: name)
    }
}

var TS = TriangleAndSquare(size: 10, name: "another test shape")
print(TS.square.len)   // 10
print(TS.triangle.len) // 10
TS.square = SQ(len: 50, name: "larger square")
print(TS.triangle.len) // 50

```
