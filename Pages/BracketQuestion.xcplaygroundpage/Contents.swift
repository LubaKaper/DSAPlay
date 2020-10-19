//: [Previous](@previous)

import Foundation

func isValid(_ s: String) -> Bool {
    var open = [UnicodeScalar]()
    if s.count == 0 { return true }
    if s.count == 1 { return false }
    for i in Array(s.unicodeScalars) {
        if i == "{" || i == "[" || i == "(" {
            open.append(i)
        } else {
            guard let chk = open.last?.value else { return false }
            if (chk+1 == i.value) || chk+2 == i.value {
                
                open.removeLast()
                print(open)
            } else {
                break
            }
        }
    }
    return open.isEmpty
}

print(isValid("([]})"))
