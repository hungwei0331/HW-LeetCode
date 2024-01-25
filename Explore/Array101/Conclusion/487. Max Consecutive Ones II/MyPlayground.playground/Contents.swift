/*
 Given a binary array nums, return the maximum number of consecutive 1's in the array if you can flip at most one 0.

 Example 1:
 Input: nums = [1,0,1,1,0]
 Output: 4
 Explanation:
 - If we flip the first zero, nums becomes [1,1,1,1,0] and we have 4 consecutive ones.
 - If we flip the second zero, nums becomes [1,0,1,1,1] and we have 3 consecutive ones.
 The max number of consecutive ones is 4.
 
 Example 2:
 Input: nums = [1,0,1,1,0,1]
 Output: 4
 Explanation:
 - If we flip the first zero, nums becomes [1,1,1,1,0,1] and we have 4 consecutive ones.
 - If we flip the second zero, nums becomes [1,0,1,1,1,1] and we have 4 consecutive ones.
 The max number of consecutive ones is 4.
 */

class Solution {
    // Brute force
    func findMaxConsecutiveOnes1(_ nums: [Int]) -> Int {
        var maxLength = 0

        for left in 0..<nums.count {
            var zeroCount = 0
            for right in left..<nums.count {
                
                if nums[right] == 0 {
                    zeroCount = zeroCount + 1
                }
                
                if zeroCount <= 1 {
                    maxLength = max(maxLength, right - left + 1)
                }
            }
        }
        return maxLength
    }
    
    //Sliding Window
    func findMaxConsecutiveOnes2(_ nums: [Int]) -> Int {
        var maxLength = 0
        var left = 0
        var right = 0
        var zeroCount = 0
        
        while (right < nums.count) {
            
            if nums[right] == 0 {
                zeroCount = zeroCount + 1
            }
            
            while (zeroCount == 2) {
                if nums[left] == 0 {
                    zeroCount = zeroCount - 1
                }
                left = left + 1
            }
            
            maxLength = max(maxLength, right - left + 1)
            right = right + 1
        }
        return maxLength
    }
}

let result1 = Solution().findMaxConsecutiveOnes1([1,0,1,1,0])
//let result1 = Solution().findMaxConsecutiveOnes1([1,0,1,1,0,1])
print(result1)

let result2 = Solution().findMaxConsecutiveOnes2([1,0,1,1,0])
//let result2 = Solution().findMaxConsecutiveOnes2([1,0,1,1,0,1])
print(result2)

