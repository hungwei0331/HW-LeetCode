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

// TC: O(nlogn) SC: O(logn)
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return nums }
        var nums = nums
        
        func maxHeapify(_ heapSize: Int, _ index: Int) {
            let left  = 2 * index + 1
            let right = 2 * index + 2
            var largest = index
            
            if left < heapSize && nums[left] > nums[largest] {
                largest = left
            }
            
            if right < heapSize && nums[right] > nums[largest] {
                largest = right
            }
            
            if largest != index {
                nums.swapAt(index, largest)
                maxHeapify(heapSize, largest)
            }
        }
        
        let startIndex = nums.count / 2 - 1
        for i in (0...startIndex).reversed() {
            maxHeapify(nums.count, i)
        }
        
        for i in (1...(nums.count - 1)).reversed() {
            nums.swapAt(0, i)
            maxHeapify(i, 0)
        }
        
        return nums
    }
}

var nums = [5,2,3,1]
let result = Solution().sortArray(nums)
print(result)
print()
