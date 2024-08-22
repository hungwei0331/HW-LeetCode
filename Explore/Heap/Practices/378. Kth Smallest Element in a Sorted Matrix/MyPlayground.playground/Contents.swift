/*
 Given an n x n matrix where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 You must find a solution with a memory complexity better than O(n2).

 Example 1:
 Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 Output: 13
 Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
 
 Example 2:
 Input: matrix = [[-5]], k = 1
 Output: -5
 */

// TC: O(X+Klog(X)) where X = min(K, N),  SC:O(X)

import HeapModule

struct HeapNode: Comparable {
    var value: Int
    var row: Int
    var col: Int
    
    
    init(value: Int, row: Int, col: Int) {
        self.row = row
        self.col = col
        self.value = value
    }
    
    static func < (lhs: HeapNode, rhs: HeapNode) -> Bool {
        return lhs.value < rhs.value
    }
}

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var minHeap = Heap<HeapNode>()
        for i in 0..<matrix.count {
            minHeap.insert(HeapNode(value: matrix[i][0], row: i, col: 0))
        }
        
        var reuslt = 0
        for i in 0..<k {
            let node = minHeap.removeMin()
            reuslt = node.value
            
            if node.col < matrix.count - 1 {
                let nextNode = HeapNode(value: matrix[node.row][node.col + 1], row: node.row, col: node.col + 1)
                minHeap.insert(nextNode)
            }
        }
        return reuslt
    }
}
