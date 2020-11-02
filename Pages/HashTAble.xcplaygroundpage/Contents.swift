//: [Previous](@previous)

import Foundation

// Lesson resource: https://github.com/alexpaul/Hash-Table
// implementing a Hash Table aka Dictionary
// keys need to conform to Hashable
// collision: happens when two values share the same index
// collsion resolution: in our example we will use "chaining"
// "chaining" data structure we will be using is an array but a linked list can also be used
// we will calculate the index to store our key,value pair using abs(hashValue % buckets.count) e.g -4 abs(-4) => (4)
struct Stack<T> {
}

// subcript
// assert
// typealias
// private(set)
// abs(-5) => 5
// hashValue -> swift builtin  hash function is HashValue
// access control/modifier: private, public...
// accessors subscript (set{}, get{})
struct HashTable<Key: Hashable, Value> { // String: Fellow
  private typealias Element = (key: Key, value: Value)
  private typealias Bucket = [Element] // chain of elements
  private var buckets: [Bucket] // data structure for the Hash Table
  
  // setter of count is private
  // getter of count is public
  private (set) public var count = 0
  
  // allow the user of our HashTable API to
  // specify the capacity of the HashTable
  init(capacity: Int) {
    // if capacity is 4 => [],[],[],[]
    // protect against negative capacity we will assert
    assert(capacity > 0) // if not greater than 0, will crash
    buckets = Array(repeating: [], count: capacity)
  }
  
  // calculate which index (key,value) pair will be placed in
  private func index(for key: Key) -> Int {
    // "alex" => 3
    return abs(key.hashValue % buckets.count) // index 0, 1, 2 or 3
  }
  
  // update value
  public mutating func update(value: Value, for key: Key) -> Value? {
    // on every launch of the application
    // the index changes
    // this change and index value for key will be the same
    // index regardless of the function being used
    let index = self.index(for: key) // "alex" => 3
    
    // search if element exist in "chain"
    for (i, element) in buckets[index].enumerated() {
      if element.key == key { // "Netflix" : "Applied"
        let oldValue = element.value
        buckets[index][i].value = value // modifying our buckets array
        return oldValue
      }
    }
    
    // if element does not exist, add it
    let element = Element(key, value)
    buckets[index].append(element)
    count += 1
    return nil
  }
  
  // remove value
    public mutating func remove(for key: Key) -> Value? {
        let index = self.index(for: key)
        for(i, element) in buckets[index].enumerated() {
            if element.key == key {
                let removedValue = element.value
                buckets[index].remove(at: i)
                count -= 1
                return removedValue
            }
        }
        return nil
    }
  
  // value for key
    public func value(fot key: Key) -> Value? {
        let index = self.index(for: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
  
  // subscript // personDict[""]
  // accessors are getters and setters
  subscript(_ key: Key) -> Value? {
    set {
      // set has access to a "newValue" optional property
      if let value = newValue {
        update(value: value, for: key)
      } else { // if new value is nil then remove element
        // TODO: removeValue(for:)
        remove(for: key)
      }
    } get { // getter returns the value
      value(fot: key)    }
  }
}


var jobSearchDict = HashTable<String, String>(capacity: 5)
jobSearchDict.update(value: "Applied", for: "Netflix")
jobSearchDict["Betterment"] = "Applied"
print(jobSearchDict)

jobSearchDict["Stash"] = "Applied"
print(jobSearchDict)

//jobSearchDict.remove(for: "Stash")
jobSearchDict["Stash"] = nil
print(jobSearchDict)

if let status = jobSearchDict["Netflix"] {
    print("status fo Netflix is \(status)")
} else {
    print("value does not exist")
}

let companiesToApply = ["Elevate", "Wikipedia", "Hulu", "Soundcloud"]
// adding companies fromthe array to the jobsearchDict where the value is "Need to Apply"

for company in companiesToApply {
    jobSearchDict[company] = "Need to Apply"
}

print(jobSearchDict)
