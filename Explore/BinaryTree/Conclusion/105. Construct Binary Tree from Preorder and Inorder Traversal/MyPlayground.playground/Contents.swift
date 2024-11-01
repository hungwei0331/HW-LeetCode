/*
 Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

 Example 1:
 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 
 Example 2:
 Input: preorder = [-1], inorder = [-1]
 Output: [-1]
  
 Constraints:
 1 <= preorder.length <= 3000
 inorder.length == preorder.length
 -3000 <= preorder[i], inorder[i] <= 3000
 preorder and inorder consist of unique values.
 Each value of inorder also appears in preorder.
 preorder is guaranteed to be the preorder traversal of the tree.
 inorder is guaranteed to be the inorder traversal of the tree.
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
//Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//Output: [3,9,20,null,null,15,7]
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorderIndx = 0
        var inorderIndexMap = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            inorderIndexMap[value] = index
        }
        
        func buildTree(_ inorderStart: Int, _ inoderEnd: Int, _ preorderIndx: inout Int) -> TreeNode? {
            
            if inorderStart > inoderEnd { return nil }
            
            let rootValue = preorder[preorderIndx]
            preorderIndx = preorderIndx + 1
            let root = TreeNode(rootValue)
            
            let inorderIndex = inorderIndexMap[rootValue]!
            
            root.left = buildTree(inorderStart, inorderIndex - 1, &preorderIndx)
            root.right = buildTree(inorderIndex + 1, inoderEnd, &preorderIndx)
            
            return root
        }
        return buildTree(0, inorder.count - 1, &preorderIndx)
    }
}
