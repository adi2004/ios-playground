//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
let x = Date().timeIntervalSince1970

print("x = \(x)")

for i in 1 ... 1_000_000 {
    Date().timeIntervalSince1970
}

let y = Date().timeIntervalSince1970

print("y = \(y), delta \(y-x)")
//: [Next](@next)
