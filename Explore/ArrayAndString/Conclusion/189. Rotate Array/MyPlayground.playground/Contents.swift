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
 */

// Brute force
// TC: O(n * K) SC: O(1)
class Solution1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        for i in 0..<k {
            var previous = nums[nums.count - 1]
            
            for j in 0..<nums.count {
                var tmp = nums[j]
                nums[j] = previous
                previous = tmp
            }
        }
    }
}

// Using Reverse
// [1 2 3 4 5 6 7] -> [7, 6, 5, 4, 3, 2, 1] -> 
// [5, 6, 7, 4, 3, 2, 1] -> [5, 6, 7, 1, 2, 3, 4]
// TC: O(n) SC: O(1)
class Solution2 {
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
            var tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp
            
            start = start + 1
            end = end - 1
        }
    }
}

var nums = [1,2,3,4,5,6,7], k = 3
//var nums = [-1,-100,3,99], k = 2

//Solution1().rotate(&nums, k)
Solution2().rotate(&nums, k)

print(nums)
