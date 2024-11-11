/*
 Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

 Example 1:
 Input: rowIndex = 3
 Output: [1,3,3,1]
 
 Example 2:
 Input: rowIndex = 0
 Output: [1]
 
 Example 3:
 Input: rowIndex = 1
 Output: [1,1]
 */

// Recursive
// TC: O(n^2) SC: O(n)
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        
        var previousRow = getRow(rowIndex - 1)
        var result = [1]
        
        for i in 1..<rowIndex {
            result.append(previousRow[i - 1] + previousRow[i])
        }
        
        result.append(1)
        return result
    }
}
