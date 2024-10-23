/*
 Given the root of a binary tree, return the postorder traversal of its nodes' values.

 Example 1:
 Input: root = [1,null,2,3]
 Output: [3,2,1]
 Explanation:

 Example 2:
 Input: root = [1,2,3,4,5,null,8,null,null,6,7,9]
 Output: [4,6,7,5,2,9,8,3,1]
 Explanation:

 Example 3:
 Input: root = []
 Output: []

 Example 4:
 Input: root = [1]
 Output: [1]
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

//left, right, root

// Recursive
// TC: O(n), which n is nodes, SC: O(n)
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func traversal(_ node: TreeNode?) {
            guard let node = node else { return }
            traversal(node.left)
            traversal(node.right)
            result.append(node.val)
        }
        traversal(root)
        return result
     }
}

// Iteratively
// TC: O(n), which n is nodes, SC: O(n)
class Solution1 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var stack1 = [TreeNode]()
        var stack2 = [TreeNode]()
        var result = [Int]()
        
        stack1.append(root)
        
        // add root -> right -> left to stack2
        while !stack1.isEmpty {
            let node = stack1.removeLast()
            stack2.append(node)
            
            if let left = node.left {
                stack1.append(left)
            }
            
            if let right = node.right {
                stack1.append(right)
            }
        }
        
        while !stack2.isEmpty {
            result.append(stack2.removeLast().val)
        }
        return result
     }
}
