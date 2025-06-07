/*
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

 We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

 You must solve this problem without using the library's sort function.

 Example 1:
 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 
 Example 2:
 Input: nums = [2,0,1]
 Output: [0,1,2]

 Constraints:
 n == nums.length
 1 <= n <= 300
 nums[i] is either 0, 1, or 2.
  
 Follow up: Could you come up with a one-pass algorithm using only constant extra space?
 */

// Selection Sorting
// TC: O(n^2), SC: O(1)
class Solution1 {
    func sortColors(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            var index = i
            while index > 0 && nums[index] > nums[index - 1] {
                nums.swapAt(index, index - 1)
                index = index - 1
            }
        }
    }
}

// One-Pass
// TC: O(n), SC: O(1)
class Solution2 {
    func sortColors(_ nums: inout [Int]) {
        var begin = 0
        var current = 0
        var end = nums.count - 1

        while current <= end {
            if nums[current] == 0 {
                nums.swapAt(begin, current)
                begin = begin + 1
                current = current + 1
            } else if nums[current] == 1 {
                current = current + 1
            } else if nums[current] == 2 {
                nums.swapAt(end, current)
                end = end - 1
            }
        }
    }
}
