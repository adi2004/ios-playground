//: [Previous](@previous)

import Foundation

func timeConversion(s: String) -> String {
    let df12 = DateFormatter()
    df12.dateFormat = "hh:mm:ssa"
    let date = df12.date(from: s) ?? Date()
    
    let df24 = DateFormatter()
    df24.dateFormat = "HH:mm:ss"
    
    return df24.string(from: date)
}

Date()

print(timeConversion(s: "11:11:00PM"))

//: [Next](@next)
