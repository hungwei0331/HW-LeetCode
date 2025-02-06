/*
 Given the root of an n-ary tree, return the preorder traversal of its nodes' values.
 Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)
 
 Example 1:
 Input: root = [1,null,3,2,4,null,5,6]
 Output: [1,3,5,6,2,4]
 
 Example 2:
 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
 */

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

// TC: O(n), where N is the number of nodes
// SC: O(n), we could keep up to the entire tree
// Recursive
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        var result = [Int]()
        
        func traverse(_ node: Node?) {
            guard let node = node else { return }
            result.append(node.val)
            for child in node.children {
                traverse(child)
            }
        }
        
        traverse(root)
        return result
    }
}

// Iteratively
class Solution1 {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        var stack = [root]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            stack.append(contentsOf: node.children.reversed())
        }
        
        return result
    }
}


