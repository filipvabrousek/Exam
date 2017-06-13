class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

/*--------TRAIN
 ----------------------------------------------------------------*/
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}


let train = Train()
train.makeNoise()
// Prints "Choo Choo"

/*--------CAR
 ----------------------------------------------------------------*/
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

/*--------Overriding property observers
 ----------------------------------------------------------------
You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript).
Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error. 
*/
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}



