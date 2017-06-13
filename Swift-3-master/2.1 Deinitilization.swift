
/*DEINIT
 Deinitializers are called automatically, just before instance deallocation takes place. You are not allowed to call a deinitializer yourself.
 ONLY on class type.
 */

/*--------BANK and PLAYER classes
 (C,c = coins)
 ----------------------------------------------------------------*/


class Bank {
    static var CInBank = 10000
    
    //distribute
    static func distribute(c requestedC: Int) -> Int {
        let CToVend = min(requestedC, CInBank)
        CInBank -= CToVend
        return CToVend
    }
    
    //receive
    static func receive(c: Int) {
        CInBank += c
    }
}



class Player {
    var CInPurse: Int
    init(c: Int) {
        CInPurse = Bank.distribute(c: c)
    }
    func win(c: Int) {
        CInPurse += Bank.distribute(c: c)
    }
    deinit {
        Bank.receive(c: CInPurse)
    }
}



var playerOne: Player? = Player(c: 100)
print("A new player has joined the game with \(playerOne!.CInPurse) coins")
print("There are now \(Bank.CInBank) coins left in the bank")

playerOne!.win(c: 2000)
print("PlayerOne won 2000 coins & now has \(playerOne!.CInPurse) coins")
print("The bank now only has \(Bank.CInBank) coins left")


playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.CInBank) coins")
