/*
 Given the root of a binary tree, return its maximum depth.
 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 
 Example 2:
 Input: root = [1,null,2]
 Output: 2
  
 Constraints:
 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// DFS
// TC: O(N) SC: O(log(N))
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        
        return max(left, right) + 1
    }
}

// BFS
// TC: O(n) SC: O(n)
class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var depth = 0
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let levelSize = queue.count
            depth = depth + 1
            for _ in 0..<levelSize {
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
