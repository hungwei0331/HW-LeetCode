/*
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

 Example 1:
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 
 Example 2:
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
 Example 3:

 Input: root = [1,2], p = 1, q = 2
 Output: 1
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

// TC: O(n), where N is the number of nodes
// SC: O(n), This is because the maximum amount of space utilized by the recursion stack would be N since the height of a skewed binary tree could be N.
class Solution {
   func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       guard let root = root else { return nil }
       
       if root.val == p?.val || root.val == q?.val {
           return root
       }
       
       let left = lowestCommonAncestor(root.left, p, q)
       let right = lowestCommonAncestor(root.right, p, q)
       
       if left != nil && right != nil {
           return root
       } else if left != nil && right == nil {
           return left
       } else if  left == nil && right != nil {
           return right
       }
       return nil
   }
}
