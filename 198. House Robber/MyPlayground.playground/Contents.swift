/*
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
 */

/*
 Example 1:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 2:

 Input: nums = [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
 */

/*
 Step1. if nums equal 1, rob first house
 Step2. if nums equal 2, rob which is bigger in house
 Step3. if nums equal 3, choose which is greater between i + (i - 2), or (i - 1)
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var dp = [Int]()
        
        if nums.count == 1 {
            return nums.first ?? 0
        }

        dp = [ nums[0], max(nums[0], nums[1])]
        
        if nums.count == 2 {
            return dp[1]
        }
        
        for i in 2..<nums.count {
            dp.append( max(nums[i] + dp[i - 2] , dp[i - 1]) )
        }
        return dp.last ?? 0
    }
}

var nums = [2,7,9,3,1]
print(Solution().rob(nums))
