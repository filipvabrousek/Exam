
/*--------Returns names in reversed alphabetical order
 ----------------------------------------------------------------*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
print(reversedNames)





/*--------CAPTURING VALUES
 A closure can capture constants and variables from the surrounding context in which it is defined.
 The closure can then refer to and modify the values of those constants and variables from within its body,
 even if the original scope that defined the constants and variables no longer exists.
 ----------------------------------------------------------------*/
func makeInc(for amount: Int) -> () -> Int {
    var t = 0
    func incrementer() -> Int {
        t += amount
        return t
    }
    return incrementer
}


let incByTen = makeInc(for: 10)

incByTen()
// returns a value of 10
incByTen()
// returns a value of 20
let alsoIncrementByTen = incByTen
alsoIncrementByTen()
// returns a value of 50 (reference type)





/*--------Escaping closure compHs = completition handlers
 A closure is said to escape a function when the closure is passed as an argument to the function,
 but is called after the function returns. When you declare a function that takes a closure as one of its parameters,
 you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.
 ----------------------------------------------------------------*/
func testFunctionWithNonescapingClosure(closure:() -> Void) {
    closure()
}


func testFunctionWithEscapingClosure(closure:@escaping () -> Void) {
    DispatchQueue.main.async {
        closure()
    }
}


var completionHandlers: [() -> Void] = []
func testFunctionWithEscapingClosure2(closure: @escaping () -> Void) {
    completionHandlers.append(closure)
}



/*--------Autoclosures
 ----------------------------------------------------------------*/
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"
print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
