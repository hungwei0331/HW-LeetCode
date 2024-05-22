/*
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
  
 Example 1:
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 
 Example 2:
 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 */

// TC: O(N^2)
///because we need to traverse every position in the board, and each of the four check steps is an O(1) operation.

// SC: O(N^2)
///because in the worst-case scenario, if the board is full, we need a hash set each with size N to store all seen numbers for each of the N rows, N columns, and N boxes, respectively.

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet: [Set] = [Set](repeating: Set<Character>(), count: board.count)
        var colSet: [Set] = [Set](repeating: Set<Character>(), count: board.count)
        var boxSet: [[Set]] = [[Set]](repeating: [Set](repeating: Set<Character>(), count: 3), count: 3)
        
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                let number = board[r][c]
                    
                if rowSet[r].contains(number) ||
                    colSet[c].contains(number) ||
                    boxSet[r/3][c/3].contains(number) {
                    return false
                }
                
                if number == "." { continue }
                
                rowSet[r].insert(number)
                colSet[c].insert(number)
                boxSet[r/3][c/3].insert(number)
            }
        }
        return true
    }
}
