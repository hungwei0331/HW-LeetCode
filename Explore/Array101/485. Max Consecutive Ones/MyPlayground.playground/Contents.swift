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

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxConsecutive = 0
        var count = 0
        
        for num in nums {
            if num == 1 {
                count = count + 1
            } else {
                maxConsecutive = max(maxConsecutive, count)
                count = 0
            }
        }
        return max(maxConsecutive, count)
    }
}

let result = Solution().findMaxConsecutiveOnes([1])
print("result", result)
