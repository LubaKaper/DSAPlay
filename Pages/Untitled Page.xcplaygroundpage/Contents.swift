//: [Previous](@previous)

import Foundation


func inserionSort(_ unsortedArray: inout [Int]) -> [Int] {
    
    guard unsortedArray.count > 1 else {
        return unsortedArray
    }
    
    for index1 in 1..<unsortedArray.count {
        for index2 in (1...index1).reversed() {
            if unsortedArray[index2] < unsortedArray[index2 - 1] {
                unsortedArray.swapAt(index2, index2 - 1)
            } else {
                break
            }
        }
    }
    
    
    return unsortedArray
}

var arr = [3,2,5,1,8,5,67,87,98,44,33]

print(inserionSort(&arr))



// Given a sentence: "the cow jumped over the moon"
// N-gram: refers to a continuous sequence of N words from a sentence
// N is a parameter in the "N-gram"

// "the cow jumped over the moon"
// “the cow and the moon”

// If N=2, then the list of of unique 2-grams in these sentences are:
// “the cow”
// “cow jumped”
// “jumped over”
// “over the”
// “the moon”
// "cow and"
// "and the"

// IF N=3
// "the cow jumped "
// "cow jumped over"
// ...

// Given a list of reviews, we want the frequency of all N-grams, where N is a parameter. If we use the following reviews:
// Input:
// [ “the cow jumped over the moon”,
// “the cow and the moon”]
// And we use N=2, then the expected result is:

// Output:
// “the cow” ⇒ 2
// “cow jumped” ⇒ 1
// “jumped over” ⇒ 1
// “over the” ⇒ 1
// “the moon” ⇒ 2
// “cow and” ⇒ 1
// “and the” ⇒ 1

// lowercased
// no punctuation

import Foundation

// https://developer.apple.com/documentation/swift/array/1690077-joined

// [ “the cow jumped over the moon”,
// “the cow and the moon”]
func ngramFreq(arr: [String], n: Int) -> [String: Int] {
    
    var arrOfarr = [[String]]()
    var dictOfNgrams = [String: Int]()
    
    for str in arr {
        let separatedString = str.components(separatedBy: " ")
        arrOfarr.append(separatedString) // [“the ","cow ",jumped ","over", "the", " moon”]
        print(separatedString)
    }
    for arr in arrOfarr {
        for i in 0...arr.count - n {  // [“the ","cow ",jumped ", 3: "over", 4: "the", 5: " moon”] i -
            // n=3, i=4 -> oob
            // arr.count = 6
            // arr.count - n = 6 - 3 = 3
            // right now, i starts at 0, ends at 5 (arr.count - 1), n = 3
            // arr[i] = "the"
            
            let str = arr[i..<n].joined(separator: " ")
            
            dictOfNgrams[str] = (dictOfNgarms[str] ?? 0) += 1
            
            
            
        }
    }
    return dictOfNgrams
    
}
