//: [Previous](@previous)

import Foundation

func phoneNumber(_ input: String) -> String {
    var output = ""
    let digits = "1234567890"
    for char in input {
        if digits.contains(char) {
            output.append(char)
        }
    }
  var arr = Array(output)
    arr.insert("(", at: 0)
    arr.insert(")", at: 4)
    arr.insert("-", at: 8)
    return String(arr)
}

print(phoneNumber("75yytur998nn434"))

var str = "1234"
var arr = Array(str)
print(arr)
