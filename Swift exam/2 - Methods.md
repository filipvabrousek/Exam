# METHODS 

## Int
```var n = 10```


Name | Name | Name
------------ | ------------- | -------------
n.addingReportingOverflow(2) | n.signum()| min(10, 2)
n.quotientAndRemainder(dividingBy: 3) |  ...| ... 
n.unsafeAdding(2) | n.isMultiple(of: 2)  | ...  

## Double

Name | Name | Name
------------ | ------------- | -------------
d.addProduct(2, 3)  | d.squareRoot()| d.formSquareRoot()
d.advancedBy(2.0)  | d.exponent | d.formSquareRoot()



## String
Name | Name | Name
------------ | ------------- | -------------
s.lowercased() |s.uppercased()| s.dropFirst()
s.dropLast()| s.append("CH")| s.isEmpty
s.insert("A", at: s.startIndex)| s.index(s.startIndex, offsetBy: 3) | s.lexicographicallyPrecedes("I")



```swift
let str = "I am Filip"
str.lexicographicallyPrecedes("S") // Prefix, Split
let o = str.split(whereSeparator: {$0 == " "})

var s = "Filip 😁"
for char in s{
    print(char)
}

for scalar in s.unicodeScalars{
    print(scalar.value) // or hasValue
}



var m = "Filip"
let range = m.index(m.endIndex, offsetBy: -2)..<m.endIndex
m.removeSubrange(range)

let end = s.index(s.startIndex, offsetBy: 3)
let substr = s[s.startIndex...end]
print(substr)


let s = "A, B, C"
s.split(separator: ",") // ["A", "B", "C"]

let table = zip(1..., "ABCDEFGHIJ")
for (code, char) in table{
    print(code, char, separator: ": ")
}


```





## Array
```swift var a = [2, 8, 9]```

Name | Name | Name
------------ | ------------- | -------------
a.distance(from: 0, to: 1) | a.dropLast(2)| a.append(contentsOf: [2, 3])
a.popLast() | a.append(contentsOf: [2, 3])| a.insert(7, at: 2)
a.remove(at: 0) | a.removeAll()  | a.index(of: 8)
a.index(of: 8) | a.reserveCapacity(10) |a.reduce(..)
a.filter(..) | a.map(..) |a.compactMap(..)

## Partition , Elements equal, prefix, suffix
```swift
var arr = [1, 2, 3]
let num = arr.partition(by: { $0 > 2 })
print(num)

let op = 1...3
op.elementsEqual([1, 2, 3])


let po = [1, 2, 3]
po.prefix(2) // [1, 2]
po.suffix(10) // [1, 2, 3]
```

## map, Compact Map
```swift
let pos = ["1", "two", "3"]
let mapped: [Int?] = pos.map{str in Int(str)}
let cmapped :[Int] = pos.compactMap { str in Int(str)}

let arr = [1.0, 2.0]
let squares = arr.map{(value: Double) -> Double in
    return value * value
}
print(squares)

let sq = arr.map { val in val * val}
print(sq)
```

## filter, reduce
```swift
let l = ["S", "F"]
let f = l.filter {$0.contains("F")}
print(f) // [F]

for (i, val) in l.enumerated(){
    print("Item \(i + 1) + \(val)")
}

```

```swift
let points = ["Filip": 100, "Terka": 60]
let reduced = points.reduce(10){
    (res, tuple) in res + tuple.value // tuple.key + ""
}
print(reduced) // 170

[2, 4, 6].reduce(0, +)

let arrs = [1, 2, 3].filter{$0 % 2 == 0}.map{$0 * $0}.reduce(0, +)
print(arrs) // sum of even numbers
```

```swift
// Collection protocols: Sequence, Collection - arrays conform to colllection protocol
let arr = [1, 2] // Are mutable collections (conform to that protocol)
arr.forEach { num in
  print(num * num)
}

```

```swift
let arrs = [[1, 2], [3, 4], [3, 4, 5], [2]]

extension Array {
    func flatSum() -> Int{
        return arrs.reduce([], +).reduce(0, +)
    }
}

let sum = arrs.flatSum()

```



## Set


```swift

// SETS

// ---------------------Set
let ha: Set = ["🐶", "🐱"]
let fa: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let ca: Set = ["🐦", "🐭"]

ha.isSubset(of: fa)
fa.isSuperset(of: ha)
fa.isDisjoint(with: ca)
// all are true

let odd: Set = [1, 3, 5, 7, 10]
let even: Set = [0, 2, 4, 6, 10]
odd.intersection(even).sorted()

var letters = Set<Character>()
letters.insert("A")
print(letters) // ["A"]\n"


let datas:Set = [1.0, 2.0]
let red = datas.reduce(0.0, +)
print(red)
```





