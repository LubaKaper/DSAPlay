//: [Previous](@previous)

import Foundation

let input = [[1, 3, 9, 2],
             [3, 2, 0, 3],
             [2, 8, 1, 4]]

print(input[0][0]) // top left
print(input[0][input[0].count - 1]) //top right
print(input[input.count - 1][0]) // bottom left
print(input[input.count - 1][input[input.count - 1].count - 1])// bottom right
func matrixSum(matrix: [[Int]]) -> Int {
    guard (matrix.first != nil) else {
    return 0
}

    let sumOfCorners = matrix[0][0] + matrix[0][matrix[0].count - 1] + matrix[matrix.count - 1][0] + matrix[matrix.count - 1][matrix[input.count - 1].count - 1]  // matrix[matrix.count - 1][matrix[0].count - 1] if we know for sure that matrix has equql heights/width
    
    
    let result = matrix.joined().reduce(0, +) - sumOfCorners

    return result
}


print(matrixSum(matrix: input))

func minNum(arr: [Int]) -> (min: Int, max: Int)? {
    
    guard let first = arr.first else  {
        return  nil
    }
    
    var minNum = first
    var maxNum = first
    
    for num in arr {
        if num > maxNum {
            maxNum = num
        }
        if num < minNum {
            minNum = num
        }
    }
    
    return (minNum, maxNum)
}

print(minNum(arr: [100, 2, 3, -4, -5]) ?? (0, 0))

