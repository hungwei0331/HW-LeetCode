/*
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

A subarray is a contiguous part of an array.
*/

/*
Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Example 2:

Input: nums = [1]
Output: 1
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
*/

//Runtime: 824 ms, faster than 67.31% of Swift online submissions for Maximum Subarray.
//Memory Usage: 18.5 MB, less than 66.67% of Swift online submissions for Maximum Subarray.

import Foundation

var nums = [-2,1,-3,4,-1,2,1,-5,4]

// nums: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
// step: [-2, 1, -2, 4, 3, 5, 6, -1, 4]

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
            var maxValue = 0
            var result = Int.min
            
            if nums.isEmpty { return 0 }
            
            for i in 0..<nums.count {
                maxValue = max(nums[i], nums[i] + maxValue)
                result = max(result, maxValue)
            }
            return result
    }
}

Solution().maxSubArray(nums)

