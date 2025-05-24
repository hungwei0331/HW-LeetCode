/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:
 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 
 Example 2:
 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
  
 Constraints:
 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The input is generated such that answer[i] is guaranteed to fit in a 32-bit integer.
  
 Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
 */

// Brute Force
// TC: O(n^2), SC: O(n)
class Solution1 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: nums.count)
        
        for i in 0..<nums.count {
            var product = 1
            
            for j in 0..<nums.count {
                if i != j {
                    product = product * nums[j]
                }
                result[i] = product
            }
        }
        return result
    }
}

// Prefix Sum
// TC: O(n), SC: O(n)
class Solution2 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefix = [Int](repeating: 1, count: nums.count)
        var suffix = [Int](repeating: 1, count: nums.count)
        var result = [Int](repeating: 1, count: nums.count)

        for i in 1..<nums.count {
            prefix[i] = prefix[i - 1] * nums[i - 1]
        }

        for i in (0..<nums.count - 1).reversed() {
            suffix[i] = suffix[i + 1] * nums[i + 1]
        }

        for i in 0..<nums.count {
            result[i] = prefix[i] * suffix[i]
        }
        return result
    }
}
