import Foundation


func part1() {
    let str = "Hello, playground"
    String(str.reversed())
    str.utf8.indices //unicodeScalars[3] = '3'
}

func part2() {
    var rev = ""
    let str = "Hello, playground"
    for l in str {
        rev = String(l) + rev
    }
    rev
}

func part3() {
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
}

public extension String {
    /// Will unwrap the passed value to avoid Strings that become "Optional(value)". This will return "value" instead.
    init?<T>(unwrappedOrNil value: T?) {
        if let value = value {
            self.init(describing: value)
        } else {
            return nil
        }
    }
}

func part4() {
    struct Mgid {
        let value: String
    }
    

    let someMgid = Mgid(value: "arc:00")
    
    print("This is how struct Mgid looks like when printed: " + String(describing: someMgid))
    print("With extension: " + (String(unwrappedOrNil: someMgid) ?? "nil"))
}
