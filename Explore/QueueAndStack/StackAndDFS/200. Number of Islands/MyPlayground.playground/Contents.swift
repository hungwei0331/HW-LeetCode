/*
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:
 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 
 Example 2:
 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
 */

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var islands = 0
        var grid = grid
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == "1" {
                    dfs(&grid, row, col)
                    islands = islands + 1
                }
            }
        }
        return islands
    }
    
    func dfs(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || grid[row][col] != "1" {
            return
        }
        
        grid[row][col] = "0"
        
        dfs(&grid, row + 1, col)
        dfs(&grid, row - 1, col)
        dfs(&grid, row, col + 1)
        dfs(&grid, row, col - 1)
    }
}

var grid: [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ]

let result = Solution().numIslands(grid)
print(result)
