/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

 Example 1:
 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 
 Example 2:
 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 
 Example 3:
 Input: nums = [1]
 Output: [[1]]
  
 Constraints:
 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */

// TC: O(N!), SC: O(N)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var path = [Int]()
        var result = [[Int]]()
        var used = Array(repeating: false, count: nums.count)
        
        backtracking(nums, &path, &result, &used)
        
        return result
    }
    
    private func backtracking(_ nums: [Int], _ path: inout [Int], _ result: inout [[Int]], _ used: inout [Bool]) {
        if path.count == nums.count {
            result.append(path)
            return
        }
        
        for i in 0..<nums.count {
            if used[i] == true { continue }
            
            path.append(nums[i])
            used[i] = true
            
            backtracking(nums, &path, &result, &used)
            
            path.removeLast()
            used[i] = false
        }
    }
}
