/*
 You are given an m x n integer matrix matrix with the following two properties:

 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.

 Example 1:
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 
 Example 2:
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false
  
 Constraints:
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 */

// Binary Search
// TC: O(log(mn)), since it's a standard binary search.
// SC: O(1)
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty { return false }

        var top = 0
        var bottom = matrix.count - 1
        var row = -1

        // find corrent row
        while top <= bottom {
            let mid = (top + bottom) / 2
            if target < matrix[mid][0] {
                bottom = mid - 1
            } else if target > matrix[mid][matrix[0].count - 1] {
                top = mid + 1
            } else {
                row = mid
                break
            }
        }

        //ex: let matrix = [[10, 20, 30],[40, 50, 60],[70, 80, 90]], let target = 5
        //we could not find the specific row
        if row == -1 { return false }

        var left = 0
        var right = matrix[0].count - 1

        // find the target at the row we find
        while left <= right {
            let mid = (left + right) / 2
            if target < matrix[row][mid] {
                right = mid - 1
            } else if target > matrix[row][mid] {
                left = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}

// TC: O(m + n), in worst case go through whole row + col
// SC: O(1)
class Solution1 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty { return false }
        
        var row = 0
        var col = matrix[0].count - 1

        while row < matrix.count && col >= 0 {
            if target > matrix[row][col] {
                row = row + 1
            } else if target < matrix[row][col]{
                col = col - 1
            } else {
                return true
            }
        }
        return false
    }
}
