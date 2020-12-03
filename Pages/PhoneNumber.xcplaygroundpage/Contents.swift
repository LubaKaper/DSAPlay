//: [Previous](@previous)

import Foundation

func phoneNumber(_ input: String) -> String {
   // var arrCopy = Array(input)
    guard !input.isEmpty else {
        return ""
    }
    var output: [Character] = ["("]
    let digits = "1234567890"
    for char in input {
        if digits.contains(char) {
            output.append(char)
            if output.count == 5 {
                output.insert(")", at: 4)
                output.insert(contentsOf: " ", at: 5)
            } else if output.count == 10 {
                output.insert("-", at: 9)
            } else if output.count == 14 {
                break
            }
        }
    }
//  var arr = Array(output)
//    arr.insert("(", at: 0)
//
//    arr.insert("-", at: 8)
    return String(output)
}
//(123) 767-9999
print(phoneNumber("75yytur998nn4347777777"))
















var str = "1234"
var arr = Array(str)
print(arr)

func areSame(_ a: Int, _ b: Int) -> Bool{
    if a - b == 0 {
        return true
    }
    return false
}
areSame(2, 2)
