//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

enum Status: Int8 {
    case enabled = 1
    case disabled = 0
}

var consentStatus: Int8 = 1

let isActive = consentStatus as! Status//: Status = Status(rawValue: consentStatus) ?? .disabled

switch isActive {
case .enabled:
        print("Yes")
case .disabled:
        print("No")
}

//: [Next](@next)
