import UIKit


//NEED TO FINISH
/*
Given a string str, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.

We repeatedly make duplicate removals on the input until we no longer can.
*/

// only letters in a string. could be empty
// input string. output straing
// example: "bcdefkk"
// sudo
func removeDupliucates(str: String) -> String {
  let strArray = Array(str)
  var strOutput = String()
  var index1 = 0
  var index2 = 1

  while index2 < str.count {
    if strArray[index1] != strArray[index2] {
     strOutput.append(strArray[index1])
     index1 += 1
    index2 += 1
    } else {
      index1 += 2
      index2 += 2
    }
    
  }
  return strOutput
}

print(removeDupliucates(str: "aabbccbrrjkl")) // expected: bjkl
