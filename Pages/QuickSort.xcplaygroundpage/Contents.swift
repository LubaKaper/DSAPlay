//: [Previous](@previous)

import Foundation

//using Pivot

// Quick Sort
// first part is using Lomoto

func lomotoPartitioning(_ arr: inout [Int], low: Int, high: Int) -> Int {
    // Steps of Lomoto
    //1. Use last element of thr pivot
    // 2. Iterate the array with i and j variables
    // 3. if element at j is less then the pivot then swap i and j, increment i and j
    // 4. if element at j is greater then the pivot increment j only
    // 5. swap i and the high indices
    // 6. Return i, new pivot to evide array using recursion
    var i = low
    //1
    var pivot = arr[high]// last element
    //2
    for j in low..<high {
        //3
        if arr[j] <= pivot {
            // swap
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    // 6
    return i
}

// second part is using recursion to break up array into subarrays while sorting in place
func quickSort(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivot = lomotoPartitioning(&arr, low: low, high: high)
        quickSort(&arr, low: low, high: pivot - 1)
        
        quickSort(&arr, low: pivot + 1, high: high)
    }
    
}
