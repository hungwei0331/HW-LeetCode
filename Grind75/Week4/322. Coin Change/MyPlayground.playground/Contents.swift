/*
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.

 Example 1:
 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 
 Example 2:
 Input: coins = [2], amount = 3
 Output: -1
 
 Example 3:
 Input: coins = [1], amount = 0
 Output: 0
  
 Constraints:
 1 <= coins.length <= 12
 1 <= coins[i] <= 231 - 1
 0 <= amount <= 104
 */

// let n = amount + 1
// coin: 0, dp = [0, n, n, n, n, n, n, n, n, n, n, n]
// coin: 1, dp = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
// coin: 2, dp = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6]
// coin: 5, dp = [0, 1, 1, 2, 2, 1, 2, 2, 3, 3, 2, 3]
// DP: dp[i] = min(dp[i], dp[i - coin] + 1)

// TC: O(amount * n), SC: O(amount)
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }

        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for i in 0...amount {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}
