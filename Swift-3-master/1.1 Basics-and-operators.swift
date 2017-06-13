/*--------Number formats:
----------------------------------------------------------------*/

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation


/*--------Tuples - httpError
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------*/
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"


/*--------Converting number
----------------------------------------------------------------*/
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}



/*--------Unwrapping strings:
----------------------------------------------------------------*/
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark



if assumedString != nil {
    print(assumedString)
}
// Prints "An implicitly unwrapped optional string."

if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."

//------Assert?????

// this causes the assertion to trigger, because age is not >= 0



/*                                     
 
                            OPERATORS
 
 
 */


let b = 10
var a = 5
a = b
// a is now equal to 10

let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2

9 % 4    // equals 1
-9 % 4   // equals -1

let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"


let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6


(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"


let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90


/*
 let contentHeight = 40
 let hasHeader = true
 let rowHeight: Int
 if hasHeader {
 rowHeight = contentHeight + 50
 } else {
 rowHeight = contentHeight + 20
 }
 // rowHeight is equal to 90
 */


/*--------Loops:
----------------------------------------------------------------*/
for index in 1...7 {
    print("\(index) times 7 is \(index * 7)")
}

//names
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}



/*--------Logical operators
----------------------------------------------------------------*/
let hasDoorKey = true
let enteredDoorCode = false
let knowsOverridePassword = false
let passedRetinaScan = true

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

