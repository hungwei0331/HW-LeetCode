/*
 Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

 Example 1:
 Input: n = 3
 Output: 5
 
 Example 2:
 Input: n = 1
 Output: 1
  
 Constraints:
 1 <= n <= 19
 */

// n = 5
// root: 1,  left: 0,  right: 4  numTrees(0) * numTrees(4)
// root: 2,  left: 1,  right: 3  numTrees(1) * numTrees(3)
// root: 3,  left: 2,  right: 2  numTrees(2) * numTrees(2)
// root: 4,  left: 3,  right: 1  numTrees(3) * numTrees(1)
// root: 5,  left: 4,  right: 0  numTrees(4) * numTrees (0)

// TC: O(N^2) SC: O(N)
class Solution {
    func numTrees(_ n: Int) -> Int {
        if n < 2 { return 1 }
        
        var numTree = Array(repeating: 0, count: n + 1)
        numTree[0] = 1
        numTree[1] = 1
        
        for nodes in 2...n {
            for root in 1...nodes {
                let left = root - 1
                let right = nodes - root
                let total = numTree[left] * numTree[right]
                numTree[nodes] += total
            }
        }
        return numTree[n]
    }
}
