/*--------Greet func() - (in print())
 ----------------------------------------------------------------*/
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Brian")) // Hello Brian!


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna")) //Hello Anna!



func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
//Hello again Tim!









/*--------Print w:/ count and w/o count
 ----------------------------------------------------------------*/
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but does not return a value





/*--------Find min and max value in an array
 ----------------------------------------------------------------*/
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// "min is -6 and max is 109"




/*--------Parameter DEFAULT values
 ----------------------------------------------------------------*/
func F(paramWithoutDefault: Int, paramWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
F(paramWithoutDefault: 3, paramWithDefault: 6) // parameterWithDefault is 6
F(paramWithoutDefault: 4) // parameterWithDefault is 12




/*--------Arithmetic mean
 ----------------------------------------------------------------*/
func Mean(_ numbers: Double...) -> Double {
    var t:Double = 0
    for n in numbers{
    t += n
    }
    return t/Double(numbers.count)
}

Mean(24,27)
//25.5


/*--------Countdown func()
 ----------------------------------------------------------------*/
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
