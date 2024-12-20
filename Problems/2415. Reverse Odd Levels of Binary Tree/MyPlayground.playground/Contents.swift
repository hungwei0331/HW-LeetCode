/*
 Given the root of a perfect binary tree, reverse the node values at each odd level of the tree.

 For example, suppose the node values at level 3 are [2,1,3,4,7,11,29,18], then it should become [18,29,11,7,4,3,1,2].
 Return the root of the reversed tree.

 A binary tree is perfect if all parent nodes have two children and all leaves are on the same level.

 The level of a node is the number of edges along the path between it and the root node.

 Example 1:
 Input: root = [2,3,5,8,13,21,34]
 Output: [2,5,3,8,13,21,34]
 Explanation:
 The tree has only one odd level.
 The nodes at level 1 are 3, 5 respectively, which are reversed and become 5, 3.
 
 Example 2:
 Input: root = [7,13,11]
 Output: [7,11,13]
 Explanation:
 The nodes at level 1 are 13, 11, which are reversed and become 11, 13.
 
 Example 3:
 Input: root = [0,1,2,0,0,0,0,1,1,1,1,2,2,2,2]
 Output: [0,2,1,0,0,0,0,2,2,2,2,1,1,1,1]
 Explanation:
 The odd levels have non-zero values.
 The nodes at level 1 were 1, 2, and are 2, 1 after the reversal.
 The nodes at level 3 were 1, 1, 1, 1, 2, 2, 2, 2, and are 2, 2, 2, 2, 1, 1, 1, 1 after the reversal.
 */

// TC: O(n) SC: O(n)
class Solution {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var level = 0
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            var currentLevelNode = [TreeNode]()
            
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                currentLevelNode.append(node)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            if level % 2 != 0 {
                var i = 0
                var j = currentLevelNode.count - 1
                while i < j {
                    let tmp = currentLevelNode[i].val
                    currentLevelNode[i].val = currentLevelNode[j].val
                    currentLevelNode[j].val = tmp
                    i = i + 1
                    j = j - 1
                }
            }
            level = level + 1
        }
        return root
    }
}

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
