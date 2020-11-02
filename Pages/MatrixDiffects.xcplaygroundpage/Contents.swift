//: [Previous](@previous)

import Foundation

//Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area


func largestArea(samples: [[Int]]) -> Int {
    
    guard samples.count > 0 && samples[0].count > 0 else { return 0 }
    
    // creating square of just zeros
        var square = Array(repeating: Array(repeating: 0, count: samples[0].count), count: samples.count)
    print(square)
        var maxLength = 0
        
        for i in 0..<samples.count { //0..<4
            for j in 0..<samples[0].count { //0..<4
                // when first col or row, set value manually
                // because all those cells are not bottom right cell of any given square, and we need bottow right because all the other cells are already filled up
                if i == 0 || j == 0 {
                    square[i][j] = samples[i][j]
                   // print(square)
                   // print(samples[i][j])
                }
                // if needed, accumulate max edge value, and store the value at bottom-right point from a 2*2 square for future calculation
                    // to set bottom right, we need to see min of all the other cells in a square and add 1, and if all of the the same, then we getting the sqare filled up with 1's
                else if samples[i][j] == 1 { // has to be if else here because we do not want to loop second time through matrix and get wrong results
                    square[i][j] = min(square[i-1][j], square[i][j-1], square[i-1][j-1]) + 1
                     print(square)
                }
                maxLength = max(maxLength, square[i][j])
               // print("maxLength: \(maxLength)")
               // print("square: \(square[i][j])")
            }
        }
        return maxLength
    }
    
let matrix = [[1,1,0,0],
              [0,1,1,1],
              [0,1,1,1],
              [1,1,1,1]]

print(largestArea(samples: matrix))

//[[1, 1, 0, 0],
// [0, 1, 1, 1],
// [0, 1, 2, 2],
// [1, 1, 2, 3]]



func maxSquare(matrix: [[Int]]) -> Int {
    
    var maxArea = 0
    
    var square = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if i == 0 || j == 0 {
                square[i][j] = matrix[i][j]
            } else if matrix[i][j] == 1 { // if squre[i][j] = 1
                square[i][j] = min(square[i-1][j], square[i][j-1], square[i-1][j-1]) + 1
                if square[i][j] > maxArea {
                    maxArea = square[i][j]
                }
            }
           // maxArea = max(maxArea, square[i][j])
        }
    }
    
    return maxArea
}

//print(maxSquare(matrix: matrix))

