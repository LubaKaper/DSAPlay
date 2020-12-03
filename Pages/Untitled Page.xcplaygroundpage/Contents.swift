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
