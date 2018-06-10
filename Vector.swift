class Vector{
    var x: Double
    var y: Double
    init(x: Double, y:Double){
        self.x = x
        self.y = y
    }
    
    convenience init(){
        self.init(x: 0, y: 0)
    }
    
    func toNormal() -> Vector {
        return Vector(x: y, y: -x)
    }
    
    func uFrom(xa:Double, ya:Double, xb:Double, yb:Double) -> Vector {
        // u =  B-A = (xb - xa, yb - ya)
        let first = xb - xa
        let second = yb - ya
        return Vector(x: first, y: second)
    }
    
    
    func makeGE(from: Vector) -> String{
        let c = x * from.x + y * from.y
        let solution = "\(x)x + \(y)y - \(c) = 0"
        return solution
    }
    
}

// A[3, -1]; B[5, 0] we want "u", "n", "OR"
let v = Vector() // default vector with no points
let u = v.uFrom(xa: 3, ya: -1, xb: 5, yb: 0) // make "u" from A[3,-1] B[5, 0] => u = (2,1)
let normal = u.toNormal() // n = (1, -2)
let equation = normal.makeGE(from: normal)

// https://www.e-matematika.cz/stredni-skoly/jak-urcit-obecnou-rovnici-primky-urcene-dvema-body.php
