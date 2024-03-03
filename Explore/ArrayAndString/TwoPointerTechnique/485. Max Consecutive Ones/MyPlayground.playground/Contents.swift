/*
 Given a binary array nums, return the maximum number of consecutive 1's in the array.
 
 Example 1:
 Input: nums = [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
 
 Example 2:
 Input: nums = [1,0,1,1,0,1]
 Output: 2
 */

// TC: O(n) SC: O(1)
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        
        var count = 0
        var maxCount = 0
        
        for i in 0..<nums.count {
            if nums[i] == 1 {
                count = count + 1
            } else {
                maxCount = max(maxCount, count)
                count = 0
            }
        }
        return max(maxCount, count)
    }
}

let result = Solution().findMaxConsecutiveOnes([1,1,0,1,1,1])
//let result = Solution().findMaxConsecutiveOnes( [1,0,1,1,0,1])
print(result)
