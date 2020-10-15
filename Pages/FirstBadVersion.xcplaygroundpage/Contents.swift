//: [Previous](@previous)
import Foundation
/*
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
 Example 1:
 Input: n = 5, bad = 4
 Output: 4
 Explanation:
 call isBadVersion(3) -> false // good
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true
 Then 4 is the first bad version.
 Example 2:
 Input: n = 1, bad = 1
 Output: 1
 */
/**
 * The knows API is defined in the parent class VersionControl.
 *   func isBadVersion(_ version: Int) -> Bool{}
 */
/*
 Thoughts:
 - Using binary search to find the first bad version using the isBadVersion method on each element
 - input: is n: int and [1...n]
 - create an arr that will hold the values ^
 - use a low and high variable to store the range
 - find middle index using the range and check for badVersion
 - if its the badVersion { we check left } -> to check if it is indeed the first badVersion
 - else if its not { we check right }
 */
func isBadVersion(_ version: Int) -> Bool{
  if version >= 4 {
    return true
  }
  return false
}
func firstBadVersion(_ n: Int) -> Int {
  guard n > 1 else {
    return n // didnt help
  }
  let versions = Array(1...n) // [1, 2]
  var high = versions.count // 2
  var low = 0 // 0
  while low < high {
    let middleIndex = low + (high - low) / 2 // 1
    print("mid\(middleIndex)")
    print("low: \(low)")
    if isBadVersion(versions[middleIndex]) { // if true is a bad version
      if !isBadVersion(versions[middleIndex - 1]) {
        return versions[middleIndex] // base case
      } else {
        // check the left
        high = middleIndex // low = 3 : high = 3
      }
    } else { // its not a bad version
      // check the right
      low = middleIndex + 1
    }
  }
  return -1
}
firstBadVersion(5) // 4
