//: [Previous](@previous)

import Foundation

//The reverse and add function starts with a number, reverses its digits, and adds the reverse to the original. If the sum is not a palindrome, repeat this procedure until it does.

//Write a program that takes number and gives the resulting palindrome (if one exists). If it took more than 1,000 iterations (additions) or yield a palindrome that is greater than 4,294,967,295, assume that no palindrome exist for the given number.
// do we know that the inpt is never negative?

func reverseAndAddandGetPalindrome(input: Int, count: Int = 0) -> (Int, Int) {
    if input < 10 {
        return (input, 1)
    }
    var count = count
    
    let sum = input + reverseDigits(num: input)

    
    if sum > 4294967295 || count > 1000 {
        print("No palindrome exist")
        return (-100, count)
    }
    count += 1
    if sum == reverseDigits(num: sum) {
       
        return (sum, count)
    } else {
        
        return  reverseAndAddandGetPalindrome(input: sum, count: count)
    }
    
}

//helper function
func reverseDigits(num: Int) -> Int {
    let strNum = String(String(num).reversed())
    
    return Int(strNum) ?? 0
}



print(reverseAndAddandGetPalindrome(input: 195))


func isNumPalindrome(num: Int) -> Bool {
    if num == reverseDigits(num: num) {
        return true
    }
    return false
}
//print(isNumPalindrome(num: 122))
// 195 + 591 = 786
// 786 + 687

func reverseAndAdd(num: Int)  {
    var sum = num + reverseDigits(num: num)
    var count = 1
    while sum != reverseDigits(num: sum) && sum < 4294967295 && count < 1000 {
        
       sum += reverseDigits(num: sum)
        count += 1
    }
    print("hi")
    if sum > 4294967295 || count > 1000 {
        print("not a palindrom", count)
         
    } else {
        print(sum, count)
    }
    
}

reverseAndAdd(num: 196)
