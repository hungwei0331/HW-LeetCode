/*
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.
 */

/*
 Example 1:
 
 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:
 
 Example 2:
 
 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
 
 */

//Runtime: 31 ms, faster than 65.73% of Swift online submissions for Convert Sorted Array to Binary Search Tree.
//Memory Usage: 15.1 MB, less than 23.00% of Swift online submissions for Convert Sorted Array to Binary Search Tree.

/*
 Step1. check nums is empty, if it is, return nil
 Step2. get middle value to make it as root, it will make tree equal balance tree
 Step3. recursive node.left and node .right
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        
        return helper(nums: nums, lowIndex: 0, heightIndex: nums.count - 1)
    }
    
    func helper(nums: [Int], lowIndex: Int, heightIndex: Int) -> TreeNode? {
        if lowIndex > heightIndex { return nil }
        
        let middleIndex = (lowIndex + heightIndex) / 2
        let treeNode = TreeNode(nums[middleIndex])
        treeNode.left = helper(nums: nums, lowIndex: lowIndex, heightIndex: middleIndex - 1)
        treeNode.right = helper(nums: nums, lowIndex: middleIndex + 1, heightIndex: heightIndex)
        
        return treeNode
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
