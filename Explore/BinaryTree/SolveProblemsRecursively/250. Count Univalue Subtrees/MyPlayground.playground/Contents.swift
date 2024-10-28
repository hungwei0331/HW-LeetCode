/*
 Given the root of a binary tree, return the number of uni-value
 subtrees.
 A uni-value subtree means all nodes of the subtree have the same value.

 Example 1:
 Input: root = [5,1,5,5,5,null,5]
 Output: 4
 
 Example 2:
 Input: root = []
 Output: 0
 
 Example 3:
 Input: root = [5,5,5,5,5,null,5]
 Output: 6
  
 Constraints:
 The number of the node in the tree will be in the range [0, 1000].
 -1000 <= Node.val <= 1000
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

// TC: O(n) SC: O(n)
class Solution {
    var count = 0
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        isUnivalueSubtree(root)
        return count
    }
    
    @discardableResult
    private func isUnivalueSubtree(_ node: TreeNode?) -> Bool {
        if node == nil { return true }
        
        let leftIsUnivalue = isUnivalueSubtree(node?.left)
        let rightIsUnivalue = isUnivalueSubtree(node?.right)
        
        if leftIsUnivalue, rightIsUnivalue {
            if let left = node?.left, left.val != node?.val {
                return false
            }
            if let right = node?.right, right.val != node?.val {
                return false
            }
            count += 1
            return true
        }
        return false
    }
}

