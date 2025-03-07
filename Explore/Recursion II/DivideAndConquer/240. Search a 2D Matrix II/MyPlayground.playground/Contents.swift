/*
 Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
  

 Example 1:
 Input: matrix = [
 [1,4,7,11,15],
 [2,5,8,12,19],
 [3,6,9,16,22],
 [10,13,14,17,24],
 [18,21,23,26,30]
 ], target = 5
 Output: true
 
 Example 2:
 Input: matrix = [
 [1,4,7,11,15],
 [2,5,8,12,19],
 [3,6,9,16,22],
 [10,13,14,17,24],
 [18,21,23,26,30]
 ], target = 20
 Output: false
 */

//TC: O(m + n), SC: O(1)
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count <= 0 && matrix[0].count <= 0 { return false }
        
        let rows = matrix.count
        let cols = matrix[0].count
        var row = 0, col = cols - 1
        
        while row < rows && col >= 0 {
            if matrix[row][col] > target {
                col = col - 1
            } else if matrix[row][col] < target {
                row = row + 1
            } else {
                return true
            }
        }
        return false
    }
}
