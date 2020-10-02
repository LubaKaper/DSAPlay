//: [Previous](@previous)

import Foundation

//At a lemonade stand, each lemonade costs $5.
//
//Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).
//
//Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill.  You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.
//
//Note that you don't have any change in hand at first.
//
//Return true if and only if you can provide every customer with correct change.
//
//func lemonadeChange(change: [Int]) -> Bool {
//
//    var fives = 0
//    var tens = 0
//
//    for bill in change {
//    switch bill {
//    case 5:
//        fives += 1
//    case 10:
//        fives -= 1
//        tens += 1
//    case 20:
//        if tens > 0 {
//        fives -= 1
//        tens -= 1
//        } else {
//            fives -= 3
//        }
//    default:
//        return false
//    }
//        guard fives >= 0 else {
//            return false
//        }
//    }
//
//    return true
//}
//
//print(lemonadeChange(change: [5,10,5,10,20]))

func lemonadeChange(change: [Int]) -> Bool {
    
    var fives = 0
    var tens = 0
    
    for bill in change {
        switch bill {
        case 5:
            fives += 1
        case 10:
            fives -= 1
            tens += 1
        case 20:
            if tens > 0 {
                tens -= 1
                fives -= 1
            } else {
                fives -= 3
            }
        default:
            return false
            
        }
        guard fives >= 0 else {
            return false
        }
    }
    
    return true
}

print(lemonadeChange(change: [10, 10]))
