/*
 Given the root of a binary tree, return the inorder traversal of its nodes' values
 */

/*
 Example 1:
 
 Input: root = [1,null,2,3]
 Output: [1,3,2]
 
 Example 2:
 
 Input: root = []
 Output: []
 
 Example 3:
 
 Input: root = [1]
 Output: [1]
 */

//runtime: 29 ms, faster than 34.86% of Swift online submissions for Symmetric Tree.
//Memory Usage: 14 MB, less than 63.87% of Swift online submissions for Symmetric Tree.

/*
 Step1. check root is both empty, if it is, return true
 Step2. check tree1 empty, or tree2 root empty, if one of them is, return false
 Step3. recursive result t1 root equal t2 root,
        t1.left equal t2.right, t1.right equal t2.left
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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil {
            return true
        }
        
        if t1 == nil || t2 == nil {
            return false
        }
        return t1?.val == t2?.val && isMirror(t1?.left, t2?.right) && isMirror(t1?.right, t2?.left)
    }
}



























//class Solution {
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        helper(root, &result)
//        return result
//    }
//
//    func helper(_ node: TreeNode?,_ result: inout [Int]) {
//        guard let node = node else { return }
//        helper(node.left, &result)
//        result.append(node.val)
//        helper(node.right, &result)
//    }
//
//}
