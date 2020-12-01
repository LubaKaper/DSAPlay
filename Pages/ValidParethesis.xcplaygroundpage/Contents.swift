//: [Previous](@previous)

import Foundation


func validParetheses(_ s: String) -> Bool {
    guard s.count % 2 == 0 else {
        return false
    }
    if s.count == 0 {
        return true
    }
     var stack = [Character]()
    for char in s {
        if char == "(" {
            stack.append(")")
        } else if char == "[" {
            stack.append("]")
        } else if char == "{" {
            stack.append("}")
        } else {
            if let top = stack.last {
                if char == top {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

validParetheses("([)]")


func maximumWealth(_ accounts: [[Int]]) -> Int {
        var arrOfWealth = [Int]()
        var sum = 0
        for account in accounts {
            for num in account {
                sum += num
            }
            arrOfWealth.append(sum)
        }
    return (arrOfWealth.sorted().last ?? 0)
    }



func runningSum(_ nums: [Int]) -> [Int] {
    var arr = [Int]()
    var sum = 0
    for n in nums{
        sum += n
        arr.append(sum)
    }
    return arr
}

print(runningSum([1,1,1,1,1]))

func defangIPaddr(_ address: String) -> String {
       
    let arr = address.components(separatedBy: ".").joined(separator: "[.]")
    return arr
    
}
print(defangIPaddr("1.1.1.1"))



var nums = [1,4,5,6,3,3,6,1,1,4]

let mappedItems = nums.map { ($0, 1) }
print(mappedItems)
