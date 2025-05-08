/*
 Given an integer array nums, find the subarray with the largest sum, and return its sum.

 Example 1:
 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: The subarray [4,-1,2,1] has the largest sum 6.
 
 Example 2:
 Input: nums = [1]
 Output: 1
 Explanation: The subarray [1] has the largest sum 1.
 
 Example 3:
 Input: nums = [5,4,-1,7,8]
 Output: 23
 Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
  
 Constraints:
 1 <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 */

// DP
// nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
//        [-2, 1, -2, 4,  3, 5, 6,  1, 4]
// dp[i] = max(nums[i], dp[i - 1] + nums[i])


// TC: O(n), visited each element once
// SC: O(n), store a dp array
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = nums
        var maxSum = dp[0]
        
        for i in 1..<nums.count {
            dp[i] = max(nums[i], dp[i - 1] + nums[i])
            maxSum = max(maxSum, dp[i])
        }
        return maxSum
    }
}
