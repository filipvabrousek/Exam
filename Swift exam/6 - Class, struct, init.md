# CLASS, STRUCT, INIT

## CLASS
* reference type, not copied (reference to the same, existing instance)


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


## INHERITANCE
* ```final``` - pervents property from being overriden
```swift

class V {
    var speed = 0.0
    
    var desc: String{
        return "speed: \(speed)"
    }
}


class CAR: V{
    var hp = 1
    override var desc: String{
        return super.desc + " hp: \(hp)"
    }
}

let car = CAR()
car.speed = 320
car.hp = 250
print(car.desc)


class AUTOMATIC: CAR{
    override var speed: Double{
        didSet{
            hp = Int(speed / 10.0 + 1)
        }
    }
}








```

## Property observers
* willSet - called just before the value is stored
* didSet - called imediatelly after new value is stored


```swift
class S {
    var total: Int = 0{
        willSet(new){
            print("about to set total to \(new)")
        }
        
        didSet{
            if total > oldValue{
                print("Added \(total - oldValue) steps")
            }
        }
    }
    
    
}



let sc = S()
sc.total = 200
sc.total = 360



```
---------------------------------------------------------------------
## STRUCT
* copied
* use for few simple data values
* ```String```, ```Array```, ```Dictionary```


```swift


struct RES {
    var w = 0
    var h = 0
}


let hd = RES(w: 1920, h: 1080)
var ultra = hd
ultra.w = 3160




let a = "hd has \(hd.w) and  ultra has \(ultra.w)"
print(a)




class AUltra{
    var w = 0
    var h = 0
    
    init(w: Int, h:Int){
        self.w = w
        self.h = h
    }
}


let mode = AUltra(w: 100, h: 100)
mode.h = 20

var alsoUltra = mode
alsoUltra.w = 0
print(alsoUltra.w) // 0 (h: 20)


```


```swift

struct Point {
    var x = 0.0, y =  0.0
    mutating func moveBy(y deltaX: Double, y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}

var some = Point(x: 1.0, y: 1.0)
some.moveBy(y: 2, y: 3)

print("Coords: \(some.x), \(some.y)")


```

---------------------------------------------------------------------
## INITIALIZATION, TYPE CASTING


```swift
class MI{
    var title: String
    var year: Int
    
    init(title: String, year:Int){
        self.title = title
        self.year = year
    }
    
    convenience init(){
        self.init(title: "[Untitled]", year:0)
    }
}



class S:MI{
    
    var desc: String{
        var output = "\(year) - \(title)"
        output += year >= 2000 ? " ✔" : " ✘"
        return output
    }
    
}



/*---------------------------------------------------------------------*/
var database = [
    S(),
    S(title: "Mission: Impossible", year: 1996),
    S(title: "Mission: Impossible 6", year: 2018)
]


var count = 0

for item in database{
    if item is S{
        count += 1;
    }
    
    if let movie = item as? S{
        print("Movie was released in \(movie.year)")
    }
}

print("There are \(count) movies in the database")


for item in database{
    print(item.desc)
}


```

```swift
class P{
    var born = 0
}

class DIR:P{
    override init(){
        super.init()
        born = 1968
    }
}


let me2 = DIR()
print(me2.born)




```


```swift

struct PS{
    let title: String
    init?(title: String){
        if title.isEmpty {return nil}
        self.title = title
    }
}


let me3 = PS(title: "")
print(me3 == nil)

```
