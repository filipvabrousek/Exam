/*--------Classes
 ----------------------------------------------------------------*/

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let J = Person()
J.residence = Residence()

if let roomCount = J.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."











/*--------DEFINING MODAL CLASSES FOR OPTIONAL CHAINING
 ----------------------------------------------------------------*/
class P {
    var r: R?
}


//Residence1 (R)
class R {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: A?
}


//Room
class Room {
    let name: String
    init(name: String) { self.name = name }
}


// A(Adress)
class A {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}



func createA() -> A {
    
    let someAddress = A()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}











/*--------Accessing Properties Through Optional Chaining
 ----------------------------------------------------------------*/

let filip = P()
if let roomCount = filip.r?.numberOfRooms {
    print("Filip's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."


filip.r?.address = createA()

let someAddress = A()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
filip.r?.address = someAddress


if filip.r?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// Prints "It was not possible to print the number of rooms."




if (filip.r?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// Prints "It was not possible to set the address."











/*--------Accessing Subscripts Through Optional Chaining
 ----------------------------------------------------------------*/

if let firstRoomName = filip.r?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "Unable to retrieve the first room name."


filip.r?[0] = Room(name: "Bathroom")

let filipsH = R()
filipsH.rooms.append(Room(name: "Living Room"))
filipsH.rooms.append(Room(name: "Kitchen"))
filip.r = filipsH

if let firstRoomName = filip.r?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."




















/*--------Linking Multiple Levels of Chaining
 ----------------------------------------------------------------*/
if let filipsStreet = filip.r?.address?.street {
    print("John's street name is \(filipsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "Unable to retrieve the address."

let filipsA = A()
filipsA.buildingName = "The Larches"
filipsA.street = "Laurel Street"
filip.r?.address = filipsA

if let filipsStreet = filip.r?.address?.street {
    print("Filip's street name is \(filipsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "Filips's street name is Laurel Street."




/*--------Accessing Subscripts of Optional Type
 ----------------------------------------------------------------
 var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
 testScores["Dave"]?[0] = 91
 testScores["Bev"]?[0] += 1
 testScores["Brian"]?[0] = 72
 // the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
 
 */

