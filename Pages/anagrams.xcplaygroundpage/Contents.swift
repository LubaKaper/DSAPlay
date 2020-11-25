//: [Previous](@previous)

import Foundation


//Fun with Anagram problem from HackerRank


func funWithAnagrams(text: [String]) -> [String] {
    var output = [String]()
    //var pointer = 0
    for word in text {// text: ["code","aaagmnrs","anagrams","doce"]
        for i in 0..<text.count {
            if word != text[i] && !output.contains(word) {
                if compare(str1: word, str2: text[i]) {
                    output.append(text[i])//output:"doce","anagrams"
                    
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






func funWithAnagrams2(text: [String]) -> [String] {
    var remove = [String]()
    
    for word in text {
        for i in 0..<text.count {
            if word != text[i] && !remove.contains(word) {
                if compare(str1: word, str2: text[i]) {
                    remove.append(text[i])
                }
            }
        }
    }
    let output = Array(Set(text.filter { !remove.contains($0)})).sorted()
    
    return output
}



//func funWithAnagrams(text: [String]) -> [String] {
//    // Write your code here
//   // var output = [String]()
//    var index = 0
//    var dict1 = [Character: Int]()
//    var dict2 = [Character: Int]()
//    var copyText = text
//    
//    while index < copyText.count - 1 {
//        for char in copyText[index]{
//            dict1[char] = (dict1[char] ?? 0) + 1
//        }
//        for char2 in copyText[index + 1] {
//            dict2[char2] = (dict2[char2] ?? 0) + 1
//        }
//        if dict1 == dict2 { //"aaagmnrs","anagrams", "anagrams","code","doce"
//            //output.append(copyText[index])
//            copyText.remove(at: index + 1)// helper function
//            areAnagrams(str1: copyText[index], str2: copyText[index + 1])
//            //createDict(str: String)
//           // continue
//        } else {
//            //output.append(copyText[index])
//           // output.append(copyText[index + 1])
//            index += 1
//        }
//        //index += 1
//    }
//    return copyText.sorted(by: < )
//    
//}
////print(funWithAnagrams(text: array))
//
//func isThereAnagram(str: String, arr: [String]) -> Bool {
//    for word in arr {
//        if str.sorted() == word.sorted() {
//            return true
//        }
//    }
//    return false
//}
//
//func funWithAnagrams2(text: [String]) -> [String] {
//    let textCopy = text
//    
//    for word in textCopy {
//        if isThereAnagram(str: word, arr: textCopy) {
//            
//        }
//    }
//    
//    return textCopy.sorted()
//}
//
//func createDict(str: String) -> [Character: Int] {
//    var dict = [Character: Int]()
//    for char in str {
//        dict[char] = (dict[char] ?? 0) + 1
//    }
//    return dict
//}
//
//print(createDict(str: "ajhgfdjashgwa"))
//
//func areAnagrams(str1: String, str2: String) -> Bool {
//    var dict1 = [Character: Int]()
//    var dict2 = [Character: Int]()
//    for char in str1 {
//        dict1[char] = (dict1[char] ?? 0) + 1
//    }
//    for char2 in str2 {
//        dict2[char2] = (dict2[char2] ?? 0) + 1
//    }
//    return dict1 == dict2
//   
//}
//
////var newArr = String(array[0].sorted())
////var newStr = newArr.joined()
//
////print(newArr)
//
//
//func compare(str1: String, str2: String) -> Bool {
//    if String(str1.sorted()) == String(str2.sorted()) {
//        return true
//    }
//    return false
//}
//
//
//func funWithAnagrams3(text: [String]) -> [String] { // ["code","aaagmnrs","anagrams","doce"]
//   // var index = 0
//    //var j = i + 1
//    
//    var textCopy = text
//    var backCounter = textCopy.count - 1
//   
//    guard backCounter > 0 else {
//        return text
//    }
//    
//    for i in 0...backCounter { // 0...3
//        for j in  1...backCounter  { // 1...3
//
//            
//            if compare(str1: textCopy[i], str2: textCopy[j]) {
//                
//                textCopy.remove(at: j)
//                backCounter -= 1
//            }
//            
//        
//        }
//         
//    }
//    return textCopy.sorted(by: <)
//
//}
//
//func funWithAnagrams4(text: [String]) -> [String] { // ["code","aaagmnrs","anagrams","doce"]
//   // var index = 0
//    //var j = i + 1
//    let length = text.count
//    let reversedText = text.reversed()
//    var output = Array(reversedText)
//    var count = 0
//    for i in 0...length {
//        if checkForAnagram(str: text[i], arr: text) {
//            output.remove(at: 1 - count)
//            count += 1
//        }
//    }
//    
//    return output.sorted(by: <)
//
//}
//
//func checkForAnagram(str: String, arr: [String]) -> Bool {
//    for word in arr {
//        if word.sorted() == str.sorted() {
//            return true
//        }
//    }
//    return false
//}
//
//
//let array = ["code","aaagmnrs","anagrams","doce"]
//print(funWithAnagrams4(text: array))
