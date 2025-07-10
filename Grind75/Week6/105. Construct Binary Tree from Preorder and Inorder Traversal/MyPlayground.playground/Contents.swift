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

// TC: O(n), SC: O(n)
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderIndexMap = [Int: Int]()
        for (index, val) in inorder.enumerated() {
            inorderIndexMap[val] = index
        }
        
        var preorderIndex = 0
        
        func helper(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            
            let rootVal = preorder[preorderIndex]
            preorderIndex = preorderIndex + 1
            
            let root = TreeNode(rootVal)
            
            let inorderIndex = inorderIndexMap[rootVal]!
            
            root.left = helper(left, inorderIndex - 1)
            root.right = helper(inorderIndex + 1, right)
            
            return root
        }
        
        return helper(0, inorder.count - 1)
    }
}
