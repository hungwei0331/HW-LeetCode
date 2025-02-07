/*
 Given a n-ary tree, find its maximum depth.
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

 Example 1:
 Input: root = [1,null,3,2,4,null,5,6]
 Output: 3
 
 Example 2:
 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: 5
  
 Constraints:
 The total number of nodes is in the range [0, 104].
 The depth of the n-ary tree is less than or equal to 1000.
 */

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

// Top Down
// TC: O(n), SC: O(h)
class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        var maxDepth = 1
        
        func traverse(_ node: Node?, _ depth: Int) {
            guard let node = node else { return }
            maxDepth = max(maxDepth, depth)
            for child in node.children {
                traverse(child, depth + 1)
            }
        }
        traverse(root, maxDepth)
        return maxDepth
    }
}

// Bottom Up
// TC: O(n), SC: O(h)
class Solution1 {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        if root.children.isEmpty { return 1 }
        
        var depth = 0
        for child in root.children {
            depth = max(depth, maxDepth(child))
        }
        return depth + 1
    }
}

// BFS
// TC: O(n), SC: O(n)
class Solution2 {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        var maxDepth = 0
        
        var queue = [root]
        
        while !queue.isEmpty {
            var nextLevelQueue = [Node]()
            maxDepth = maxDepth + 1
            
            for node in queue {
                nextLevelQueue.append(contentsOf: node.children)
            }
            queue = nextLevelQueue
        }
        return maxDepth
    }
}
