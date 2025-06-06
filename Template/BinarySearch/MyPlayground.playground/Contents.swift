/*
 Binary Search
 */

//TC: O(logn), SC: O(1)
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                return mid
            }
        }
        
        return -1
    }
}

var nums = [-1,0,3,5,9,12], target = 9
let result = Solution().search(nums, target)
