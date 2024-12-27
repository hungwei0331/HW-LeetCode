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

// dp[0] = [0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0]
// dp[1] = [0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0]
// dp[2] = [0, 0, 1, 0, 3, 0, 3, 0, 1, 0, 0]
// dp[3] = [0, 1, 0, 4, 0, 6, 0, 4, 0, 1, 0]
// dp[4] = [0, 0, 5, 0, 10, 0, 10, 0, 5, 0, 0]

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var sum = nums.reduce(0, +)
        if target < -sum || target > sum { return 0 }
        
        var dp = Array(repeating: Array(repeating: 0, count: 2 * sum + 1), count: nums.count)
        
        dp[0][ nums[0] + sum] = 1
        dp[0][-nums[0] + sum] += 1
        
        for i in 1..<nums.count {
            let num = nums[i]
            for j in 0...sum * 2 {
                if dp[i - 1][j] > 0 {
                    dp[i][j + num] += dp[i - 1][j]
                    dp[i][j - num] += dp[i - 1][j]
                }
            }
        }
        return dp[nums.count - 1][sum + target]
    }
}

var nums = [1,1,1,1,1], target = 3
let result = Solution().findTargetSumWays(nums, target)
print(result)
print("")
