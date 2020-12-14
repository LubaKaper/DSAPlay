//: [Previous](@previous)

import Foundation




func bestPros(pros: [[Int]], k: Int) -> [Int] {
    
    var returnArr = [Int]()
    var maxDistance = 0
    var distanceValues = [Int()]
    var arrOfScores = [Int]()
    
    for tuple in pros {
        distanceValues.append(tuple[0])
    }
    maxDistance = distanceValues.max() ?? 100
    
    for tuple in pros {
        let score = (maxDistance - (tuple[0])) * tuple[1]
        arrOfScores.append(score)
    }
    print(arrOfScores)
    let sortedTuples = arrOfScores.enumerated().sorted { $0.1 > $1.1 }
    print(sortedTuples)
    
    for tuple in sortedTuples {
     
        returnArr.append(tuple.offset)
        
    }
    
    
    let pros = Array(returnArr.prefix(k))
    
    return pros

}
print(bestPros(pros: [[5, 4], [4, 3], [6, 5], [3, 5]], k: 2))

//let arr = [4, 6, 0, 15]
//let result = arr.enumerated().sorted { $0.1 > $1.1 }
//print(result)
//
//let (topIndex, top) = result[0]
//print((topIndex, top))

var tuple = [1, 2]

//tuple.append(contentsOf: repeatElement(3, count: 2))
print(tuple.first ?? 0)
print(tuple[0])


func maxDepth(_ s: String) -> Int {
        var result = 0, depth = 0
        for char in s {
            switch char { // "((()))()"
                case "(": depth += 1; result = max(result, depth)// depth 2, result 2
                case ")": depth -= 1 // depth 0 result 1
                default: break
            }
        }
        return result
    }

print(maxDepth("(("))



func balancedStringSplit(_ s: String) -> Int {
        
        // Case Handling 1
        guard !s.isEmpty else { return 0 }
        
        // Output count
        var rlCount = 0
        
        // An counrter to observe whether RL count is achived
        var isBalancedAchived = 0
        //RLRRLLRLRL
        for char in s {
            if char == "R" {
                isBalancedAchived += 1 //2
            } else {
                isBalancedAchived -= 1//0
            }
            
            if isBalancedAchived == 0 {
                rlCount += 1 //
            }
        }
        
         return rlCount
    }
