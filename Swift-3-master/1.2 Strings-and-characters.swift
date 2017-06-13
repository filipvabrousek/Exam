/*--------Check if string is empty
----------------------------------------------------------------*/
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax

if emptyString.isEmpty {
    print("Nothing to see here")
}


/*--------Adding (var goes, let fails)
----------------------------------------------------------------*/
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"
 
/* LET cannot be changed -> Compile error!!!
let constantString = "Highlander"
constantString += " and another Highlander"
*/

/*--------For/In char. loop
----------------------------------------------------------------*/
for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

/*--------Add the exclamationMark:
----------------------------------------------------------------*/
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
let exclamationMark2: Character = "!"
welcome.append(exclamationMark2)
// welcome now equals "hello there!"



/*--------Multiplier
----------------------------------------------------------------*/
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"



/*--------Special chars.
----------------------------------------------------------------*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let eAcute: Character = "\u{E9}"                         // é

/*--------Number of chars in word
----------------------------------------------------------------*/
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")



/*--------Greetings (indexes)
----------------------------------------------------------------*/
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "

var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
// welcome now equals "hello!"



/*--------INSERT/REMOVE
----------------------------------------------------------------*/
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"
 
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"



/*--------Latin characters - similiar but not equal
----------------------------------------------------------------*/
let latinCapitalLetterA: Character = "\u{41}"
 
let cyrillicCapitalLetterA: Character = "\u{0410}"
 
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."





/*--------Failure and success count
----------------------------------------------------------------*/
let attempts = [
"Attempt 1: success",
"Attempt 2: success",
"Attempt 3: failure",
"Attempt 4: success"
]

var successCount = 0
for success in attempts{
    if success.hasSuffix("success"){
    successCount += 1
    }
}


var failureCount = 0
for failure in attempts{
    if failure.hasSuffix("failure"){
    failureCount += 1
    }
}

print("There are \(successCount) successfull and \(failureCount) failure attempts in tries.")

/*--------???????
----------------------------------------------------------------*/
for codeUnit in catString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "
