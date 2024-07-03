/*
 You are given an integer array nums and an integer target.

 You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

 For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
 Return the number of different expressions that you can build, which evaluates to target.

 Example 1:
 Input: nums = [1,1,1,1,1], target = 3
 Output: 5
 Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 
 Example 2:
 Input: nums = [1], target = 1
 Output: 1
 */

// TC: O(m * n), n is nums.count and m is the range of sum
// SC: O(m * n), n is nums.count and m is the range of sum

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var count = nums.count
        var sum = nums.reduce(0, +)
        if target < -sum || target > sum { return 0 }
        
        var dp = Array(repeating: Array(repeating: 0, count: sum * 2 + 1), count: count)
        dp[0][sum + nums[0]] = 1
        dp[0][sum - nums[0]] += 1
        
        for i in 1..<count {
            let num = nums[i]
            for j in 0...2 * sum {
                if dp[i - 1][j] > 0 {
                    dp[i][j + num] += dp[i - 1][j]
                    dp[i][j - num] += dp[i - 1][j]
                }
            }
        }
        return dp[count - 1][sum + target]
    }
}
