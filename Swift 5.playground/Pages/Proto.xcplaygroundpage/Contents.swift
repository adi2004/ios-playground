//: [Previous](@previous)

import Foundation

protocol ActionDoer {
    func does()
}

extension ActionDoer {
    func does() {
        print("ActionDoer does")
    }
}

class Empty: ActionDoer {}

class Human: ActionDoer {
    func does() {
        print("Human does")
    }
}

class SuperHuman: Human {
    @objc dynamic override func does() {
        print("SuperHuman does")
    }
}

struct EmptyStruct: ActionDoer {}

struct Monkey: ActionDoer {
    func does() {
        print("Monkey does")
    }
}


var proto = Empty()
var human = Human()
var polyHuman: ActionDoer = Human()

proto.does()
human.does()
polyHuman.does()

var shuman = SuperHuman()
shuman.does()

var estruct = EmptyStruct()
estruct.does()

var monkey = Monkey()
monkey.does()


var polySuperH: Human = SuperHuman()
polySuperH.does()

//var polyHuman: SuperHuman = Human()
//polyHuman.does()

//: [Next](@next)
