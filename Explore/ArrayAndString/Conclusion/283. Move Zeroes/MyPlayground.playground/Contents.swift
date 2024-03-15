/*
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Example 2:
 Input: nums = [0]
 Output: [0]
 */

// TC: O(N) SC: O(1)
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                j = j + 1
            }
        }
        
        while j < nums.count {
            nums[j] = 0
            j = j + 1
        }
    }
}

var nums = [0,1,0,3,12]
//var nums = [0]

Solution().moveZeroes(&nums)
print(nums)
