/*
 Given two integer arrays nums1 and nums2, return an array of their
 intersection
 . Each element in the result must be unique and you may return the result in any order.

 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Explanation: [4,9] is also accepted.
 */

// TC: O(N + M), where n and m are the arrays' lengths in the average case
// SC: O(N + M), n space is used to store set1 and m space is used to store set2
class Solution1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set1 = Set(nums1)
        var set2 = Set(nums2)
        return Array(set1.intersection(set2))
    }
}
