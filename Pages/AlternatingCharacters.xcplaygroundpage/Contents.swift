//: [Previous](@previous)

import Foundation

func alternatingCharacters(s: String) -> Int {
    let inputArr = Array(s)
    var newArr = [Character]()
    
    for index in 0..<inputArr.count - 1  {
        if inputArr[index] != inputArr[index + 1] && newArr.last != inputArr[index] {
            newArr.append(inputArr[index])
            newArr.append(inputArr[index + 1])
           print(newArr)
        }
    }
    return newArr.count
}

print(alternatingCharacters(s: "AAABBB"))
