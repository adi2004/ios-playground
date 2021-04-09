//: [Previous](@previous)

import Foundation

enum Salut {
    case greet(String)
}


let s = Salut.greet("ssssing...")

print(Salut.greet("abc"))
print("ola")
print("s: \(s)")

switch s {
case .greet(let x):
    print("you gretted with \(x)")
default:
    print("never go here")
}

if case .greet(let x) = s {
    print("val: \(x)")
}

//: [Next](@next)
