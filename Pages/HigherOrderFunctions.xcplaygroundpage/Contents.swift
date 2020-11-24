//: [Previous](@previous)

import Foundation

// .map works on a colllections and performs a given transformation on each element and returns a new collection.

let values = [1,2,3,4,5]

let transformedValues = values.map { $0 % 2 == 0 }

let multipyBy2 = values.map { $0 * 2 }

let multiplyByItself = values.map { $0 * $0 }
print(multiplyByItself)

print(multipyBy2)
print(transformedValues)
