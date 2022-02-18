//
//  main.swift
//  cmd_sha256
//
//  Created by adrian.florescu on 08.07.2021.
//

import Foundation
import CryptoKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }
    var hexStr: String {
        bytes.map { String(format: "%02X", $0) }.joined()
    }
    
    func startBytes(_ bytes: [UInt8]) -> Bool {
        for (i, b) in bytes.enumerated() {
            if self.bytes[i] != b {
                return false
            }
        }
        return true
    }
}


func find(_ message: String, prefix pref: [UInt8]) {
    var i = 0
    while true {
        let str = message + " \(arc4random())"
        guard let data = str.data(using: .utf8) else { return }
        let digest = SHA256.hash(data: data)
        
        if digest.startBytes(pref) {
            print("Found! for \(str) hash is: \(digest.hexStr), after \(i) tries")
            break;
        } else {
            i += 1
            if i % 100_000 == 1 {
                print("i = \(i), \(Date())")
            }
        }
    }
}

find("hello world", prefix: [0xad, 0x10])
