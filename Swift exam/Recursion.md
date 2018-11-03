## Recursion

```swift
func f(n: Int) -> Int {
    if n == 1 {
        return 1
    } else {
        return n * f(n: n - 1) // f(n) returns lowered "n" which take place of the n in the LEFT side of multiplication
    }
}


f(n: 3)

/*
| fact(3)         multiplies 3 * 2 received from "fact(2)"  ^
|   fact(2)       multiplies 2 * 1 received from "fact(1)"
|       fact(1)   returns 1 up (beacuse of condition)
|
ˇ
 any recurive algorithm can be written in non-recursive way
 calls are not finished, when we call them first
 */


func nrf(n:Int) -> Int {
    var r = 0;
    for i in 0..<n{
        r *= i
    }
    return r
}
```
