//: [Previous](@previous)

import Foundation



func categorySuggestions(categories: [String], projects: [String], k: Int) -> [[String]] {
   
    var suggestion = [String]()
    var suggestions = [suggestion]
    var arrOfTuples = [(String, String, Double?)]()
    
    for combination in categories {
      let array =  combination.components(separatedBy: ",")
        let tupleWithDouble = (array[0], array[1], Double(array[2]) ?? 0)
        arrOfTuples.append(tupleWithDouble)
    }
   
    let sortedCategories = arrOfTuples.sorted { $0.2 ?? 0 > $1.2 ?? 0 }
    
    for project in projects {
        suggestion.append(project)
    for categorie in sortedCategories {
        
        if categorie.0 == project {
            suggestion.append(categorie.1)
            
            suggestions.append(suggestion)
        } else if categorie.1 == project {
            suggestion.append(categorie.0)
            suggestions.append(suggestion)
        }
    }
        suggestions.append(suggestion)
        
       
        
    }
    let suggestionsNeeded = suggestions.prefix(k)
    let output = Array(suggestionsNeeded.prefix(projects.count))
    

    
    return output
}

let categories = [
    "House Painting,Interior Painting,0.9",
    "Handyman,Massage Therapy,0.1",
    "Handyman,House Painting,0.5",
    "House Painting,House Cleaning,0.6",
    "Furniture Assembly,Handyman,0.8",
    "Furniture Assembly,Massage Therapy,0.1",
    "Plumbing Drain Repair,Junk Removal,0.3"
  ]
let projects = ["House Painting", "Handyman"]

let k = 3

print(categorySuggestions(categories: categories, projects: projects, k: k))
