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

/*
[
[1],
[1,1],
[1,2,1],
[1,3,3,1],
[1,4,6,4,1]
 ]
 */

//TC: O(k2) SC: O(k)
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        
        var row = [Int]()
        row.append(1)
         
        if rowIndex == 0 {
            return row
        }
        
        for i in 1...rowIndex {
            row.insert(1, at: 0)
            
            for j in 1..<row.count - 1 {
                row[j] = row[j] + row[j + 1]
            }
        }
        return row
    }
}

let result = Solution().getRow(3)
print(result)
