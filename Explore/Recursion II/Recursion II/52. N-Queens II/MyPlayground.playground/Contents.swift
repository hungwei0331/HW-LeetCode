/*
 he n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

 Example 1:
 Input: n = 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown.
 
 Example 2:
 Input: n = 1
 Output: 1
  
 Constraints:
 1 <= n <= 9
 */

// TC: O(N!), SC: O(N)
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var result = 0
        
        var cols = Set<Int>()
        var diangols1 = Set<Int>()
        var diangols2 = Set<Int>()
        
        func backtracking(_ row: Int) {
            if row == n {
                result = result + 1
                return
            }
            
            for col in 0..<n {
                if cols.contains(col) || diangols1.contains(row - col) || diangols2.contains(row + col) {
                    continue
                }
                
                cols.insert(col)
                diangols1.insert(row - col)
                diangols2.insert(row + col)
                
                backtracking(row + 1)
                
                cols.remove(col)
                diangols1.remove(row - col)
                diangols2.remove(row + col)
            }
        }
        backtracking(0)
        return result
    }
}
