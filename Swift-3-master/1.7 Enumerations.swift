/*--------Enumeration
 ----------------------------------------------------------------*/

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var myBarcode = Barcode.upc(8, 85909, 51226, 3)

myBarcode = .qrCode("ABCDEFGHIJKLMNOP")


switch myBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}





/*--------Planets ENUM
 ----------------------------------------------------------------*/
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"

let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3






/*--------ArithmeticExpression ENUM
 ----------------------------------------------------------------*/
enum AExpression {
    case number(Int)
    indirect case addition(AExpression, AExpression)
    indirect case multiplication(AExpression, AExpression)
}

/*
 Or:
 
 indirect enum ArithmeticExpression {
 case number(Int)
 case addition(ArithmeticExpression, ArithmeticExpression)
 case multiplication(ArithmeticExpression, ArithmeticExpression)
 }
*/

let seven = AExpression.number(7)
let three = AExpression.number(3)

let sum = AExpression.addition(seven, three)
let product = AExpression.multiplication(sum, AExpression.number(2))

