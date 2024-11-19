/*
 We build a table of n rows (1-indexed). We start by writing 0 in the 1st row. Now in every subsequent row, we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.

 For example, for n = 3, the 1st row is 0, the 2nd row is 01, and the 3rd row is 0110.
 Given two integer n and k, return the kth (1-indexed) symbol in the nth row of a table of n rows.

 Example 1:
 Input: n = 1, k = 1
 Output: 0
 Explanation: row 1: 0
 
 Example 2:
 Input: n = 2, k = 1
 Output: 0
 Explanation:
 row 1: 0
 row 2: 01
 
 Example 3:
 Input: n = 2, k = 2
 Output: 1
 Explanation:
 row 1: 0
 row 2: 01
  
 Constraints:
 1 <= n <= 30
 1 <= k <= 2n - 1
 */

// Binary Tree Traversal
// TC: O(n) SC: O(n)
import Foundation
class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        return dfs(n, k, 0)
    }
    
    func dfs(_ n: Int, _ k: Int, _ rootVal: Int) -> Int {
        if n == 1 { return rootVal }
        
        let totalNode = Int(pow(2, Double(n - 1)))
        let halfElement = totalNode / 2
        
        if k > halfElement {
            let nextRootVal = rootVal == 0 ? 1 : 0
            return dfs(n - 1, k - halfElement, nextRootVal)
        } else {
            let nextRootVal = rootVal == 0 ? 0 : 1
            return dfs(n - 1, k, nextRootVal)
        }
    }
}
