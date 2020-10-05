//: [Previous](@previous)

import Foundation

//Shift Zeros
//Given an array of numbers, reset the array to put all the non-zero numbers in front of all the zeros in the array, then return the new array and the count of non-zero numbers.
//Input: [3,2,1,0,4,0, 0, 0]      Output:  [3,2,1,4,0,0,0,0], 4
  
func shiftZeros(_ input: [Int]) -> ([Int], Int) {
    var output = [Int]()
    var count = 0
    for num in input {
        if num != 0 {
            output.append(num)
        } else if num == 0 {
            count += 1
        }
        
        }
    if count > 0 {
    for _ in 1...count {
    output.append(0)
        }
    }
    
    return (output, count)
}
print(shiftZeros([3,0,2,0,0,1,0,4]))

func shiftZerosInOut(_ arr: inout [Int]) -> ([Int], Int) {
    var count = 0
    
    var index = 0 // first pointer
    var endPointer = arr.count - 1 // second pointer
    
    while index < endPointer {
        if arr[index] == 0 {
            arr.remove(at: index)
            arr.append(0)
            count += 1
            endPointer -= 1
        } else {
            index += 1
        }
    }
    return (arr, count)
}

var array = [3,0,2,0,0,1,0,4]
print(shiftZerosInOut(&array))


func matchingNums(arr1: [Int], arr2: [Int]) -> [Int] {
    var output = [Int]()
    let set1 = Set(arr1)
    let set2 = Set(arr2)
    
    for num in set1 {
        if set2.contains(num) {
            output.append(num)
        }
    }
    return output
}

print(matchingNums(arr1: [1, 2, 3, 3, 4], arr2: [3, 4, 5]))

var arrr = [1,1,2,2,3,3,3,4,4,4,4,5,5]
var dict = [Int: Int]()

for num in arrr {
    dict[num] = (dict[num] ?? 0 ) + 1
}
print(dict)
