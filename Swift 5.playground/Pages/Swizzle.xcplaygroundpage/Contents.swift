//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

final class CoreFunctionality {
    @objc dynamic func doSth() {
        print("doing some CoreFunctionality")
    }
}

extension CoreFunctionality {
    @objc dynamic func _custom_doSth() {
        print("doing something custom before")
        _custom_doSth()
        print("doing something custom after")
    }
}

let selector1 = #selector(CoreFunctionality.doSth)
let selector2 = #selector(CoreFunctionality._custom_doSth)
let method1 = class_getInstanceMethod(CoreFunctionality.self, selector1)!
let method2 = class_getInstanceMethod(CoreFunctionality.self, selector2)!
method_exchangeImplementations(method1, method2)

let cf = CoreFunctionality()

cf.doSth()

//: [Next](@next)
