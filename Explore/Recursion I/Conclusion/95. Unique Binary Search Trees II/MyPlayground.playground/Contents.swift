/*
 Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

 Example 1:
 Input: n = 3
 Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
 
 Example 2:
 Input: n = 1
 Output: [[1]]
  
 Constraints:
 1 <= n <= 8
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

// TC: O(4^n / n^{1.5})  SC:  O(n)
class Solution {
   func generateTrees(_ n: Int) -> [TreeNode?] {
       if n == 0 { return [ nil ] }
       var memo = [String: [TreeNode?]]()
       
       func buildTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
           let key = "\(start)-\(end)"
           if let cache = memo[key] {
               return cache
           }

           var result = [TreeNode?]()

           if start > end {
               result.append(nil)
               return result
           }
           
           for i in start...end {
               let leftTree = buildTrees(start, i - 1)
               let rightTree = buildTrees(i + 1, end)
               
               for left in leftTree {
                   for right in rightTree {
                       let root = TreeNode(i)
                       root.left = left
                       root.right = right
                       result.append(root)
                   }
               }
           }
           memo[key] = result
           return result
       }
       return buildTrees(1, n)
   }
}
