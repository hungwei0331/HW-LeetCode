/*
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].

 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 
 Example 3:
 Input: nums = [], target = 0
 Output: [-1,-1]
 */

// TC: O(logN) SC: O(1)
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        let left = binarySearch(nums, target, isSearchLeft: true)
        let right = binarySearch(nums, target, isSearchLeft: false)
        
        return [left, right]
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, isSearchLeft: Bool) -> Int {
        var left = 0
        var right = nums.count - 1
        var targetIndex = -1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                targetIndex = mid
                if isSearchLeft {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return targetIndex
    }
}
