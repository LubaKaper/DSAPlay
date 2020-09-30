//: [Previous](@previous)

import Foundation

// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// Example:
// Given nums = [2, 7, 11, 15], target = 9,
// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1]
print("hi")

func sum(arr: [Int], target: Int ) -> [Int] {
  var result = [Int]()
for each in 0...arr.count - 2 {
let next = each + 1
  for num in next...arr.count - 1 {
    if arr[each] + arr[num] == target {
      result.append(each)
      result.append(num)
      break
    }
  }
  
}
return result
 
}
var nums = [2, 7, 11, 15]


var tar = 9
print( sum(arr: nums, target: tar))


//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var indices = [Int]()
////    var newTarget = Int()
//    for j in 0..<nums.count {
//        for i in 0..<nums.count where j != i {
//          // 'where j != i' does't allow the the index to compare itself
//            if nums[j] + nums[i] == target {
//                print("\(nums[j]) + \(nums[i]) = \(target)")
//                indices.append(j)
//                indices.append(i)
//                print(indices)
//                return indices
//            }
//        }
//    }
//    return [0,0]
//}
//
//let nums = [2,7,7,13,14]
//let target = 200
//// output: [0, 1]
//print(twoSum(nums, target))
var str = "jhfkwejh"
//str.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
