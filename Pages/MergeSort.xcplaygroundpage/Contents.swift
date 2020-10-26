//: [Previous](@previous)

import Foundation

// merge sort

// 2 parts

// divide and conquer
// mergesort using recursion
// 2 parts of recursive function
// 1. base case
// 2. recursive call
func mergeSort(_ arr: [Int]) -> [Int] {
    // base case
    guard arr.count > 1 else {
        return arr
    }
    // 1. middle index
    let middleIndex = arr.count / 2
    
    // 2 - use divide and conquer to split array in halves => runtime O(log n)
    let leftArr = mergeSort(Array(arr[..<middleIndex]))
    let rightArr = mergeSort(Array(arr[middleIndex...]))
    
    // 4 - merge elements while sorted
    return merge(leftArr: leftArr, rightArr: rightArr)
}

// merge sorted array

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var result = [Int]()
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < leftArr.count && rightIndex < rightArr.count {
        let leftElement = leftArr[leftIndex]
        let rightElement = rightArr[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if rightElement < leftElement {
            result.append(rightElement)
            rightIndex += 1
        } else { // if equl, add both elements
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    // add remaining elements if any
    if leftIndex < leftArr.count{ // values we have not seen
        result.append(contentsOf: leftArr[leftIndex...])
        
    }
    if rightIndex < rightArr.count {
        result.append(contentsOf: rightArr[rightIndex...])
    }
    
    
    return result
}

// TODO: convert to generic

let result = mergeSort([-3, 5, 0, 5, 8, 4, 1])

print(result)
