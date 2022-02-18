//: [Previous](@previous)

import Foundation

let N = 5
//let N = Int(readLine()!)!

// first line
print("." + " ".c(2*N-2) + "*")
// first triangle
(1...N).filter { $0 > 1 }.map { print(" ".c(2*N-$0) + "*".c(2*$0-1)) }
// bottom 2 triangles
(1...N).map { print(" ".c(N-$0) + "*".c(2*$0-1) + " ".c(2*N-2*$0+1) + "*".c(2*$0-1)) }
// helper extension
extension String { func c(_ x: Int) -> String { String(repeating: self, count: x) } }


// first line
print("."+" ".c(2*N-2)+"*")
// first triangle
(1...N).filter{$0>1}.map{print(" ".c(2*N-$0)+"*".c(2*$0-1))}
// bottom 2 triangles
(1...N).map { print(" ".c(N-$0)+"*".c(2*$0-1)+" ".c(2*N-2*$0+1)+"*".c(2*$0-1))}
// helper extension
//extension String{func c(_ x:Int)->String{String(repeating:self,count:x)}}

//: [Next](@next)
