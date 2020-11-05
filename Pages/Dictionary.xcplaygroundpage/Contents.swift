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
