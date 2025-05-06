/*
 Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

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
  
 Constraints:
 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 104
 */

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var start = 0
        var end = 0
        var sum = 0
        var length = Int.max

        while end < nums.count {
            sum = sum + nums[end]

            while sum >= target {
                length = min(length, end - start + 1)
                sum = sum - nums[start]
                start = start + 1
            }
            end = end + 1
        }
        return length == Int.max ? 0 : length
    }
}
