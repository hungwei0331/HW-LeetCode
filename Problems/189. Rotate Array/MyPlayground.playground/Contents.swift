/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

 Example 1:
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 
 Example 2:
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
  
 Constraints:
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
 */

// A = [1, 2, 3, 4, 5]，n = 5
// left  rotate: B = [3, 4, 5, 1, 2]
// right rotate: B = [4, 5, 1, 2, 3]

// step 0: [1, 2, 3, 4, 5, 6, 7]
// step 1: reverse(&nums, 0, nums.count - 1), [7, 6, 5, 4, 3, 2, 1]
// Step 2: reverse(&nums, 0, k - 1),          [5, 6, 7, 1, 2, 3, 4]
// Step 3: reverse(&nums, k, nums.count - 1), [5, 6, 7, 4, 3, 2, 1]

// right rotate
// TC: O(n), SC: O(1)
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }

    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            nums.swapAt(start, end)
            start = start + 1
            end = end - 1
        }
    }
}

// A = [1, 2, 3, 4, 5]，n = 5
// left  rotate: B = [3, 4, 5, 1, 2]
// right rotate: B = [4, 5, 1, 2, 3]

// step 0: [1, 2, 3, 4, 5, 6, 7]
// step 1: reverse(&nums, 0, nums.count - 1), [3, 2, 1, 4, 5, 6, 7]
// Step 2: reverse(&nums, 0, k - 1),          [3, 2, 1, 7, 6, 5, 4]
// Step 3: reverse(&nums, k, nums.count - 1), [4, 5, 6, 7, 1, 2, 3]

// left rotate
// TC: O(n), SC: O(1)
class Solution1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
        reverse(&nums, 0, nums.count - 1)
    }

    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            nums.swapAt(start, end)
            start = start + 1
            end = end - 1
        }
    }
}
