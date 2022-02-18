import Foundation

public func isAbc(_ str: String) -> String {
    var f = str.first!
    for s in str {
        if s.lowercased() >= f.lowercased() {
            f = s
        } else {
            return String(s)
        }
    }
    return String("True")
}



