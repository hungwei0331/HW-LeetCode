/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.

 Example 1:
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 
 Example 2:
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 
 Example 3:
 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.

 Constraints:
 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

// TC: O(n^2), we have outer and inner loops, each going through n elements.
// SC: O(n), we have a arrat/set to store n triplets

// sorting first, to avoid duplicate triplets
// fixed one num each time
// get the remain two number from left to right
// if the result equal 0, then add to array

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        
        var result = [[Int]]()
        
        for (index, value) in nums.enumerated() {
            var left = index + 1
            var right = nums.count - 1
            
            if index > 0 && nums[index] == nums[index - 1] {
                continue
            }
            
            while left < right {
                let sum = value + nums[left] + nums[right]
                
                if sum > 0 {
                    right = right - 1
                } else if sum < 0 {
                    left = left + 1
                } else {
                    result.append([value, nums[left], nums[right]])
                    
                    if left < right && nums[left] == nums[left + 1] {
                        left = left + 1
                    }
                    
                    if left < right && nums[right] == nums[right - 1] {
                        right = right - 1
                    }
                    
                    left = left + 1
                    right = right - 1
                }
            }
        }
        return result
    }
}


class Solution1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var result = Set<[Int]>()
        
        for (index, value) in nums.enumerated() {
            var left = index + 1
            var right = nums.count - 1
        
            
            while left < right {
                let sum = value + nums[left] + nums[right]
                
                if sum > 0 {
                    right = right - 1
                } else if sum < 0 {
                    left = left + 1
                } else {
                    result.insert([value, nums[left], nums[right]])
                    left = left + 1
                    right = right - 1
                }
            }
        }
        return Array(result)
    }
}
