/*
 Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

 Example 1:
 Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
 Output: [3,9,20,null,null,15,7]
 
 Example 2:
 Input: inorder = [-1], postorder = [-1]
 Output: [-1]
  

 Constraints:

 1 <= inorder.length <= 3000
 postorder.length == inorder.length
 -3000 <= inorder[i], postorder[i] <= 3000
 inorder and postorder consist of unique values.
 Each value of postorder also appears in inorder.
 inorder is guaranteed to be the inorder traversal of the tree.
 postorder is guaranteed to be the postorder traversal of the tree.
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

// TC: O(n) SC: O(n)
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var inorderIndexMap = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            inorderIndexMap[value] = index
        }
        
        func build(_ inorderStart: Int, _ inorderEnd: Int, _ postorderEnd: inout Int) -> TreeNode? {
            
            if inorderStart > inorderEnd { return nil }
            
            let rootValue = postorder[postorderEnd]
            let root = TreeNode(rootValue)
            postorderEnd = postorderEnd - 1
            
            let inorderIndex = inorderIndexMap[rootValue]!
            
            root.right = build(inorderIndex + 1, inorderEnd, &postorderEnd)
            root.left = build(inorderStart, inorderIndex - 1, &postorderEnd)
            
            return root
        }
        
        var postorderEnd = postorder.count - 1
        return build(0, inorder.count - 1, &postorderEnd)
    }
}
