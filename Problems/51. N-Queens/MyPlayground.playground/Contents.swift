/*
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.

 Example 1:
 Input: n = 4
 Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
 
 Example 2:
 Input: n = 1
 Output: [["Q"]]
 */

// TC: O(N!)
// SC: O(N^2), Extra memory used includes the 3 sets used to store board state, as well as the recursion call stack. All of this scales linearly with the number of queens. However, to keep the board state costs O(N^2), since the board is of size N * N.

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        var cols = Set<Int>()
        var diagonals1 = Set<Int>()
        var diagonals2 = Set<Int>()
        
        func backtracking(_ row: Int) {
            if row == n {
                result.append( board.map{ $0.joined() } )
                return
            }
            
            for col in 0..<n {
                if cols.contains(col) ||
                    diagonals1.contains( row - col ) ||
                    diagonals2.contains( row + col ) {
                    continue
                }
                
                board[row][col] = "Q"
                cols.insert(col)
                diagonals1.insert(row - col)
                diagonals2.insert(row + col)
                
                backtracking( row + 1 )
                
                board[row][col] = "."
                cols.remove(col)
                diagonals1.remove(row - col)
                diagonals2.remove(row + col)
            }
        }
        
        backtracking(0)
        return result
    }
}
