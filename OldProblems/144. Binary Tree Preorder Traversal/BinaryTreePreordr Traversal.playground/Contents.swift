/*
 Given the root of a binary tree, return the postorder traversal of its nodes' values.
 */

/*
 Example 1:
 
 Input: root = [1,null,2,3]
 Output: [3,2,1]
 
 Example 2:
 
 Input: root = []
 Output: []
 
 Example 3:
 
 Input: root = [1]
 Output: [1]
 */

//Runtime: 11 ms, faster than 12.62% of Swift online submissions for Binary Tree Preorder Traversal.
//Memory Usage: 13.7 MB, less than 97.20% of Swift online submissions for Binary Tree Preorder Traversal.

/*
 NLR
 Step1. Recursively traverse the current node's left subtree.
 Step2. Visit the current node.
 Step3. Recursively traverse the current node's right subtree.
 */

import Foundation

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
    
class Solution {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        helper(root, result: &result)
        return result
    }
    
    func helper(_ node: TreeNode?, result: inout [Int]) {
        guard let node = node else { return }
        result.append(node.val)
        helper(node.left, result: &result)
        helper(node.right, result: &result)
    }
}

