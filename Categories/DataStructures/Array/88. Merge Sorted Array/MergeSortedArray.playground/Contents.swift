/*
You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

Merge nums1 and nums2 into a single array sorted in non-decreasing order.

The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
*/

/*
 Example 1:

 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 Example 2:

 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
 Explanation: The arrays we are merging are [1] and [].
 The result of the merge is [1].
 Example 3:

 Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 Output: [1]
 Explanation: The arrays we are merging are [] and [1].
 The result of the merge is [1].
 Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
 */

//Runtime: 97 ms, faster than 5.78% of Swift online submissions for Merge Sorted Array.
//Memory Usage: 14.4 MB, less than 15.92% of Swift online submissions for Merge Sorted Array.

/*
 Step1. merge nums2 to nums1
 Step2. sort num1 after merged
 */

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
 
        var i = m
        
        if !nums2.isEmpty {
            for index in 0..<nums2.count  {
                nums1[i] = nums2[index]
                i = i + 1
            }
        }
        nums1.sort()
    }
}

var num1 = [1,2,3,0,0,0]
var m = 3
var num2 = [2,5,6]
var n = 3

print(Solution().merge(&num1, m, num2, n))
