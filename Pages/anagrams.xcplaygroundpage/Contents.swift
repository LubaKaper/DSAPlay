//: [Previous](@previous)

import Foundation


//Fun with Anagram problem from HackerRank


func funWithAnagrams(text: [String]) -> [String] {
    var output = [String]()
    //var pointer = 0
    for word in text {
        for i in 0..<text.count {
            if word != text[i] && !output.contains(word) {
                if compare(str1: word, str2: text[i]) {
                    output.append(text[i])
                    
                }
            }
        }
    }
    let resultArray = Array(Set(text.filter { !output.contains($0)})).sorted()
    
    return resultArray //text.filter { !output.contains($0)}.sorted()
    //{ $0 = !output.contains($0)}           //output.sorted()
}


func compare(str1: String, str2: String) -> Bool {
    
    if String(str1.sorted()) == String(str2.sorted()) {
        return true
    }
    return false
}

let array = ["code","aaagmnrs","anagrams","doce"] // output: ["code","aaagmnrs"]
print(funWithAnagrams(text: array))
print(compare(str1: "aabb", str2: "bbaa"))

//append to new array and instead of removing from last array, replace it with something, empty string maybe

// map, compact map?
