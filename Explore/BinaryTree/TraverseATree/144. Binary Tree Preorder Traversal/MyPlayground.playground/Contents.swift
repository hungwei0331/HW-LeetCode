/*
 Given the root of a binary tree, return the preorder traversal of its nodes' values.

 Example 1:
 Input: root = [1,null,2,3]
 Output: [1,2,3]
 Explanation:

 Example 2:
 Input: root = [1,2,3,4,5,null,8,null,null,6,7,9]
 Output: [1,2,4,5,6,7,3,8,9]
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

// Recursive
// TC: O(n), which n is nodes, SC: O(n)
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        func preOrder(_ currentNode: TreeNode?) {
            guard let currentNode = currentNode else { return }
            
            result.append(currentNode.val)
            preOrder(currentNode.left)
            preOrder(currentNode.right)
        }
        
        var result = [Int]()
        preOrder(root)
        return result
    }
}

// Iteratively
// TC: O(n), which n is nodes, SC: O(n)
class Solution1 {
   func preorderTraversal(_ root: TreeNode?) -> [Int] {
       guard let root = root else { return []}
       
       var stack = [TreeNode]()
       var result = [Int]()
       stack.append(root)
       
       while !stack.isEmpty {
           let node = stack.popLast()
           result.append(node!.val)
           
           if let right = node?.right {
               stack.append(right)
           }
           
           if let left = node?.left {
               stack.append(left)
           }
       }
       return result
   }
}
