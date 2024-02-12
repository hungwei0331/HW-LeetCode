/*
 Given an m x n matrix, return all elements of the matrix in spiral order.

  

 Example 1:
 Input: matrix = [[1,2,3],
                  [4,5,6],
                  [7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2:
 Input: matrix = [[1,2,3,4],
                  [5,6,7,8],
                  [9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var top = 0
        var bottom = matrix.count
        var left = 0
        var right = matrix[0].count
        var result = [Int]()
        
        while (top < bottom && left < right) {
            for i in left..<right {
                result.append(matrix[top][i])
            }
            top = top + 1
            
            for i in top..<bottom {
                result.append(matrix[i][right - 1])
            }
            right = right - 1
            
            if top != bottom {
                for i in (left..<right).reversed() {
                    result.append(matrix[bottom - 1][i])
                }
                bottom = bottom - 1
            }
            
            
            if left != right {
                for i in (top..<bottom).reversed() {
                    result.append(matrix[i][left])
                }
                left = left + 1
            }
        }
        
        return result
    }
}

let result = Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
//let result = Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
print(result)
