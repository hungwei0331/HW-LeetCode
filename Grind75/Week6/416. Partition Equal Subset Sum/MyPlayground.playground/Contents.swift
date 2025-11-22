/*
 Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.

 Example 1:
 Input: nums = [1,5,11,5]
 Output: true
 Explanation: The array can be partitioned as [1, 5, 5] and [11].
 
 Example 2:
 Input: nums = [1,2,3,5]
 Output: false
 Explanation: The array cannot be partitioned into equal sum subsets.
 */

// TC: O(n * target), SC: O(target)
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0, +)

        if total % 2 != 0 { return false }

        let target = total / 2

        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true

        for num in nums {
            for t in stride(from: target, through: num, by: -1) {
                if dp[t - num] {
                    dp[t] = true
                }
            }
        }
        return dp[target]
    }
}
