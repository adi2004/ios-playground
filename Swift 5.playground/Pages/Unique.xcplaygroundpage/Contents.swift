//: [Previous](@previous)

import Foundation

func test(input: String) -> Character? {
    var dictionary: [Character : (index: Int, appearance: Int)] = [:]
    
    for (index, letter) in input.enumerated() { //
        if let a = dictionary[letter] {
            dictionary[letter] = (index: index, appearance: a.appearance + 1)
        } else {
            dictionary[letter] = (index: index, appearance: 1)
        }
    }
    
    dictionary = dictionary.filter({ $0.value.appearance == 1 })
    if let char = dictionary.sorted(by: { $0.value.index < $1.value.index }).first?.key {
        return char
    }
    
    return nil
}

func findFirst(_ str: String) -> Character? {
    var unique = Set<Character>()
    var duplicate = Set<Character>()
    var order = [Character]()
    order.contains("c")
    for (_, c) in str.enumerated() {
        if unique.contains(c) {
            duplicate.insert(c)
            unique.remove(c)
            order = order.filter { $0 != c }
        } else if !duplicate.contains(c) {
            unique.insert(c)
            order.append(c)
        }
    }
    
    return order.first
}

var greeting = "llopplayground"

print(findFirst(greeting))

print(test(input: greeting))

//: [Next](@next)
