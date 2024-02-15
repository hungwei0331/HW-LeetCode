/*
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

 Example 1:
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 
 Example 2:
 Input: numRows = 1
 Output: [[1]]
 */

//TC: O(numRows2) SC: O(numRows2)
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        if numRows == 0 { return [[Int]]() }
        
        var triangle = [[Int]]()
        
        triangle.append([1])
        
        for i in 1..<numRows {
            var row = [Int]()
            row.append(1)
            
            for j in 1..<i {
                row.append(triangle[i - 1][j - 1] + triangle[i - 1][j])
            }
            
            row.append(1)
            triangle.append(row)
        }
        
        return triangle
    }
}

var result = Solution().generate(5)
for singleRow in result {
    print(singleRow)
}
