# History

## Apple
* 

## Chris Lattner (1978-)
* works at Google, Tesla, Apple
* University of Portland, Oregon (OS Dev. DYNIX)
* creator of LLVM - platform independent Swift, Obj-C D, Go, Rust compilator
* written in C++
* develepment started in July 2010 (JS just 10 days :D)
* one of the fastest growing languages in history

## Swift versions
* 2/6/2014 released (WWDC first Swift app)
* 9/9/2014 Swift 1.0 (strings are collections)
* 21/9/2015 Swift 2.0
* 13/9/2016 Swift 3.0 (are not)
* 19/9/2017 Swift 4.0 (are again)
* 17/9/2018 Swift 4.2
* waiting for Swift 5 in early 2019 :D



## WWDC
* began 1987 in Santa Clara
* $ 1599 USD, onlie loterry
* WWDC 2018 - 6000 attendees

* 1991 - Quick Time
* 1996 - Open Doc
* 2008 - App Store (delivered as software update)
* 2012 - Apple Maps
* 2018 - iOS 12


## xCode

* supports Swift, Objective-C, Objectiv C++,  C, C++, Java, AppleScript, Python, Ruby
* version 1.0 - fall 2003
* 10.0 - fall 2018, drops support for 32-bit Mac Apps
* interface builder 2008

### LLVM
* written in C++
* development started at 2000 at the university of Illions - Cris Lattner
* he posted questions about Objective-C, later got attention of Apple

### Cocoa
* written in C, C++, Objective-C, Swift
* Cocoa: Foundation, AppKit (Mac)
* Cocoa Touch: UIKit (iOS)

**Layers:**
* Cocoa Touch
* Media / Application Services
* Core Servies
* Core OS / Kernel


# DATA TYPES

## Basic and numeric Values
```swift
struct Bool {}
struct Int {}
struct Double {}
struct Float {}
struct Range {}
struct ClosedRange {}
protocol Error {} - type representing Error that can be thown
enum Optional {} - type representing wrapped value / nil - has to be unwrapped
```

## Strings
```
struct String {}
struct Character {}
enum Unicode {}
struct staticString {}
```

## Collections
```swift
struct Array {}
struct Dictionary {}
struct Set {}
protocol OptionSet {}
(strides, ranges, sequence, zip, collection of one, emptyCollection, DictionaryLiteral
```

## Basic behaviors
```swift
 protocol Comparable, Equatable, Codable, Encodable, Decodable, Encoder, Decoder, Expressable by Array literal
```


# Operators
* **unary**: prefix or postfix (!b or b!)
* **binary** infix (between targets) (1 + 1)
* **ternary** on 3 targets (a ? b : c)

```swift
var a = 10
var b = 20
a = b // a is 10

let m = -a
let also = +a // - 10

let (x, y) = (1, 2)

let res = (3, "apple") < (3, "bird") // true (apple is less than bird)
print(res)

let allow = true
let row = allow ? 20 : 30
print(row)
```
