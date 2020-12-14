//: [Previous](@previous)

import Foundation

/*
          2
       /    \
      8      21
     / \    /  \
    10  16  30   36
*/
// inorder: 10, 8, 16, 2, 30, 21, 36
//level order: 2,8,21,10, 16, 30, 36

// Heap - is a tree data structure that is mainly used to create a min Heap or max Heap.
// Heap is implemented using an Array as oppposed to a Binary Tree that uses pointers to Left and Right Children
// The heap property is sutisfied when in a min heap the root is smaller then any of his children, in max heap root is larger then child nodes


/*
          2(0) <- index
       /    \
      8(1)  21(2)
     / \    /  \
10(3) 16(4)30(5)36(6)
*/

struct Heap {
    private var nodes = [2, 8, 21, 10, 16, 30, 36]
    
    // get the parent index
    public func parentIndex(_ index: Int) -> Int? {
       
        return (index - 1) / 2
    }
    
    public func leftChildIndex(_ index: Int) -> Int? {
       
        return 2 * index + 1
    }
    public func rightChildIndex(_ index: Int) -> Int? {
        
        return 2 * index + 2
    }
    
    public func parentValue(_ index: Int) -> Int? {
        guard index > 0 else { return nil }
        return nodes[parentIndex(index) ?? 0]
    }
    public func leftChildValue(_ index: Int) -> Int? {
        guard leftChildIndex(index) ?? 0 < nodes.count else { return nil }
        return nodes[leftChildIndex(index) ?? 0]
    }
    public func rightChildValue(_ index: Int) -> Int? {
        guard rightChildIndex(index) ?? 0 < nodes.count else { return nil }
        return nodes[rightChildIndex(index) ?? 0]
    }
    
    public func peek() -> Int? {
//        guard !nodes.isEmpty else { return nil }
//        return nodes[0]
        return nodes.first // .first returns optional, do not need to guard
    }
}

let minHeap = Heap()
print(minHeap.parentIndex(5))

print(minHeap.leftChildIndex(2))

print(minHeap.parentValue(3))

print(minHeap.rightChildValue(2))

print(minHeap.leftChildValue(6))

print(minHeap.rightChildValue(6))

print(minHeap.peek())
