//: [Previous](@previous)

import Foundation


//Linear Search O(n)
func linearSearch(_ nums: [Int], _ target: Int) -> Int {
    for (index, num) in nums.enumerated() {
        if num == target {
            return index
        }
    }
    
    return -1
}

linearSearch([-6, 2, 5, 9, 11, 45, 78], 2) // index 1 returned


//Binary search O(log n) -> much faster then O(n)
// Devide ond Conquer 

func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    
    var low = 0
    var high = nums.count
    
    while low < high {
        let middleIndex = low + (high - low) / 2
        if nums[middleIndex] == target {
            return middleIndex
        } else if nums[middleIndex] > target { // look left
            high = middleIndex
        } else { // look right
            low = middleIndex + 1
        }
    }
    
    return -1
}
binarySearch([-6, 2, 5, 9, 11, 45, 78], 2)
