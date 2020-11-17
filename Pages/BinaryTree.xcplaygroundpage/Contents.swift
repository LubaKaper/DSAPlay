//: [Previous](@previous)

import Foundation

/*
        8
      /   \
     11    4
    /  \    \
   7   30    6
*/

//Implement Binary Tree
class BinaryTreeNode<T> {
    //properties
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(_ value: T) {
        self.value = value
    }
}


//Implement Queue

struct Queue<T> {
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var front : T? {
        return elements.first
    }
    
    public var count: Int {
        return elements.count
    }
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}

//Implement Breadth-First TRaversal
// expected output: 8 11 4 7 30 6

/*
        8
      /   \
     11    4
    /  \    \
   7   30    6
*/

func breadthFirstTraversal<T>(_ treeNode: BinaryTreeNode<T>?) {
    
    //1. create an instatnce of a queue to hold the nodes as we visit them
    var queue = Queue<BinaryTreeNode<T>>()
    // 2. guard to make sure tree has values
    guard let _ = treeNode else {
        return // Void
    }
    //3. print the root value
    print(treeNode!.value) // only because we guarded earlier
    
    queue.enqueue(treeNode!) // also safe because guarded
    
    // 5. use a 'while let' to dequeue the values of the traverse the tree
    // keep dequeueing elements until nil is returned from the dequeue() function
    while let node = queue.dequeue() {
        //6.
        if let leftChild = node.leftChild {
            // 6a
            // enqueue leftChold
            queue.enqueue(leftChild)
            print(leftChild.value)
        }
        if let rightChild = node.rightChild {
            queue.enqueue(rightChild)
            print(rightChild.value)
        }
    }
}

/*
        8
      /   \
     11    4
    /  \    \
   7   30    6
*/

let rootNode = BinaryTreeNode(8)
let elevenNode = BinaryTreeNode(11)
let fourNode = BinaryTreeNode(4)
let sevenNode = BinaryTreeNode(7)
let thirtyNode = BinaryTreeNode(30)
let sixNode = BinaryTreeNode(6)

rootNode.leftChild = elevenNode
rootNode.rightChild = fourNode
elevenNode.leftChild = sevenNode
elevenNode.rightChild = thirtyNode
fourNode.rightChild = sixNode

breadthFirstTraversal(rootNode)


// write a function to traverse a binary tree in-order recursively
// in-order: left, root, right

func inOrderraversal<T>(_ rootNode: BinaryTreeNode<T>?) {
    //1. visit left
    if let leftChild = rootNode?.leftChild {
        inOrderraversal(leftChild)
    }
    //2. print root
    if let root = rootNode {
        print(root.value)
    }
    //3. visit right
    if let rightChild = rootNode?.rightChild {
        inOrderraversal(rightChild)
    }
}

/*
        8
      /   \
     11    4
    /  \    \
   7   30    6
*/

inOrderraversal(rootNode)

// post-order traversal: left, right, root

func postOrderTraversal<T>(_ rootNode: BinaryTreeNode<T>?) {
    
    if let leftChild = rootNode?.leftChild {
        postOrderTraversal(leftChild)
    }
    if let rightChild = rootNode?.rightChild {
        postOrderTraversal(rightChild)
    }
    if let root = rootNode {
        print(root.value)
    }
}

postOrderTraversal(rootNode)


func preOrderTraversal<T>(_ rootNode: BinaryTreeNode<T>?) {
    if let root = rootNode {
        print("pre:\(root.value)")
    }
    
    if let leftChild = rootNode?.leftChild {
        preOrderTraversal(leftChild)
    }
    if let rightChild = rootNode?.rightChild {
        preOrderTraversal(rightChild)
    }
}
preOrderTraversal(rootNode)
