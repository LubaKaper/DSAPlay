//: [Previous](@previous)

import Foundation

var numbers: Set = [1, 2, 3, 4, 5]

var oldValue = numbers.update(with: 7)

print(oldValue)
print(numbers)


//Does array have duplicates?

let arr = [1,1,1,2,3,3,4,5,5]

var uniqueNumbers: Set<Int> = []

for num in arr {
    let oldValue = uniqueNumbers.update(with: num)
    if oldValue != nil { // oldValue is nil if we havent seen the value before(chack line 7 nd 9)
        print("arr has dupes")
        break
    }
}

// intersection - commonality between collection
// common elements of two groups
let employeeOneProficientLanguages: Set = ["Java", "Kotlin", "C", "Python", "SQL", "Go", "Dart", "JavaScript"]
let employeeTwoProficientLanguages: Set = ["Swift", "Objective-C", "C", "Python", "JavaScript"]

let commonLanguages = employeeOneProficientLanguages.intersection(employeeTwoProficientLanguages)

print(commonLanguages)


// subtract
let dsaTopicsToStudy: Set = ["Big O Notation", "String", "Array", "Dictionary", "Set", "Character", "CharacterSet", "Stack", "Queue", "Linked List"]
let topicsCompleted: Set = ["Big O Notation", "String", "Array", "Dictionary", "Linked List"]

let topicsRemaining = dsaTopicsToStudy.subtracting(topicsCompleted)
print(topicsRemaining)


// symmetricDifference - unique to each collection combined
// genres we each uniquely know
let myGenres: Set = ["Soca", "Reggae", "Hip Hop", "Country", "Blues", "Jazz", "Funk", "Zouk"]
let yourGenres: Set = ["Hip Hop", "Reggae", "Folk", "Jazz", "Blues", "Hi-Life", "Techno", "House"]

let combinedniqueGenres = myGenres.symmetricDifference(yourGenres)

print(combinedniqueGenres)


// NSOrderSet and NSmutableOrderSet => Objective-C APIs

let dupes = [1,1,1,2,2,3,3,3,3,4] // array containing duplicates
let regularSet = Set(dupes)
print(regularSet)

let orderedSet = NSOrderedSet(array: dupes)
print(orderedSet)

// we cannot add to NSOrderedSet because it is inmutable
// in order to arr to an ordered set we need to use NSMutableOrderedSet

var mutableOrderedSet = NSMutableOrderedSet(array: dupes)

mutableOrderedSet.add(10)
mutableOrderedSet.insert(11, at: 3)
print(mutableOrderedSet)
