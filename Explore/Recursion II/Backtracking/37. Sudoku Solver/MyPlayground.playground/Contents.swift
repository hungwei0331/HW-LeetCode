/*
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 The '.' character indicates empty cells.

 Example 1:
 Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
 Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
 Explanation: The input board is shown above and the only valid solution is shown below:

 Constraints:
 board.length == 9
 board[i].length == 9
 board[i][j] is a digit or '.'.
 It is guaranteed that the input board has only one solution.
 */

// TC: O(9^81)
// SC: O(81) = O(1)
class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }
    
    private func solve(_ board: inout [[Character]]) -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if board[row][col] == "." {
                    for num in "123456789" {
                        if isVaild(&board, row, col, num) {
                            board[row][col] = num
                            if solve(&board) {
                                return true
                            }
                            board[row][col] = "."
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func isVaild(_ board: inout [[Character]], _ row: Int, _ col: Int, _ num: Character) -> Bool {
        for i in 0..<9 {
            if board[i][col] == num {
                return false
            }
        }
        
        for j in 0..<9 {
            if board[row][j] == num {
                return false
            }
        }
        
        let startRow = row / 3 * 3
        let startCol = col / 3 * 3
        for i in 0..<3 {
            for j in 0..<3 {
                if board[startRow + i][startCol + j] == num {
                    return false
                }
            }
        }
        return true
    }
}
