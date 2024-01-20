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

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var writer = 0
        
        for reader in 0..<nums.count {
            if nums[reader] != 0 {
                nums[writer] = nums[reader]
                writer = writer + 1
            }
        }
        
        while writer < nums.count {
            nums[writer] = 0
            writer = writer + 1
        }
    }
}

var nums = [0,1,0,3,12]
Solution().moveZeroes(&nums)
print(nums)

