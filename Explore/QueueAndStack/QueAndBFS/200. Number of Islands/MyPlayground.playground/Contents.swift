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

// TC: O(MN) C: O(MN)

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        var grid = grid
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == "1" {
                    //bfs(row, col, &grid)
                    dfs(row, col, &grid)
                    count = count + 1
                }
            }
        }
        return count
    }
    
    func dfs(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
        if row < 0
            || row >= grid.count
            || col < 0
            || col >= grid[0].count
            || grid[row][col] != "1" {
            return
        }
        
        grid[row][col] = "0"
        
        dfs(row + 1, col, &grid)
        dfs(row - 1, col, &grid)
        dfs(row, col + 1, &grid)
        dfs(row, col - 1, &grid)
    }
    
    func bfs(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        var queue = [(row: Int, col: Int)]()
        
        queue.append((row, col))
        grid[row][col] = "0"
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            
            for direction in directions {
                let nextRow = row + direction[0]
                let nextCol = col + direction[1]
                
                if nextRow < 0
                    || nextRow >= grid.count
                    || nextCol < 0
                    || nextCol >= grid[0].count
                    || grid[nextRow][nextCol] != "1" {
                    continue
                }
                grid[nextRow][nextCol] = "0"
                queue.append((nextRow, nextCol))
            }
        }
    }
}
