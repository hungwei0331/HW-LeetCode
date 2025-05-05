/*
 You are given an m x n grid where each cell can have one of three values:

 0 representing an empty cell,
 1 representing a fresh orange, or
 2 representing a rotten orange.
 Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

 Example 1:
 Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 
 Example 2:
 Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 
 Example 3:
 Input: grid = [[0,2]]
 Output: 0
 Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.
  
 Constraints:
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 10
 grid[i][j] is 0, 1, or 2.
 */

// BFS
// TC: O(m * n), where N×M is the size of the grid. In the worst case would enumerate all the cells in the grid once and only once. Therefore, it takes O(NM) time.
// SC: O(m * n), where N×M is the size of the grid. In the worst case, the grid is filled with rotten oranges. As a result, the queue would be initialized with all the cells in the grid.
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        var queue = [(Int, Int)]()
        var fresh = 0
        var minutes = 0
        var grid = grid
        var rottenThisRound = false
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == 2 {
                    queue.append((row, col))
                } else if grid[row][col] == 1 {
                    fresh = fresh + 1
                }
            }
        }
        
        while !queue.isEmpty && fresh > 0 {
            for _ in 0..<queue.count {
                let (row, col) = queue.removeFirst()
                for direction in directions {
                    let newRow = row + direction.0
                    let newCol = col + direction.1
                    
                    if newRow < 0 || newRow >= grid.count || newCol < 0 || newCol >= grid[0].count {
                        continue
                    }
                    
                    if grid[newRow][newCol] == 1 {
                        grid[newRow][newCol] = 2
                        fresh = fresh - 1
                        queue.append((newRow, newCol))
                    }
                }
            }
            minutes = minutes + 1
        }
        return fresh == 0 ? minutes : -1
    }
}
