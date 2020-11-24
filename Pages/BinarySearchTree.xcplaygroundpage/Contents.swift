//: [Previous](@previous)

import Foundation

// Binary Seatch Tree

// Restrictions:
// 1. values in the left of root have to be less then root
// 2. value in the right -> greater then root
// We are assumoing no duplicates in the tree

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

// function to search for a given value in a binary search tree BST

func search(_ treeNode: BinaryTreeNode?, _ value: Int) -> Bool {
    
    //1. check if the tree is empty
    guard let treeNode = treeNode else {
        return false
    }
    // 2. if value equal to the root, return true
    if treeNode.value == value {
        return true
    }
    // 3. check left subtree if value is less then root value
    if value < treeNode.value { // go to the left recursively
       return search(treeNode.leftChild, value)
        
    }
    // 4. navigate to the right, if va;lue is greater then the root
    if value > treeNode.value {
        return search(treeNode.rightChild, value)
    }
    return false // value does not exist in a tree
}

// write a func to return max height or depth of a binary tree

/*
        10
       /  \
     7     13
   /  \   /  \
  5    9 11   16
               \
               20
 height = 4
 max(3,4) = 4
*/

func maxHeight(_ treeNode: BinaryTreeNode?) -> Int {
    guard let _ = treeNode else {
        return 0
    }
    var leftHeight = 0
    var rightHeight = 0
    if let leftChild = treeNode?.leftChild {
        leftHeight = maxHeight(leftChild)
    }
    if let rightChild = treeNode?.rightChild {
        rightHeight = maxHeight(rightChild)
    }
    // we start counting from 1, which represents the root
    
    return 1 + max(leftHeight, rightHeight)
}

// THIS IS SHORTER VERSION OF THE SAME FUNCTION. HAVE TO BE ABLE TO UNDERSTAND IT
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

func maxDepth(_ treeNode: BinaryTreeNode?) -> Int {
    guard let _ = treeNode else {
        return 0
    }
    return 1 + max(maxDepth(treeNode?.rightChild), maxDepth(treeNode?.leftChild))
}

let rootNode = insert(nil, 10)
insert(rootNode, 7)
insert(rootNode, 13)
insert(rootNode, 5)
insert(rootNode, 9)
insert(rootNode, 11)
insert(rootNode, 16)
insert(rootNode, 20)
// in-order traversal validates a Binary Tree is a BST
inOrderTraversal(rootNode) // 5 7 9 10 11 13 16

search(rootNode, 6)

maxHeight(rootNode)

// Not Balanced Binary Search Tree
// Write  function to chech if BST id Balanced
// Hint: use the difference of the height of the left and right subtree, result should not be greater then 1
// Ex. height of left
// You can use an AVL tree to ensure the Binary Tree is alvays balanced
