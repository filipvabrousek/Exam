import Foundation


// https://www.reddit.com/r/swift/comments/67z7dy/what_is_abi_stability_and_why_does_it_matter/


var names: Dictionary = [String: Int]()
names["Filip"] = 18
names["Sara"] = 17
print(names["Sara"])


let near = ["A", "B", "C"]
let dict = [3, 6, 4]
let data = Dictionary(uniqueKeysWithValues: zip(near, dict))
let closest = data.filter { $0.value > 3} // trailing closure
print(closest) // [3, 4]



let arr = [("Filip", 18), ("Sara", 17)]

for data in arr{
    switch data{
    case ("Filip", let age):
        print("You are Filip \(age)")
    case (_, 0...17):
        print("You are old but not Filip")
    case (_, _):
        print("No data available")
    }
}

// You are Filip 18
// You are old but not Filip


// https://medium.com/@abhimuralidharan/functional-swift-all-about-closures-310bc8af31dd
class Test{
    var name: String
    
    init(name:String){
        self.name = name
    }
    
    lazy var greet:String = { [weak self] in // unowned no need for guard
        guard let strong = self else { return ""}
        return "Hello \(strong.name) !"
        }()
} // lazy only for class / struct members

var test = Test(name: "Filip")
let res = test.greet
print(res) // (without assignment) unresolve l-value







