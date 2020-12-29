//: [Previous](@previous)

import Foundation

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var output = [[Int]]()
    var j = 0
   // while j < A.count {
    for arr in A {
        for (index, num) in arr.enumerated() {
            if num == 0 {
                //num == 1
                output[index].append(1)
                j += 1
            } else if num == 1 {
              // num == 0
                output[index].append(0)
                j += 1
            }
            print(output)
        }
    }
    //}
    return output
}

var array = [[1,1,0],[1,0,1],[0,0,0]]
print(flipAndInvertImage(array))
© 2020 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
