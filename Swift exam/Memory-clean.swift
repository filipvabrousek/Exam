// 1 -----------------------------------------------------------------
class P {
    var mac: Mac?
    deinit {
        print("Person deinit")
    }
}

class Mac {
   weak var person: P? // with "weak" before Person deinit
    deinit { // if this gets called, we do not have a retain cycle
        print("Mac deinit")
    }
}

var filip:P? = P()
var eda:Mac? = Mac()
filip?.mac = eda
eda?.person = filip

filip = nil





// 2 -----------------------------------------------------------------
// Weak vs Unowned



class PE {
    var card: C?
}

class C {
    unowned let me: PE
    init(me: PE){
        self.me = me
    }
}

var marco:PE? = PE()
var cd:C? = C(me: marco!)





/* "PE" may or may not have "C", but a "C" will always be associted with PE
 "PE"s card is allowed to be nil and "C"s me cannot be nil

 UNOWNED: "C"s me is always expected to have value it GUARANTEES
 that when "PE" gets deallocated, the "C" gets deallocated as well
 ensures "C" will never  outlive its "PE" instance
 
 WEAK: is allowed to have NO value, allowed to be OPTIONAL (?)


 PE === (strong) ===> C
 PE <=== (unowned) === C
 
 
 */


// https://stackoverflow.com/questions/41061217/what-good-are-unowned-references



