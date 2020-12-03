//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


// Write a func to count how many palindromes are in a sentance


func palindromeCounts(_ sentance: String) -> [String: Int] {
    var countDict = [String: Int]()
    
    let arr = sentance.lowercased().components(separatedBy: " ")
    
    for word in arr {
        if isPalindrome(word) {
            countDict[word] = (countDict[word] ?? 0) + 1
        }
    }
    
    return countDict
}



func isPalindrome(_ word: String) -> Bool {
    var palindString = ""
    for char in word.lowercased() {// raceca
        palindString = String(char) + palindString // acecar
    }
    if palindString == word.lowercased() {
        return true
    }
    
    return false
}

isPalindrome("Racecar")

let sentance = "Civic madam kayak madam kayak anna racecar anna anna racecar civic"

print(palindromeCounts(sentance))
