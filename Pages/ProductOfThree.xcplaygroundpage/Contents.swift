//: [Previous](@previous)

import Foundation

// https://leetcode.com/problems/maximum-product-of-three-numbers/
// https://github.com/joinpursuit/Pursuit-Core-DSA/blob/master/problems/ArrayProblems/ProductOfThree.md
/*
 Given an array of at least three integers, return the largest product you can get by multiplying three numbers together.
 Input                 Output
 [3, 5, 1, 2, 8]       120
 [-10, -4, 2, 3, 5]    200
 All postivies:
    - get product of largest three
 All negative OR Mixed:
    - Multiply the smallest 2 and the largest
 */
func productOfThree(_ nums: [Int]) -> Int {
    let count = nums.count
    let sortedNums = nums.sorted()
    // [-10, -4, 2, 3, 5]
    // [1, 2, 3, 5, 8]
    // [-10, -5, -4, -3, -2] // -24, -100
    // if all postivies OR the largest numbers are positive OR all negative - get product of largest three
    let product1 = sortedNums[count - 1] * sortedNums[count - 2] * sortedNums[count - 3]
    // mixed with the largest numbers being negative- multiply the smallest 2 and the largest
    let product2 = sortedNums[0] * sortedNums[1] * sortedNums[count - 1]
    return max(product1, product2)
}
productOfThree([3, 5, 1, 2, 8]) // 120
productOfThree([-10, -4, 2, 3, 5]) // 200
 
