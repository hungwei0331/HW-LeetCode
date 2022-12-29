/*
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */

/*
 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

/*
 Step1. 0: 1
        1: 1
        2: 2
        3: 3
        4: 5
        5: 8
        ...
        n: (n - 1 + n -2)
 Step2.
 Step3.
 */

import Foundation


class Solution {
    func climbStairs(_ n: Int) -> Int {
        // MARK: - 0 step has one way, 1 step has one way as well
        var dp = [1, 1]
        
        if n < 2 {
            return 1
        }
        
        if n == 2 {
            return dp[0] + dp[1]
        }
        
        for i in 2...n {
            dp.append(dp[i - 1] + dp[i - 2])
        }
        
        return dp[n]
    }
}


var nums = 3
print(Solution().climbStairs(nums))


