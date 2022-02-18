//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"

func compute(_ input: Int, completion: @escaping (Int) -> Void) -> Int {
    var result = input * 10
    DispatchQueue.main.async {
        result += 10
        completion(result)
    }
    result += 100
    return result
}
let x = compute(0) { r in print(r) }
print(x)

let title = "https://What is tihs șs-=ĂÎ/@eE?ee"
let encoded = title.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
print(encoded)

//: [Next](@next)
