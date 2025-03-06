/*
 Given an array of integers nums, sort the array in ascending order and return it.

 You must solve the problem without using any built-in functions in O(nlog(n)) time complexity and with the smallest space complexity possible.

 Example 1:
 Input: nums = [5,2,3,1]
 Output: [1,2,3,5]
 Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
 
 Example 2:
 Input: nums = [5,1,1,2,0,0]
 Output: [0,0,1,1,2,5]
 Explanation: Note that the values of nums are not necessairly unique.
  
 Constraints:
 1 <= nums.length <= 5 * 104
 -5 * 104 <= nums[i] <= 5 * 104
 */

// TC: O(nlogn), SC: O(n)
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return nums }
        
        let mid = nums.count / 2
        let left = sortArray(Array(nums[0..<mid]))
        let right = sortArray(Array(nums[mid...]))
        
        return merge(left, right)
    }
    
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var merge = [Int]()
        var i = 0, j = 0
        
        while i < left.count && j < right.count {
            if left[i] <= right[j] {
                merge.append(left[i])
                i = i + 1
            } else {
                merge.append(right[j])
                j = j + 1
            }
        }
        
        while i < left.count {
            merge.append(left[i])
            i = i + 1
        }
        
        while j < right.count {
            merge.append(right[j])
            j = j + 1
        }
        return merge
    }
}
