//: [Previous](@previous)

import Foundation

// write the func that takes in a string and return a bool.
//
// str.last
// str.prefix() 'cat' str.prefix(1) 'c'

func isThereAnA(input: String) -> Bool {
  
  guard !input.isEmpty else {
    return false
  }
  if input.last == "a" {
    return true
  } else {
    isThereAnA(input: input.removeLast())
  }
  return false
}
print(isThereAnA(input: "friday"))
