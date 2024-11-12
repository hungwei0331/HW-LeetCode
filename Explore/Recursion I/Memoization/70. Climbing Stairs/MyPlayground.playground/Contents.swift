/*
 You are climbing a staircase. It takes n steps to reach the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

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

// n = 1: 1
// n = 2: 2
// n = 3: 3
// n = 4: 5
//.
//.
// n = n - 1 + n - 2

// TC: O(n) SC: O(n)
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var memo = [Int: Int]()
        func climb(_ n: Int) -> Int {
            if n <= 2 {
                return n
            }
            
            if let cacheResult = memo[n] {
                return cacheResult
            }
            
            let result = climb(n - 1) + climb(n - 2)
            memo[n] = result
            return result
        }
        return climb(n)
    }
}
