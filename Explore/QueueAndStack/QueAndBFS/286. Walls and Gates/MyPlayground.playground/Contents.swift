/*
 You are given an m x n grid rooms initialized with these three possible values.

 -1 A wall or an obstacle.
 0 A gate.
 INF Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
 Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

 Example 1:
 Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
 Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
 
 Example 2:
 Input: rooms = [[-1]]
 Output: [[-1]]
 */

// put cell into queue
// if quene not empty
// for loop direction
// pop item from queue
//

class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        
        var directopns = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        var queue = [(row: Int, col: Int)]()
        
        for row in 0..<rooms.count {
            for col in 0..<rooms[0].count {
                if rooms[row][col] == 0 {
                    queue.append((row, col))
                }
            }
        }
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            for direction in directopns {
                var nextRow = row + direction[0]
                var nextCol = col + direction[1]
                
                if nextRow < 0 ||
                    nextRow >= rooms.count ||
                    nextCol < 0 ||
                    nextCol >= rooms.count ||
                    rooms[nextRow][nextCol] != 2147483647 {
                    continue
                }
                
                rooms[nextRow][nextCol] = rooms[row][col] + 1
                queue.append((nextRow, nextCol))
            }
        }
    }
}

var rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
Solution().wallsAndGates(&rooms)
print(rooms)
print("")
