/*
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example 1:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 
 Example 2:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true
 
 Example 3:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false
 */

// TC: O(N * 3^L), where N is the number of cells in the board and L is the length of the word to be matched.
// For the backtracking function, initially we could have at most 4 directions to explore, but further the choices are reduced into 3
// SC: O(L), where L is the length of the word to be matched.
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var rows = board.count
        var cols = board[0].count
        var words = Array(word)
        var board = board
        
        func dfs(_ row: Int, _ col: Int, _ index: Int) -> Bool {
            if index == words.count { return true }
            
            if row < 0 || col < 0 || row >= rows || col >= cols || board[row][col] != words[index] {
                return false
            }
        
            var tmp = board[row][col]
            board[row][col] = "#"
            
            let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
            for direction in directions {
                let newRow = row + direction.0
                let newCol = col + direction.1
                if dfs(newRow, newCol, index + 1) {
                    return true
                }
            }
            board[row][col] = tmp
            return false
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                if dfs(row, col, 0) {
                    return true
                }
            }
        }
        return false
    }
}

var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED" //Output: true
//var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB" // Output: false
let result = Solution().exist(board, word)
print(result)
print("")
