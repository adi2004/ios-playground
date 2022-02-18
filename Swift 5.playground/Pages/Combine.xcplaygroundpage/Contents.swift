//: [Previous](@previous)

import Foundation
import Combine

var numbers = (1 ... 5)
numbers.map { print($0) }

numbers.publisher.sink { print($0) }

let integers = (0...3)
integers.publisher
    .sink { print("Received \($0)") }


let hw = "Hello world!"

hw.publisher.sink { print($0) }
//: [Next](@next)
