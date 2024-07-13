/*
 Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

 The distance between two adjacent cells is 1.

 Example 1:
 Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
 Output: [[0,0,0],[0,1,0],[0,0,0]]
 
 Example 2:
 Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
 Output: [[0,0,0],[0,1,0],[1,2,1]]
 */

// TC: O(m * n) SC: O(m * n)

class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var distance = Array(repeating: Array(repeating: Int.max, count: mat[0].count), count: mat.count)
        var queue = [(row: Int, col: Int)]()
        for row in 0..<mat.count {
            for col in 0..<mat[0].count {
                if mat[row][col] == 0 {
                    queue.append((row, col))
                    distance[row][col] = 0
                }
            }
        }
        
        while !queue.isEmpty {
            var directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
            let (row, col) = queue.removeFirst()
            
            for direction in directions {
                let nextRow = row + direction[0]
                let nextCol = col + direction[1]

                if nextRow >= 0 && nextRow < mat.count && nextCol >= 0 && nextCol < mat[0].count {
                    if distance[nextRow][nextCol] == Int.max {
                        distance[nextRow][nextCol] = distance[row][col] + 1
                        queue.append((nextRow, nextCol))
                    }
                }
            }
        }
        return distance
    }
}

var mat = [[0,0,0],[0,1,0],[0,0,0]]
let result = Solution().updateMatrix(mat)
print(result)
