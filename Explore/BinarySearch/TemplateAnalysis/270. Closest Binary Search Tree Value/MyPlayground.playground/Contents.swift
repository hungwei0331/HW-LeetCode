/*
 Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target. If there are multiple answers, print the smallest.
 
 Example 1:
 Input: root = [4,2,5,1,3], target = 3.714286
 Output: 4
 
 Example 2:
 Input: root = [1], target = 4.428571
 Output: 1
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

// TC: O(H) SC: O(1)
class Solution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var closest = root?.val
        var currentNode = root
        
        while let node = currentNode {
            if abs(Double(node.val) - target) < abs(Double(closest!) - target) {
                closest = node.val
            } else if abs(Double(node.val) - target) == abs(Double(closest!) - target) {
                closest = min(node.val, closest!)
            }
            
            if target < Double(node.val) {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return closest!
    }
}
