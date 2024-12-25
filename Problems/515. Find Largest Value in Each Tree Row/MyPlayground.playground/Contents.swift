/*
 Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

 Example 1:
 Input: root = [1,3,2,5,3,null,9]
 Output: [1,3,9]
 
 Example 2:
 Input: root = [1,2,3]
 Output: [1,3]
  
 Constraints:
 The number of nodes in the tree will be in the range [0, 104].
 -231 <= Node.val <= 231 - 1
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

// TC: O(n) SC: O(n)
class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [root]
        var result = [Int]()
        
        while !queue.isEmpty {
            var maxVal = Int.min
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                maxVal = max(maxVal, node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(maxVal)
        }
        return result
    }
}
