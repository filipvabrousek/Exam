# Katas


## Sum of integers
```swift
func sumOfIntegersInString(_ str: String) -> Int {

    let ints = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var arr:[Character] = []
    var pure:[[Int]] = []
    
    // 1 - get all characters other than a number and replace them with "X" symbol
    // "A122a1" -> ["X", "1", "2", "2", "X", "1"]
    
    for i in 0..<str.characters.count {
        let index = str.index(str.startIndex, offsetBy: i)
        let char = str[index]
        
        if (ints.contains(String(char))){
            arr.append(char)
        } else {
            arr.append("X")
        }
    }
    
    // arr is ["X", "1", "2", "2", "X", "1", "X", "2"]
    
    
    
    var sub = [Int]()
    
    for i in 0..<arr.count {
        
        if (arr[i] != "X"){
            sub.append(Int(String(arr[i]))!)
        } else {
            
            pure.append(sub)
            sub.removeAll()
        }
        
        if (i == arr.count - 1){
            print("Now")
            
            if (arr[i] != "X"){
                sub.append(Int(String(arr[i]))!)
                sub.removeLast()
                pure.append(sub)
            }
            
        } 
    }
    
    // pure is [[], [1, 2, 2], [1]]
    
 
    var sume = 0
    for subarr in pure{
        
        var count = ""
        for char in subarr{
            count += "\(Int(char))"
        }
        
        
        if let count = Int(count){
            print(count)
            sume += count
        }
        
    }
    
    
    return sume
    
}

// before Dashatize (about 4hrs of work)

```


## Dashatize
```swift

func dashatize(_ number: Int) -> String {
    
    var num = number
    if abs(num) != num { // get positive number
        num = abs(num)
    }
    
    let inp = String(num) // 6815  num
    var arr = [Int]()
    
    for char in inp {
        arr.append(Int(String(char))!)
    }
    
    
    
    var sub = [String]()
    
    for (i, val) in arr.enumerated() {
        
        if arr[i] % 2 == 0  { // odd (7) add mark
            sub.append(String(arr[i]))
        } else {
            sub.append("-")
            sub.append(String(arr[i]))
            sub.append("-")
        }
    }
    
    
    for i in 0..<sub.count - 1{
        
        if (sub[i + 1] == "-" && sub[i] == "-"){
            print(i)
            sub[i] = "X"
        }
        
        
        if  sub[sub.count - 1] == "-"{
            sub[sub.count - 1] = "X"
        }
        
        if  sub[0] == "-"{
            sub[0] = "X"
        }
    }
    
    
    var res = ""
    
    for el in sub {
        if (el != "X"){
            res += el
        }
    }
    
    return res
}

dashatize(-28369)

/*
 dashatize(274) -> '2-7-4'
 dashatize(6815) -> '68-1-5'
 dashatize(-28369) -> '28-3-6-9'
 https://www.codewars.com/kata/58223370aef9fc03fd000071/train/swift
 */

// 21:09 done :D
```


