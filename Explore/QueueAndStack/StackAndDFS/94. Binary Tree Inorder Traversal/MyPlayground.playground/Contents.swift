/*
 Given the root of a binary tree, return the inorder traversal of its nodes' values.

 Example 1:
 Input: root = [1,null,2,3]
 Output: [1,3,2]
 
 Example 2:
 Input: root = []
 Output: []
 
 Example 3:
 Input: root = [1]
 Output: [1]
 */

// TC: O(n) SC: O(n)

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        dfs(root)
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            dfs(root.left)
            result.append(root.val)
            dfs(root.right)
        }
        return result
    }
}

// TC: O(n) SC: O(n)

class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode?]()
        var curr = root
        
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            curr = stack.removeLast()
            if let val = curr?.val {
                result.append(val)
            }
            curr = curr?.right
        }
        return result
    }
}

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
