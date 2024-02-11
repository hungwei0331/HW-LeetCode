/*
 Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.
 
 Example 1:
 Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,4,7,5,3,6,8,9]
 
 Example 2:
 Input: mat = [[1,2],[3,4]]
 Output: [1,2,3,4]
 */

//TC: O(M * N) SC: O( mim(M * N))
class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        
        if mat.isEmpty && mat[0].isEmpty { return [0] }
        
        var row = mat.count
        var col = mat.first?.count ?? 0
        var result = [Int]()
        
        // we could get total diagonals from (row + col - 1)
        var diagonal = Array(repeating: [Int](), count: row + col - 1)
        
        // set element to each diagonal set
        for i in 0..<row {
            for j in 0..<col {
                diagonal[i + j].append(mat[i][j])
            }
        }
        
        for (index, value) in diagonal.enumerated() {
            if (index % 2 == 0) {
                result = result + value.reversed()
            } else {
                result = result + value
            }
        }
        
        return result
    }
}

let result = Solution().findDiagonalOrder([[1,2,3],
                                           [4,5,6],
                                           [7,8,9]])

//let result = Solution().findDiagonalOrder([[1,2],
//                                           [3,4]])
print(result)
