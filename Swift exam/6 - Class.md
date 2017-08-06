# Class

```swift


class S{
    var name: String
    init(name: String){
        self.name = name
    }
}



class SQ: S{
    var len: Double
    
    init(len:Double, name: String){
        self.len = len
        super.init(name: name)
    }
    
    func area() ->Double{
        return len * len
    }
}

let square = SQ(len: 6.0, name: "Square")



class TR: S{
    var len: Double
    
    init(len: Double, name: String){
        self.len = len
        super.init(name: name)
    }
    
    
    var P:Double{
        get{
            return 3.0 * len
        }
        
        set{
            len = newValue / 3.0
        }
    }
}

var triangle = TR(len: 3.0, name: "Trinagle")
triangle.P = 9.9
triangle.len // 3.3


//----------------------------------------MIX-----------------------------------
class MIX{
    var triangle: TR{
        willSet{
            square.len = newValue.len
        }
    }
    
    var square: SQ {
        willSet{
            triangle.len = newValue.len
        }
    }
    
    init(size: Double, name: String){
        square = SQ(len: size, name: name)
        triangle = TR(len: size, name: name)
    }
}


var mix = MIX(size: 10, name: "mixed shape")
print(mix.square.len) // 10
print(mix.triangle.len) // 10
mix.square = SQ(len: 50, name: "large square")
print(mix.triangle.len) // 50





```
