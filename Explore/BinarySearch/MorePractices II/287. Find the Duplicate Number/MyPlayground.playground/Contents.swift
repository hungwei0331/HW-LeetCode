/*
 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

 There is only one repeated number in nums, return this repeated number.

 You must solve the problem without modifying the array nums and using only constant extra space.

 Example 1:
 Input: nums = [1,3,4,2,2]
 Output: 2
 
 Example 2:
 Input: nums = [3,1,3,4,2]
 Output: 3
 
 Example 3:
 Input: nums = [3,3,3,3,3]
 Output: 3
 */

// TC: O(nLogn) SC: O(1)
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            var count = 0
            
            for num in nums {
                if num <= mid {
                    count = count + 1
                }
            }
            
            if count > mid {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
