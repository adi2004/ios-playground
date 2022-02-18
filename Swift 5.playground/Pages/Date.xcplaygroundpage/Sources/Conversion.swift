import Foundation

///Given a time in
///
///-hour AM/PM format, convert it to military (24-hour) time.
///
///Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
///- 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.

func timeConversion(s: String) -> String {
    // Write your code here
    return s
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!
//
//guard let s = readLine() else { fatalError("Bad input") }
//
//let result = timeConversion(s: s)
//
//fileHandle.write(result.data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)


