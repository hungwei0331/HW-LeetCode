/*
 Given four integer arrays nums1, nums2, nums3, and nums4 all of length n, return the number of tuples (i, j, k, l) such that:

 0 <= i, j, k, l < n
 nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0
  

 Example 1:
 Input: nums1 = [1,2], nums2 = [-2,-1], nums3 = [-1,2], nums4 = [0,2]
 Output: 2
 Explanation:
 The two tuples are:
 1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
 2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0
 
 Example 2:
 Input: nums1 = [0], nums2 = [0], nums3 = [0], nums4 = [0]
 Output: 1
 */

// TC: O(n^2), SC: O(n^2)

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        
        var sumMap = [Int: Int]()
        var count = 0
        
        for num1 in nums1 {
            for num2 in nums2 {
                let sum = num1 + num2
                sumMap[sum, default: 0] += 1
            }
        }
        
        for num3 in nums3 {
            for num4 in nums4 {
                let sum = -(num3 + num4)
                if let targetCount = sumMap[sum] {
                    count = count + targetCount
                }
            }
        }
        return count
    }
}
