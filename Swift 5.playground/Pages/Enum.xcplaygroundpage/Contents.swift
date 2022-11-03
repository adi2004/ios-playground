//: [Previous](@previous)

import UIKit

var str = "Hello, playground"

enum Status: Int {
    case enabled = 1
    case disabled = 0
}

var consentStatus: Int = 13

//let isActive = consentStatus as! Status//: Status = Status(rawValue: consentStatus) ?? .disabled

let isActive: Status = Status(rawValue: consentStatus) ?? .disabled

switch isActive {
case .enabled:
    print("Yes")
case .disabled:
    print("No / disabled")
//case .none:
//    print("None")
}


var currentStyle = UIUserInterfaceStyle(rawValue: 0) //?? .unspecified
//print("currentStyle 0", currentStyle?.rawValue)

currentStyle = UIUserInterfaceStyle(rawValue: Int.max)// ?? .unspecified
//print("currentStyle 7", currentStyle.rawValue)

switch currentStyle {
case .unspecified:
    print("unspecified")
case .light:
    print("light")
case .dark:
    print("dark")
//default:
//    print("default")
case .none:
    print("none")
case .some(let value):
    print("value.rawValue", value.rawValue, currentStyle == .some(value))
}

//currentStyle = UIUserInterfaceStyle(rawValue: 7) ?? .unspecified
//print("currentStyle 7", currentStyle.rawValue)




var layoutDir = UITraitEnvironmentLayoutDirection(rawValue: 0) //?? .unspecified
//print("currentStyle 0", currentStyle?.rawValue)

layoutDir = UITraitEnvironmentLayoutDirection(rawValue: Int.max)// ?? .unspecified
//print("currentStyle 7", currentStyle.rawValue)

switch layoutDir {
case .unspecified:
    print("unspecified")
case .leftToRight:
    print("leftToRight")
case .rightToLeft:
    print("rightToLeft")
//default:
//    print("default")
case .none:
    print("none")
case .some(let value):
    print("value.rawValue", value.rawValue, layoutDir == .some(value))
}

//: [Next](@next)
