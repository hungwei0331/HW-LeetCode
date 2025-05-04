/*
 Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.

 A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:

 All the visited cells of the path are 0.
 All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
 The length of a clear path is the number of visited cells of this path.

 Example 1:
 Input: grid = [[0,1],[1,0]]
 Output: 2
 
 Example 2:
 Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
 Output: 4
 
 Example 3:
 Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
 Output: -1
  
 Constraints:
 n == grid.length
 n == grid[i].length
 1 <= n <= 100
 grid[i][j] is 0 or 1
 */

// sing BFS to find shortest path
// TC: O(n), each of the N cells is processed at most once, giving a total of O(N).
// SC: O(n), it will hold the row and column of each of the N cells
class Solution {
    
    struct Cell: Hashable {
        let row: Int
        let col: Int
    }
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid[0][0] != 0 || grid[grid.count - 1][grid[0].count - 1] != 0 {
            return -1
        }
        
        var queue = [(Int, Int, Int)]()
        var visited = Set<Cell>()
        let directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1),
                          (0, 1), (1, -1), (1, 0), (1, 1)]
        
        queue.append((0, 0, 1))
        
        while !queue.isEmpty {
            let (row, col, steps) = queue.removeFirst()
            
            if row == grid.count - 1 && col == grid[0].count - 1 {
                return steps
            }
            
            for direction in directions {
                let newRow = direction.0 + row
                let newCol = direction.1 + col
                
                if newRow < 0 || newCol < 0 ||
                    newRow >= grid.count || newCol >= grid[0].count ||
                    visited.contains(Cell(row: newRow, col: newCol)) {
                    continue
                }
                
                if grid[newRow][newCol] == 0 {
                    visited.insert(Cell(row: newRow, col: newCol))
                    queue.append((newRow, newCol, steps + 1))
                }
            }
        }

        return -1
    }
}

