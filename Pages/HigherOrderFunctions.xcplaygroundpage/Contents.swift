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


 // .sorted
// compares and sorts elemenents a sequence using a given predicate.

//let values2 = [3, 1, 4, 2]
let sortedValues = values2.sorted { $0 > $1 }
print(sortedValues)


  //  .flatMap
//concatenates the elements of a given sequence

// let values = [1,2,3,4,5]
let mappedValue = values.map { Array(repeating: $0, count: $0) }
print(mappedValue) // [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

// if we do not want an array of arrays like `map` gave us then we use `flatMap` as below
// `flatMap` will flatten the transformed results into one sequence by concatenated each result
let concatenatedValues = values.flatMap { Array(repeating: $0, count: $0) }
print(concatenatedValues) // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

let cities =  Set([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]])
let flattenedCites = cities.flatMap { $0 }
print(flattenedCites) // ["Lima", "Sao Paulo", "New York", "Lima", "London", "New York"]


//Write a function called multiples(of:in) that takes in an array of Ints and returns all of the Ints that are a multiple of a given number n. Use filter in your function.
func multiplesOf(_ num: Int, _ arr: [Int]) -> [Int] {
   // var copy = arr
    let output = arr.filter { $0 % num == 0 }
    return output
    
}

print(multiplesOf(3, [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]))


//Write a function called largestValue(in:) that finds the largest Int in an array of Ints. Use reduce to solve this exercise.

func largestValue(_ arr: [Int]) -> Int {
    arr.reduce(Int.min) { (currentResult, currentValue) -> Int in
        if currentValue > currentResult {
            return currentValue
        }
        return currentResult
    }
}
