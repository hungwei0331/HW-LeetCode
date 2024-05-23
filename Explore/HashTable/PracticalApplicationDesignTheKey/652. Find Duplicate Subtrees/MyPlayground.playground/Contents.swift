/*
 Given the root of a binary tree, return all duplicate subtrees.
 For each kind of duplicate subtrees, you only need to return the root node of any one of them.
 Two trees are duplicate if they have the same structure with the same node values.
 
 
 Example 1:
 Input: root = [1,2,3,4,null,2,4,null,null,4]
 Output: [[2,4],[4]]
 
 Example 2:
 Input: root = [2,1,1]
 Output: [[1]]
 
 Example 3:
 Input: root = [2,2,2,3,null,3,null]
 Output: [[2,3],[3]]
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

// TC: O(n^2)
/// The string representation of each subtree can have a length up to O(n)O(n)O(n). Creating each representation therefore costs up to O(n)O(n)O(n), and we find string representations for all O(n)O(n)O(n) subtrees during the traversal.

// SC: O(n^2)
/// We store all string representations in the hash map. There are O(n)O(n)O(n) subtrees, and each subtree representation has the length of O(n)O(n)O(n).


class Solution {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var result = [TreeNode]()
        var dict = [String: Int]()
        
        func traverse(_ node: TreeNode?) -> String {
            guard let node = node else { return "#" }
            
            let left = traverse(node.left)
            let right = traverse(node.right)
            let subtree = "\(node.val),\(left),\(right)"
            
            if let frequency = dict[subtree], frequency == 1 {
                result.append(node)
            }
            
            dict[subtree, default: 0] += 1
            
            return subtree
        }
        
        traverse(root)
        return result
    }
}
