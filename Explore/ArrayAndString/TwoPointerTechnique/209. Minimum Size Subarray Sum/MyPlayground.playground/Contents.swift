/*
 Given an array of positive integers nums and a positive integer target, return the minimal length of a
 subarray
  whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

 Example 1:
 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 
 Example 2:
 Input: target = 4, nums = [1,4,4]
 Output: 1
 
 Example 3:
 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
 */

//TC: O(n) SC: O(1)
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var sum = 0
        var result = Int.max
        
        for right in 0..<nums.count {
            sum = sum + nums[right]
            
            while sum >= target {
                result = min(result, right + 1 - left)
                sum = sum - nums[left]
                left = left + 1
            }
        }
        return result == Int.max ? 0 : result
    }
}

//let result = Solution().minSubArrayLen(7, [2,3,1,2,4,3])
//let result = Solution().minSubArrayLen(4, [1,4,4])
let result = Solution().minSubArrayLen(11, [1,1,1,1,1,1,1,1])
print(result)
