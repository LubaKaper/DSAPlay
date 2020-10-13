//: [Previous](@previous)

import Foundation
//inout function
// inout word allow us to change variables outside the scope of the function
func swapTwoInts(int1: inout Int, int2: inout Int) {
  let temp = int1 // saved the value of int1 to avoid overriden it
    int1 = int2
    int2 = temp
}

var num1 = 4
var num2 = 13

print("Values of ints before swap is \(num1) \(num2)")

swapTwoInts(int1: &num1, int2: &num2)

print("Values of ints after swap is \(num1) \(num2)")

// Lets write 1 function that swaps any 2 elements
// generic function
// <T> is not tied to anything, but we use it due to conventions(Type)
func swapTwoValues<T>(value1: inout T, value2: inout T) {
  let temp = value1
    value1 = value2
    value2 = temp
}

var name1 = "Alex"
var name2 = "Paul"

print("Values  before swap are \(name1) \(name2)")
swapTwoValues(value1: &name1, value2: &name2)
print("Values  after swap are \(name1) \(name2)")


var arr = [45, 7, 0]
//arr.append("fellow") - THIS WILL NOT WORK
// Any is not type-safe(can have any type)
// Generic inforces type-safety
var arr2: [Any] = [45, 7, 0]
arr2.append("fellow")
