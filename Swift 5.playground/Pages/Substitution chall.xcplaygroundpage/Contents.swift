//: [Previous](@previous)

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

var str = "azurmvwdxnupwptpivupwpelurmvvfby  qkurtp  ryowjrxntvpfwpowry  wpmtelvf  krowvfvfupwdow  vftpjrjrowvfvfiztpivivtvby  zsupvf  mvurwp  wpurur  ryelizizeljrtpivwp  owelwpmtowxnvj  wxupvf  elwpde  zsowivivvj  wdururry  yrurcaby  epmvwpowxn  wpmtelvf  tcowtvwxurxnry  upvf  vfurivtpwpelurmvmf  mtvfivjrivelurowpfpfivmvby"

var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
var index = 0
var dict: [String:String] = [:]
var set = Set<String>()
str.count
for i in 0 ... str.count / 2 - 1 {
    let char = "\(str[i*2])\(str[i*2+1])"
    if char == "  " {
        dict[char] = " "
    } else if dict[char] == nil {
        dict[char] = "\(alphabet[index])"
        index += 1
    }
    print("\(dict[char] ?? "?")", terminator: "")
    if !set.contains(char) {
        set.insert(char)
    }
//    print("\(str[i*2])")
}


print()
print("\(set)")
print("\(dict)")

// solution: CONGRATULATIONS! YOU DECRYPTED THIS MESSAGE SUCCESSFULLY! WAS NOT TOO DIFFICULT EITHER, WAS IT? WELL, GOOD JOb! eNTER THIS KEYWORD AS SOLUTION: HSLCLIOEPPLN!
// alphabet: ABCDEFGHIJKLMNOPQRSTUVWXYZ01432, transpsition: AWCDEFGHIJ,LYNOP?RSTUMWC!Yob:Ke
//: [Next](@next
