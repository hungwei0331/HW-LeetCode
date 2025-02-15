/*
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left
 subtree
  of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  
 Example 1:
 Input: root = [2,1,3]
 Output: true
 
 Example 2:
 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// DFS
// TC: O(n), SC: O(h)
class Solution {
    var prev: TreeNode? = nil
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return inorder(root)
    }
    
    func inorder(_ node: TreeNode?) -> Bool {
        guard let node = node else { return true }
        
        if !inorder(node.left) { return false }
        
        if let prev = prev, node.val <= prev.val {
            return false
        }
        
        prev = node
        
        return inorder(node.right)
    }
}

// BFS
// TC: O(n), SC: O(n)
class Solution1 {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        var queue = [(node: TreeNode, min: Int?, max: Int?)]()
        queue.append((root, nil, nil))
        
        while !queue.isEmpty {
            let (node, min, max) = queue.removeFirst()
            
            if let min = min, node.val <= min  { return false }
            if let max = max, node.val >= max  { return false }
            
            if let left = node.left {
                queue.append((left, min, node.val))
            }
            
            if let right = node.right {
                queue.append((right, node.val, max))
            }
        }
        return true
    }
}
