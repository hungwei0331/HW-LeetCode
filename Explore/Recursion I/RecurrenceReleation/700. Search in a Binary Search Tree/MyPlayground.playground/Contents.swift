/*
 You are given the root of a binary search tree (BST) and an integer val.

 Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

 Example 1:
 Input: root = [4,2,7,1,3], val = 2
 Output: [2,1,3]
 
 Example 2:
 Input: root = [4,2,7,1,3], val = 5
 Output: []
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

// TC: O(H), where H is a tree height
// SC: O(H) to keep the recursion stack
class Solution {
   func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
       func helper(_ node: TreeNode?, _ val: Int) -> TreeNode? {
           guard let node = node else { return nil }
           
           if node.val == val {
               return node
           }
           
           if val > node.val {
               return searchBST(node.right, val)
           } else {
               return searchBST(node.left, val)
           }
       }
       return helper(root, val)
   }
}
