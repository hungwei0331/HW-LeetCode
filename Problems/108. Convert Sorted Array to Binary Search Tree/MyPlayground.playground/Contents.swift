/*
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

 Example 1:
 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:
 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
  
 Constraints:
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
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


// TC: O(n), we visit each node exactly once.
// SC: O(logN), recursion stack requires O(logN) space because the tree is height-balanced.
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty { return nil }
        return helper(nums, 0, nums.count - 1)
    }

    func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let mid = (left + right) / 2

        let node = TreeNode(nums[mid])
        node.left = helper(nums, left, mid - 1)
        node.right = helper(nums, mid + 1, right)

        return node
    }
}
