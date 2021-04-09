//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

public var response: String = ""
var solutions: [Int] = []

let v = InputView()
v.view.frame = CGRect(x: 0, y: 0, width: 240, height: 64)
PlaygroundPage.current.liveView = v.view

// generate all possible solutions

for s in 1023...9876 {
    if s.isValid {
        solutions += [s]
    }
}

func filter() {
    let number = Int(response.substring(to: 4))!
    let guess = response.substring(from: 4).uppercased()
    print("Nr: \(number), guess: \(guess)")
    solutions = solutions.filter { s in
        return s.matches(number, guess)
    }
}

extension Int {
    var isValid: Bool {
        var digits: Set = Set<Int>()
        var nr = self
        while nr > 0 {
            digits.insert(nr%10)
            nr = nr / 10
        }
        return digits.count == 4
    }
    
    func digits() -> [Int] {
        var digits: [Int] = []
        var num = self
        
        digits.append(num % 10)
        
        while num >= 10  {
            num = num / 10
            digits.append(num % 10)
        }
        
        return digits.reversed()
    }
    
    func matches(_ nr: Int, _ guess: String) -> Bool {
        let secret = self.digits()
        let userNr = nr.digits()
        var computedGuess = ""

        for (index, nr) in secret.enumerated() {
            if userNr.contains(nr) && userNr[index] == secret[index] {
                computedGuess += "H"
            }
        }
        
        for (index, nr) in secret.enumerated() {
            if userNr.contains(nr) && userNr[index] != secret[index] {
                computedGuess += "C"
            }
        }
        return computedGuess == guess
    }
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

class InputView: UIViewController {
    var textField = UITextField(frame: CGRect(x: 20, y: 20, width: 200, height: 24))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.backgroundColor = .gray
        textField.placeholder = "Guess here ####HHCC"
        textField.backgroundColor = .white
        textField.delegate = self
    }
}

extension InputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        response = textField.text!
        print("User guess: \(response)")
        textField.text = ""
        filter()
        print("Solutions count: \(solutions.count), \(solutions)")
        return false
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
