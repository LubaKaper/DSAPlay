//: [Previous](@previous)

import Foundation




func bestPros(pros: [[Int]], k: Int) -> [Int] {
    
    var returnArr = [Int]()
    var maxDistance = 0
    var distanceValues = [Int()]
    var arrOfScores = [Int]()
    
    for tuple in pros {
        distanceValues.append(tuple.first ?? 0)
    }
    maxDistance = distanceValues.max() ?? 100
    
    for tuple in pros {
        let score = (maxDistance - (tuple.first ?? 0)) * tuple[1]
        arrOfScores.append(score)
    }
    
    let sortedTuples = arrOfScores.enumerated().sorted { $0.1 > $1.1 }
    
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
