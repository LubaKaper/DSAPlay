//: [Previous](@previous)

import Foundation

// .map
// works on a colllections and performs a given transformation on each element and returns a new collection.

let values = [1,2,3,4,5]

let transformedValues = values.map { $0 % 2 == 0 }

let multipyBy2 = values.map { $0 * 2 }

let multiplyByItself = values.map { $0 * $0 }
print(multiplyByItself)

print(multipyBy2)
print(transformedValues)


//.reduce
//takes an initial value and a closure that combines the previous result and current value to return a combined value.

let reduce = values.reduce(0, +)
print(reduce)


 // .compactMap
// returns non-nil values from a given transformation.

let mixedValue = ["true", "1", "0", "false", "false"]

let booleanValues = mixedValue.compactMap{ Bool($0)}
print(booleanValues)

// .filter
// takes a closure that operates as a predicate on the elements of a sequence and returns the results of the query.

let values2 = [3, 1, 4, 2]
let filteredValues = values2.filter { $0 > 2 }
print(filteredValues)
