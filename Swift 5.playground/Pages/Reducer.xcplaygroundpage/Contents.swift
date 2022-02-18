//: [Previous](@previous)

import Foundation

let a = [1,2,3,4]
let b = ["a","b","c","d"]

var dict = [Int: String]()
zip(a,b).map { el in
    print(el)
    dict[el.0] = el.1
}

print(dict)
dict[5] ?? "e"
//
//reduce() { result, element in
//
//}
//}
//a.description.reduce() {  in
//    result[element] = b[
//}
//print(zip(a,b))

print("done")
//: [Next](@next)
