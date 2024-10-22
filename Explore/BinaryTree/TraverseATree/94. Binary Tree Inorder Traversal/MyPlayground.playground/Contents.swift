/*
 Example 1:
 Input: root = [1,null,2,3]
 Output: [1,3,2]
 Explanation:

 Example 2:
 Input: root = [1,2,3,4,5,null,8,null,null,6,7,9]
 Output: [4,2,6,5,7,1,3,9,8]
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

//left, root, right

// Recursive
// TC: O(n), which n is nodes, SC: O(n)
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            inorder(root.left)
            result.append(root.val)
            inorder(root.right)
        }
        inorder(root)
        return result
     }
}

// Iteratively
// TC: O(n), which n is nodes, SC: O(n)
class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var result = [Int]()
        var currentNode = root
        
        while currentNode != nil || !stack.isEmpty {
            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }
            currentNode = stack.removeLast()
            result.append(currentNode!.val)
            currentNode = currentNode?.right
        }
        return result
     }
}
