//: [Previous](@previous)

import Foundation

func insertionSort(_ arr: inout [Int]) { // in place sorting , no additional rray is created
    for current in 1..<arr.count {
        guard arr.count > 1 else { return }
        for j in (1...current).reversed() { // doing it in reversed order
            if arr[j] < arr[j-1] {
                arr.swapAt(j, j-1)
            } else {
              break
            }
        }
    }
}

var inputArr = [10, -1, 7, 0, 1, -1, -7]

insertionSort(&inputArr)

print(inputArr)
