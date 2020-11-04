//: [Previous](@previous)

import Foundation

//You are given a string containing characters  and  only. Your task is to change it into a string such that there are no matching adjacent characters. To do this, you are allowed to delete zero or more characters in the string.
//
//Your task is to find the minimum number of required deletions.
//
//For example, given the string , remove an  at positions  and  to make  in  deletions.

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

print(alternatingCharacters(s: "AAABBBAAA"))
