//: [Previous](@previous)

import Foundation

var applesDict: [String: Int] = ["Adam": 3,
                                 "Beth": 5,
                                 "Cal": 3,
                                 "Dan": 5,
                                 "Eve": 4]

//Set eveAppleCount equal to the number of apples that Eve has

let eveAppleCount = applesDict["Eve"]  ?? 0

print(eveAppleCount)

//Change the number of apples that Adam has to 4
 applesDict["Adam"] = 4

//Set calAndDanAppleCount equal to the sum of Cal and Dan
let calAndDanAppleCount = (applesDict["Cal"] ?? 0) + (applesDict["Dan"] ?? 0)

//Set all the values in applesDict to 0

applesDict.forEach { applesDict[$0.key] = 0 }

print(applesDict)


var citiesDict: [String: String] = ["Afghanistan": "Kabul",
                                    "Russia": "Moscow",
                                    "Iceland": "Reykjavik"]

  // Set russiaCapital equal to Russia's capital using citiesDict
 
let  russiaCapital = citiesDict["Russia"] ?? ""

//Add a new key value pair "Jamaica" and its capital "Kingston"

citiesDict["Jamaica"] = "Kingston"
print(citiesDict)


var authorScores:[String: Double] = ["Mark Twain": 8.9,
                                     "Nathaniel Hawthorne": 5.1,
                                     "John Steinbeck": 2.3,
                                     "C.S. Lewis": 9.9,
                                     "Jon Krakauer": 6.1]

authorScores["Erik Larson"] = 9.2


//You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the best score and print his full name.

var peopleWithScores: [[String: String]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": "13"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": "23"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": "10"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": "3"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": "16"
    ]
]

var highestScoringName = ""
var highestScore = 0

for scoreDict in peopleWithScores {
    if let scoreStr = scoreDict["score"],
        let score = Int(scoreStr),
         let firstName = scoreDict["firstName"],
        let lastName = scoreDict["lastName"] {
        if score > highestScore {
            highestScore = score
            highestScoringName = firstName + " " + lastName
        }
    }
    
}
print(highestScoringName)


//Write code below such that cubeDict maps the numbers between 1 and 20 inclusive to their cubes. A number's cube is that number multiplied by itself twice:

var cubeDict = [Int: Int]()

for num in 1...20 {
    cubeDict[num] = num * num * num
}
//print(cubeDict)


//Find the most common letter in the string below. Use a dictionary to generate your solution that maps a character to the number of times it appears in the string. Ignore whitespaces and capitalization.



let myString = "We're flooding people with information. We need to feed it through a processor. A human must turn information into intelligence or knowledge. We've tended to forget that no computer will ever ask a new question."

var frequencyDict = [Character: Int]()
var mostFrequentChar: Character = "?"


var newStr = myString.replacingOccurrences(of: " ", with: "").lowercased()


for char in newStr {
    frequencyDict[char] = (frequencyDict[char] ?? 0) + 1
}



var highestVAlue = 0
for(key, value) in frequencyDict {
    if value > highestVAlue {
        highestVAlue = value
        mostFrequentChar = key
    }
}
print(mostFrequentChar)

//for char in myString {
//  if !char.isWhitespace && !char.isUppercase {
//    if let count = frequencyDict[char] {
//      frequencyDict[char] = count + 1
//    } else {
//      frequencyDict[char] = 1
//    }
//  }
//}
//
//let maxElement = frequencyDict.max { $0.value < $1.value }
//mostFrequentChar = maxElement?.key ?? " "
//print(mostFrequentChar) // e


func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var count: Int = 0
        
        for jchar in J {
            for schar in S {
                if jchar == schar {
                    count += 1
                }
            }
        }
        
        
        return count
    
}


//Create a mutable array of characters from an input string.
//Create an immutable array of characters from an input string.
//Traverse through enumeration of an input indices array.
//Change every character with an appropriate value.
//Return mutated copy that converted to String type.


func restoreString(_ s: String, _ indices: [Int]) -> String {
    
    var output = Array(s)
    let s = Array(s)
    for (index, value) in indices.enumerated(){//"codeleet"
        output[value] = s[index]
    }
    return String(output)
}


class BinaryTreeNode {
  var value: Int
  var left: BinaryTreeNode?
  var right: BinaryTreeNode?
  init(_ value: Int) {
    self.value = value
  }
}

/*
        10
       /  \
     7     13
   /  \   /  \
  5    9 11   16
*/

// insert
@discardableResult
func insert(_ root: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode? {
  let newNode = BinaryTreeNode(value)
  guard let root = root else { return newNode }
  if value < root.value {
    if root.left == nil {
      root.left = newNode
    } else {
      return insert(root.left, value)
    }
  } else if value > root.value {
    if root.right == nil {
      root.right = newNode
    } else {
      return insert(root.right, value)
    }
  }
  return root
}

// in-order traversal
func inOrderTraversal(_ root: BinaryTreeNode?) {
  guard let root = root else { return }
  inOrderTraversal(root.left)
  print(root.value, terminator: " ")
  inOrderTraversal(root.right)
}

// search
func search(_ root: BinaryTreeNode?, _ value: Int) -> Bool {
  guard let root = root else { return false }
  if value == root.value {
    return true
  } else if value < root.value {
    return search(root.left, value)
  } else if value > root.value {
    return search(root.right, value)
  }
  return false
}

/*
        10
       /  \
     7     13
   /  \   /  \
  5    9 11   16
*/

@discardableResult
func delete(_ root: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode? {
  // 1.
  // the tree is empty
  guard let root = root else { return nil }
  
  // 2. - recursively call the left subtree
  if value < root.value { // go left
    root.left = delete(root.left, value)
  }
  
  // 3. - recursively call the right subtree
  else if value > root.value {
    root.right = delete(root.right, value)
  }
  
  // 4.
  else {
    // 5. - deleting a node with one child
    /*
      ex: deleting 7
     
             7           9
              \    =>
               9
     
     
                   10                10
                  /  \              /  \
                7     13    =>     9   13
                 \   /  \              /  \
                  9 11   16           11  16
    */
    if root.left == nil {
      return root.right
    } else if root.right == nil {
      return root.left
    }
    
    // 6.
    // 6a. - copy minimum value of the right subtree to the root
    root.value = minValue(root.right)
    
    // 6b. - delete the minimum node from the right subtree
    root.right = delete(root.right, root.value)
  }
  return root
}


func minValue(_ root: BinaryTreeNode?) -> Int {
  guard let root = root else { return 0 }
  if let left = root.left {
    return minValue(left)
  }
  return root.value
}

// test binary search tree functionality

/*
        10
       /  \
     7     13
   /  \   /  \
  5    9 11   16
*/

let rootNode = insert(nil, 10)
insert(rootNode, 7)
insert(rootNode, 13)
insert(rootNode, 5)
insert(rootNode, 9)
insert(rootNode, 11)
insert(rootNode, 16)

// test insert and in-order traversal
print("in-order traversal after inserting nodes")
inOrderTraversal(rootNode) // 5 7 9 10 11 13 16
print("\n")

// test search
print("searching...")
print(search(rootNode, 7)) // true
print(search(rootNode, 0)) // false


// test delete
print("deleting")
delete(rootNode, 10)
inOrderTraversal(rootNode) // 5 7 9 11 13 16


// Write a function that returns the parent node of a given value

/*
        10
       /  \
     7     13
   /  \   /  \
  5    9 11   16
*/

/*
Input: 5
Output: 7

Input: 10
Output: nil
*/

/*
if value == root return nil

if value is less than root
  look at root.left value and compare

else if value is greater than root
  look at root.right and compare
  else recursively call findParentNode
*/


func destCity(_ paths: [[String]]) -> String {
        // do double loop to get to each city
        // get the indexes for each city
        //build the dictionary dict[String: String]
        // dict["London": "New York", "New York": "Lima", "Lima": "Sao Paolo"]
        var dict = [String: String]()
    let cities = Set(paths.flatMap{$0}) // [A, Z] Set(paths.joined())
    print(cities)
        for arr in paths {
            dict[arr[0]] = arr[1]
            print(dict)
        }
        //[A:Z]
        for city in cities {
            // if city is not a key in the dictionary, return city
            if !dict.keys.contains(city) {
                return city
            }
            
        }
        return ""
    }

let paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
print(destCity(paths))
