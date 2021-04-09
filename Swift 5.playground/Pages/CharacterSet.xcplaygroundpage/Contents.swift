//: [Previous](@previous)

import Foundation

var str = "Hello, playground șță//32kdd  fsafkjal uß##iore"

fileprivate extension String {
    var sanitized: String {
        let alfanumerics = CharacterSet.alphanumerics.union(CharacterSet.whitespaces)
        return components(separatedBy: alfanumerics.inverted)
            .joined()
    }
}

print(str.sanitized)
//print(str.inverted)

//: [Next](@next)
