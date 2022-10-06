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

//Runtime: 4 ms, faster than 68.08% of Swift online submissions for Binary Tree Inorder Traversal.
//Memory Usage: 14.2 MB, less than 40.84% of Swift online submissions for Binary Tree Inorder Traversal.

/*
 Step1. merge nums2 to nums1
 Step2. sort num1 after merged
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        helper(root, result: &result)
        return result
    }

    func helper(_ node: TreeNode?, result: inout [Int]) {
        guard let node = node else { return }
        helper(node.left, result: &result)
        result.append(node.val)
        helper(node.right, result: &result)
    }
}
    
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */


























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
