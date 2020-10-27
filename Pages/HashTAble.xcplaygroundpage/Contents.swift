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
