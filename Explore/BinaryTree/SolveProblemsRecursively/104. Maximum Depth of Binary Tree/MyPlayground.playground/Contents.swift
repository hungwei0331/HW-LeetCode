/*
 Given the root of a binary tree, return its maximum depth.
 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 
 Example 2:
 Input: root = [1,null,2]
 Output: 2
 */

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// Recursive
// TC: O(n) SC: O(h), wich h is tree height
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var left = maxDepth(root.left)
        var right = maxDepth(root.right)
        
        return max(left, right) + 1
    }
}

// Iteratively
// TC: O(n) SC: O(n)
class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue = [TreeNode]()
        var depth = 0
        
        queue.append(root)
        
        while !queue.isEmpty {
            var level = queue.count
            depth = depth + 1
            
            for _ in 0..<level {
                let node = queue.removeFirst()
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return depth
    }
}
