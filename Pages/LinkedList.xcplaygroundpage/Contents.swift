//: [Previous](@previous)

import Foundation

class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value  && lhs.next == rhs.next
    }
    
    var value: Int
    var next: Node?
    init(_ value: Int) {
        self.value = value
    }
}

func printNodeVAlues(node: Node?) {
    var node = node
    
    while let currentNode = node {
        print(currentNode.value, terminator: " ")
        node = currentNode.next
    }
}

var nodeOne = Node(1)
var nodeTwo = Node(2)
var nodeThree = Node(3)
nodeOne.next = nodeTwo
nodeTwo.next = nodeThree

//printNodeVAlues(node: nodeOne)


//Write a function to reverse values in a linked node (list)
func reverseList(_ node: Node?) -> Node? { // 1,2,3
  var node = node
    var previousNode: Node?
    var nextNode: Node?
    while let currentNode = node {
        nextNode = currentNode.next //2
        currentNode.next = previousNode//
        previousNode = currentNode
        node = nextNode
    }
    return previousNode
}

//printNodeVAlues(node: reverseList(nodeOne))


struct LinkedList {
    private var head: Node?
    private var tail: Node?
    var isEmpty: Bool {
        return head == nil
    }
    mutating func append(_ value: Int) {
        // create new node with value
        let newNode = Node(value)
        // if the list is empty create new node and add to the head and tail
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
        
        // if there are more values in the list, we need to have the last node oin t to the new node
        guard let lastNode = tail else {
            return
        }
        lastNode.next = newNode
        tail = newNode
    }
    
    func printList() {
        var head = self.head
        while let currentNode = head {
            print(currentNode.value)
            head = currentNode.next
        }
    }
   // Write a function to remove the last element from a linked list
    mutating func removeLast() -> Node? {
        if isEmpty {
            return nil
        }
        
        var removedNode: Node?
        
        if head == tail {
            removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        
        var currentNode = head
        while currentNode?.next != tail {
            currentNode = currentNode?.next
        }
        removedNode = tail
        tail = currentNode
        currentNode?.next = nil
        
        return removedNode
    }
}
var list = LinkedList()
list.append(5)
list.append(12)
list.append(0)
list.append(34)

list.printList()

func swap(_ a: inout Int,_ b: inout Int) {
    let temp = a
    a = b
    b = temp
    print(a, b)
}
 var a = 1
var b = 2
swap( &a, &b)

func swapWithTuples(_ a: inout Int,_ b: inout Int) {
    (a,b) = (b,a)
    print(a, b)
}
swapWithTuples( &a, &b)

func middleNode(_ head : Node?) -> Node? {
    guard head != nil else {
        return nil
    }
    var slow = head
    var fast = head
    while fast != nil && fast?.next != nil {// 1,2,3,4,5,6
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}

print(middleNode(nodeOne)?.value)
