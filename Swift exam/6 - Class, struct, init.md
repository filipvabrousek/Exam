# CLASS

* reference type, not copied (reference to the same, existing instance)
* static -> property won't be copied to instances
* final - prevents property from being overriden
* ```Any``` = instance of any type
* ```AnyObject``` = instance of any class type
* ```lazy``` value won't be computed until actually used (for complex operations)


### initialization
* **Designated** init = primary, normal init
* **Convenience** init = default init (if no arguments are passed to a class)

### Rules:
* designeted inits must always delegate up
* convenience inits must alwas delegate across (must call designated)

### 4 safety checks
1 - designated init must make sure all elements are initialized  
2 - designated init must delegate to superclass before assigning value to inherited property  
3 - convenience init must delegate to another init, before assigning ANY property  
4 - init cannot use any inst. methods, properties or refer to ```self``` until initialization is complete  

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
class V{
    var speed:Double = 0.0
    var desc: String{
        return "I can ride with \(speed) km/h "
    }
}

class Car:V{
    var hp = 200
    override var desc: String{
        return super.desc + "(\(hp)) hp"
    }
}


class AUTOMATIC: Car{
    override var speed: Double{
        didSet{
            hp = Int(speed / 10.0) // called before value is stored
        }
    }
}

let acar = AUTOMATIC()
print(acar.hp) // 200
acar.speed = 20
print(acar.desc) // I can ride with 20 km/h (20 hp ???)

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
## STRUCT VS CLASS

### STRUCT
* can't inherit
* passed by value (900 x faster)
* used for few  simple values
* values in instancies will be copied NOT referenced
* ```String```, ```Array```, ```Dictionary```


### CLASS
* has deinit
* allow type casting
* instances will be referenced

```swift
struct Point{
    var x = 0.0
    var y = 0.0
}

let p = Point(x: 0, y: 0)
// p.x = 3 Error: p is let constant


class Cpoint{
    var x = 0.0
    var y = 0.0
}

let c = Cpoint()
c.x = 2
print(c.x)
// in class, immutable constant is the refernce to the class itself
// NOT its instance variables


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
class P{ // has init
    var born = 0
}

class DIR:P{
    override init(){
        super.init()
        born = 1968
    }
}

let me2 = DIR()

```


## failable init
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

## struct with 2 inits
```swift

struct Color{
    let r, g, b: Double
    
    init(r:Double, g:Double, b:Double){
        self.r = r
        self.g = g
        self.b = b
    }
    
    init(w:Double){
        r = w
        g = w
        b = w
    }
}

let c = Color(w: 0.6) // transparent
```
## Codable

```swift
class P:Codable{
    let name:String
    let age:Double
    
    init(name:String, age:Double){
        self.name = name
        self.age = age
    }
    
}

let me = P(name: "Filip", age: 18)



let encoder = JSONEncoder()
let data = try encoder.encode(me)
let str = String(data:data, encoding: .utf8)


let decoder = JSONDecoder()
let decodedMe = try decoder.decode(P.self, from: data)
let info = "\(decodedMe.name)"
print(info)
```

## Keypaths
```swift
struct P {
    var name: String
    
    func greet() -> String{
        return "Hello \(name)"
    }
}

let kp = \P.name
var p = P(name: "Sára")
p[keyPath: kp] = "Filip"
p.greet()
```

## Nested types
```swift
class O{
    var person = P()
    class P{
        var name = "Filip"
        func greet() -> String{
            return self.name
        }
    }
}


let res = O()
res.person.greet() // "Filip"
```
