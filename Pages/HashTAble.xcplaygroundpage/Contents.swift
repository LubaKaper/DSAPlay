//: [Previous](@previous)

import Foundation

// implement a HAshTAble aka Dictionary
// keys need to conform to HAshtable
// collision: happens when 2 values have the same index
// collision resolution: in our example we will use chaining
// chaining data structure we will be using is Array, but LinkeList also can be used
// we will calculate the index to store our key value pair using abs(hashValue % buckets.count) e g -4 abs(-4) => (4)

struct HashTable<Key: Hashable, Value> { // String: Fellow
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element] // chain of elements
    private var buckets: [Bucket] // data structure for the HAshTable
    
    // setter of count is private
    // getter of count is public
    private (set) public var count = 0
    
    // allow the user of our HashTAble API to specify capacity of the HAshTAble
    init(capacity: Int) {
        // [][][]
        // protect against negative capacity we will assert
        assert(capacity > 0) // will crash if not greater then 0
        buckets = Array(repeating: [], count: capacity)
    }
    // calculate which index key, value pair will be placed in
    private func index(for key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    // update value
    public mutating func update(value: Value, for key: Key) -> Value? {
        // on every lounch index changes
        //
        let index = self.index(for: key)
        
        // search if element exists in "chain"
        for (i, element) in buckets[index].enumerated() {
            if element.key == key { //"Netflix" : "Applied"
                let oldValue = element.value
                buckets[index][i].value = value // modifying our buckets. i - Element, value - value for a key
                return oldValue
            }
        }
        // if element does not exist, add it
        let element = Element(key, value)
        buckets[index].append(element)
        count += 1
        return nil
    }
    // subscript // person[""]
    subscript(_ key: Key) -> Value? {
        set {
            // access to a "newValue" optional property
            if let value = newValue {
                update(value: value, for: key)
            } else { // if newValue is nil, remove element
                // TODO: removeValue(for:)
                
            }
        } get {
            return nil // TODO: implement value(for:)
        }
    }
}

var jobSearchDict = HashTable<String, String>(capacity: 5)
jobSearchDict.update(value: "Applied", for: "Netflix")
jobSearchDict["Betterment"] = "Applied"
print(jobSearchDict)

//var dict = [String: Int]()

//let index = abs("luba".hashValue % 5) // assuming count is 5
//
//print(index)

let str = "jhfdwei lji"
//str.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)

//func pangrams(s: String) -> String {
//let alphabet = "abcdefghijklmnopqrstuvwxyz"
//let noSpaces = s.replacingOccurrences(of: " ", with: "")
//let set = Set(Array(noSpaces.lowercased()))
//if set.count == alphabet.count {
//    return "pangram"
//}
//return "not pangram"
//}
//
//print(pangrams(s: "We promptly judged antique ivory buckles for the prize"))



//print(array.sorted(by: <))

func funWithAnagrams(text: [String]) -> [String] {
    // Write your code here
   // var output = [String]()
    var index = 0
    var dict1 = [Character: Int]()
    var dict2 = [Character: Int]()
    var copyText = text
    
    while index < copyText.count - 1 {
        for char in copyText[index]{
            dict1[char] = (dict1[char] ?? 0) + 1
        }
        for char2 in copyText[index + 1] {
            dict2[char2] = (dict2[char2] ?? 0) + 1
        }
        if dict1 == dict2 { //"aaagmnrs","anagrams", "anagrams","code","doce"
            //output.append(copyText[index])
            copyText.remove(at: index + 1)// helper function
            areAnagrams(str1: copyText[index], str2: copyText[index + 1])
            //createDict(str: String)
           // continue
        } else {
            //output.append(copyText[index])
           // output.append(copyText[index + 1])
            index += 1
        }
        //index += 1
    }
    return copyText.sorted(by: < )
    
}
//print(funWithAnagrams(text: array))

func isThereAnagram(str: String, arr: [String]) -> Bool {
    for word in arr {
        if str.sorted() == word.sorted() {
            return true
        }
    }
    return false
}

func funWithAnagrams2(text: [String]) -> [String] {
    let textCopy = text
    
    for word in textCopy {
        if isThereAnagram(str: word, arr: textCopy) {
            
        }
    }
    
    return textCopy.sorted()
}

func createDict(str: String) -> [Character: Int] {
    var dict = [Character: Int]()
    for char in str {
        dict[char] = (dict[char] ?? 0) + 1
    }
    return dict
}

print(createDict(str: "ajhgfdjashgwa"))

func areAnagrams(str1: String, str2: String) -> Bool {
    var dict1 = [Character: Int]()
    var dict2 = [Character: Int]()
    for char in str1 {
        dict1[char] = (dict1[char] ?? 0) + 1
    }
    for char2 in str2 {
        dict2[char2] = (dict2[char2] ?? 0) + 1
    }
    return dict1 == dict2
   
}

//var newArr = String(array[0].sorted())
//var newStr = newArr.joined()

//print(newArr)


func compare(str1: String, str2: String) -> Bool {
    if String(str1.sorted()) == String(str2.sorted()) {
        return true
    }
    return false
}


func funWithAnagrams3(text: [String]) -> [String] { // ["code","aaagmnrs","anagrams","doce"]
   // var index = 0
    //var j = i + 1
    
    var textCopy = text
    var backCounter = textCopy.count - 1
   
    guard backCounter > 0 else {
        return text
    }
    
    for i in 0...backCounter { // 0...3
        for j in  1...backCounter  { // 1...3

            
            if compare(str1: textCopy[i], str2: textCopy[j]) {
                
                textCopy.remove(at: j)
                backCounter -= 1
            }
            
        
        }
         
    }
    return textCopy.sorted(by: <)

}

func funWithAnagrams4(text: [String]) -> [String] { // ["code","aaagmnrs","anagrams","doce"]
   // var index = 0
    //var j = i + 1
    let length = text.count
    let reversedText = text.reversed()
    var output = Array(reversedText)
    var count = 0
    for i in 0...length {
        if checkForAnagram(str: text[i], arr: text) {
            output.remove(at: 1 - count)
            count += 1
        }
    }
    
    return output.sorted(by: <)

}

func checkForAnagram(str: String, arr: [String]) -> Bool {
    for word in arr {
        if word.sorted() == str.sorted() {
            return true
        }
    }
    return false
}


let array = ["code","aaagmnrs","anagrams","doce"]
print(funWithAnagrams4(text: array))


