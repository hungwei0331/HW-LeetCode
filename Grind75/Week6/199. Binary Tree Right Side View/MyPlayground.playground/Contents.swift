/*
 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example 1:
 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]

 Explanation:

 Example 2:
 Input: root = [1,2,3,4,null,null,null,5]
 Output: [1,3,4,5]
 Explanation:

 Example 3:
 Input: root = [1,null,3]
 Output: [1,3]

 Example 4:
 Input: root = []
 Output: []
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

// TC: O(N), SC: O(N)
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        var queue = [TreeNode?]()
        queue.append(root)

        while !queue.isEmpty {
            
            var nextLevel = [TreeNode]()

            for i in 0..<queue.count {

                if let left = queue[i]?.left {
                    nextLevel.append(left)
                }

                if let right = queue[i]?.right {
                    nextLevel.append(right)
                }
                
                if i == queue.count - 1 {
                    result.append(queue[i]!.val)
                }
            }
            queue = nextLevel
        }
        return result
    }
}


class Solution2 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var result = [Int]()
        var queue = [root]

        while !queue.isEmpty {
            var nextLevel = [TreeNode]()

            if let lastNode = queue.last {
                result.append(lastNode.val)
            }

            for node in queue {
                if let left = node.left {
                    nextLevel.append(left)
                }

                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            queue = nextLevel
        }
        return result
    }
}
