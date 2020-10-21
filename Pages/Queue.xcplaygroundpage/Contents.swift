//: [Previous](@previous)

import Foundation

// create a Queue using LinkedList
struct Queue<T> {
    
    // data structure
    // needs to be optional when dequeueing in order to mark them  nil
    private var elements = [T?]()
    
    // "head" will be a pointer to the front of the queue
    private var head = 0 // default (index)
    //===============================================
    // properties
    //===============================================
    
    // count
    public var count: Int {
        return elements.count - head // if head moves and elements up front are nil. ex: [nil, nil, "Tim", "Josh", "Luba"] .count will be 5, head will be 2, 5 -2 is 3. We have 3 names here
    }
    
    // isEmpty
    public var isEmpty: Bool {
        return count == 0 // because everything can be nil, but not empty
    }
    
    // front
    public var front: T? {
        guard !isEmpty else {
            return nil
        }
        return elements[head]
    }
    
    //===============================================
    // initializers
    //===============================================
    
    //===============================================
    //methods(functions inside of an object)
    //===============================================
    
    // enqueue
    public mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    // dequeue
    @discardableResult // silences unused return value warnings
    public mutating func dequeue() -> T? {
        guard !isEmpty, let element = elements[head] else {
            return nil
        }
        // mark dequeued element nil
        elements[head] = nil
        // i ncrement head
        head += 1 // moved from 0 to 1
        
        // TODO: otimization to remove nil values
       // [nil, nil, "Tim", "Josh", "Luba"]
        // make a ratio of head / array count
        let percentage = Double(head) / Double(elements.count)
        if elements.count > 20 && percentage > 0.25 {
            elements.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

var queue = Queue<String>()
queue.enqueue("Josh")
queue.enqueue("Tim")
queue.enqueue("Bob")
queue.enqueue("Alison")
queue.enqueue("Ed")

queue.front // Josh

queue.isEmpty

queue.count

queue.dequeue()
queue.count

queue.dequeue()
queue.dequeue()

queue.dequeue()
queue.dequeue()

queue.count

queue.dequeue()

