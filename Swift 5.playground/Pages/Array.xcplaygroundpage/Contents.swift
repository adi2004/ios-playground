//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let abc = [1, 2, 3, 4, 5]


let x = abc.filter { $0 % 2 == 0 }

print("x: \(x.first)")


let strs = ["", nil, "http"]

let out = strs.filter { $0?.isEmpty == false }.first

print("out: \(out)")
//: [Next](@next)
