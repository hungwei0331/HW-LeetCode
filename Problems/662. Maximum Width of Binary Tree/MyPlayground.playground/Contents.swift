/*
 Given the root of a binary tree, return the maximum width of the given tree.

 The maximum width of a tree is the maximum width among all levels.

 The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.

 It is guaranteed that the answer will in the range of a 32-bit signed integer.

 Example 1:
 Input: root = [1,3,2,5,3,null,9]
 Output: 4
 Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).
 
 Example 2:
 Input: root = [1,3,2,5,null,null,9,6,null,7]
 Output: 7
 Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).
 
 Example 3:
 Input: root = [1,3,2,5]
 Output: 2
 Explanation: The maximum width exists in the second level with length 2 (3,2).
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

// TC: O(n), SC: O(n)
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var maxWidth = 0
        var queue = [(node: TreeNode, index: Int)]()
        queue.append((root, 0))
        
        while !queue.isEmpty {
            let firstIndex = queue.first!.1
            let lastIndex = queue.last!.1
            
            maxWidth = max(maxWidth, lastIndex - firstIndex + 1)
            
            for _ in 0..<queue.count {
                let (node, index) = queue.removeFirst()

                let relativeIndex = index - firstIndex
                
                if let left = node.left {
                    queue.append((left, 2 * relativeIndex))
                }
                
                if let right = node.right {
                    queue.append((right, 2 * relativeIndex + 1))
                }
            }
        }
        return maxWidth
    }
}
