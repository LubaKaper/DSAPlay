//: [Previous](@previous)

import Foundation

// Binary Seatch Tree

// Restrictions:
// 1. values in the left of root have to be less then root
// 2. value in the right -> greater then root
// We are assumoing no duplicates in the treee

// Implement Binary tree node


class BinaryTreeNode {
    var value: Int
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    init(_ value: Int) {
        self.value = value
    }
}

/*
        10
       /  \
     7     13
   /  \   /  \
  5    9 11   16
*/


// write a func to insert values in a BinarySearchTree(BST)

func insert(_ treeNode: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode? {
    //1. create new node
    let newNode = BinaryTreeNode(value)
    //2. if tree is empty new node becomes the root
    
    guard let _ = treeNode else {
        return newNode
    }
    //3. if value is less then root value, go left
    if value < treeNode!.value {
        if treeNode!.leftChild == nil {
            treeNode?.leftChild = newNode
            return treeNode
        } else {
            insert(treeNode?.leftChild, value)
        }
    }
    
    //4. if value is greater then greater go right
    if value > treeNode!.value {
        if treeNode!.rightChild == nil {
            treeNode?.rightChild = newNode
            return treeNode
        } else {
            insert(treeNode?.rightChild, value)
        }
    }
    
    return treeNode
}

// write a function that takes a binary tree node and prints its values
// using in-order traversal
// left, root, right

func inOrderTraversal(_ treeNode: BinaryTreeNode?) {
    guard let _ = treeNode else {
        return
    }
    if let leftChild = treeNode?.leftChild {
        inOrderTraversal(leftChild)
    }
    
    if let root = treeNode {
        print(root.value, terminator: " ") // makes print on one line
    }
    
    if let rightChild = treeNode?.rightChild {
        inOrderTraversal(rightChild)
    }
}

let rootNode = insert(nil, 10)
insert(rootNode, 7)
insert(rootNode, 13)
insert(rootNode, 5)
insert(rootNode, 9)
insert(rootNode, 11)
insert(rootNode, 16)
// in-order traversal validates a Binary Tree is a BST
inOrderTraversal(rootNode) // 5 7 9 10 11 13 16
