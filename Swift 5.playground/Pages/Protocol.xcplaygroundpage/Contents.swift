//: [Previous](@previous)

import Foundation

protocol Beeing {
    var id: String { get }
}
protocol Person: Beeing {
    var name: String { get }
}

protocol Animal: Beeing {
    var nickname: String { get }
}

class Human: Person {
    var id: String = "human id"
    var name: String = "human name"
    
    init() {
        
    }
}

class Fish: Animal {
    var id: String = "fish id"
    var nickname: String = "fish nickname"
    
    init() {
        
    }
}

func doSth(_ person: Person) {
    print(person.id)
}

let human = Human()
let fish = Fish()

//doSth(fish)
//: [Next](@next)
