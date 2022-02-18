//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

String(str.reversed())

var rev = ""
for l in str {
    rev = String(l) + rev
}

rev

str.utf8.indices //unicodeScalars[3] = '3'


var output = ""
var line = ""
for _ in 0...100 {
    line += "·"
    output += line + "\n"
}
for _ in 0...100 {
    line = String(line.dropLast())
    output += line + "\n"
}

print(output)

//part4()
print(isAbc("abc"))
//: [Next](@next)
