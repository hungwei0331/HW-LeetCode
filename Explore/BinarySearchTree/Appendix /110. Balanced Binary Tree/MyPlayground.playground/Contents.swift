/*
 Given a binary tree, determine if it is height-balanced.
 
 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: true
 
 Example 2:
 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 
 Example 3:
 Input: root = []
 Output: true
  
 Constraints:
 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104
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

// TC: O(NlogN), SC: O(H)
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        if abs(getHeight(root?.left) - getHeight(root?.right)) > 1 {
            return false
        }
        return isBalanced(root?.left) && isBalanced(root?.right)
    }
    
    func getHeight(_ node: TreeNode?) -> Int {
        if node == nil { return 0}
        return max(getHeight(node?.left), getHeight(node?.right)) + 1
    }
}
