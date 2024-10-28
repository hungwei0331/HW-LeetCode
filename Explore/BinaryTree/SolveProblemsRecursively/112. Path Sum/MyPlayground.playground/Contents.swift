/*
 Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

 A leaf is a node with no children.

  

 Example 1:
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 Output: true
 Explanation: The root-to-leaf path with the target sum is shown.
 
 Example 2:
 Input: root = [1,2,3], targetSum = 5
 Output: false
 Explanation: There are two root-to-leaf paths in the tree:
 (1 --> 2): The sum is 3.
 (1 --> 3): The sum is 4.
 There is no root-to-leaf path with sum = 5.
 
 Example 3:
 Input: root = [], targetSum = 0
 Output: false
 Explanation: Since the tree is empty, there are no root-to-leaf paths.
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

// TC: O(n) SC: O(log(n))
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.left == nil && root.right == nil {
            return root.val == targetSum
        }
        
        let newTargetSum = targetSum - root.val
        return hasPathSum(root.left, newTargetSum) || hasPathSum(root.right, newTargetSum)
    }
}
