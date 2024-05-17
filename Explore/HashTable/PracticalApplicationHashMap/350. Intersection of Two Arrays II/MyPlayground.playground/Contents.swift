/*
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
 
 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
 */

// TC: O(n + m) SC: O(min(n, m))

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        var result = [Int]()
        
        for num in nums1 {
            dict[num] = (dict[num] ?? 0 ) + 1
        }
        
        for num in nums2 {
            if let index = dict[num], index > 0 {
                result.append(num)
                dict[num] = dict[num]! - 1
            }
        }
        return result
    }
}

