//: [Previous](@previous)

import Foundation


let str = "swift equates to $$ ? "

for char in str {
    if char.isLetter { // isLowecase, isPunctuation...
       // print(char)
    }
}



var happyMood = CharacterSet(charactersIn: "🥳🔥😀🍅🤓")
happyMood.insert("😎")
happyMood.insert("🚀")

let currentYear = "😬😩😹🥳"
//here we are iterating the elements of the currentYear String
//normallywe would be getting each element as a string.index or character data type
// however here we need to inspect the unicodeScalar of our happyMood CharacterSet
// iterate string and access unicode scalars
for unicodeScalar in currentYear.unicodeScalars {
    if happyMood.contains(unicodeScalar){
        print("\(unicodeScalar) happy")
    } else {
        print("\(unicodeScalar) sad")
    }
}

let sentence = "Hello World? Is anyone listening? Help!"

let strArr = sentence.components(separatedBy: .punctuationCharacters)

print(strArr)
var strippedPunctuation = strArr.joined()


let nameCharSet = CharacterSet(charactersIn: "Alex")

// isSubset
//alphanumercis = alphabets and numbers
nameCharSet.isSubset(of: .alphanumerics)

// isSuperset
//is "Alex"superset of "lex"
nameCharSet.isSuperset(of: CharacterSet(charactersIn: "lex"))

// disjoint(completely different)
CharacterSet(charactersIn: "wix").isDisjoint(with: nameCharSet)
CharacterSet(charactersIn: "swift").isDisjoint(with: nameCharSet)


//VALIDATION
var name = "Alex"
if CharacterSet(charactersIn: name).isSubset(of: CharacterSet.letters) {
  print("name comprises of only letters") // name comprises of only letters
} else {
  print("not a valid name")
}

var password = "alex1234"
if CharacterSet(charactersIn: password).isSubset(of: CharacterSet.alphanumerics) {
  print("valid password created") // valid password created
} else {
  print("not a valid password")
}
