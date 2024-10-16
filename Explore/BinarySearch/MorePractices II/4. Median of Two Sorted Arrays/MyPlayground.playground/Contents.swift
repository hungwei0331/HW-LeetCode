/*

 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
 The overall run time complexity should be O(log (m+n)).

 Example 1:
 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 
 Example 2:
 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 */

// Merge Sort
// TC: O((m + n) log(m + n)) SC: O(n)
class Solution1 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var merged = nums1 + nums2
        
        merged.sort()
        let total = merged.count
        
        if merged.count % 2 == 0 {
            let middle1 = merged[total / 2]
            let middle2 = merged[total / 2 - 1]
            return Double(middle1 + middle2) / 2.0
        } else {
            return Double(merged[total / 2])
        }
    }
}

// Binary Search
// TC: O(log(m + n)) SC: O(1)
class Solution2 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n1 = nums1.count
        let n2 = nums2.count
        
        if n1 > n2 {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let totalLength = n1 + n2
        let leftSize = (n1 + n2 + 1) / 2
        var low = 0
        var high = n1
        
        while low <= high {
            let mid1 = (low + high) / 2
            let mid2 = leftSize - mid1
            
            let l1 = mid1 > 0 ? nums1[mid1 - 1] : Int.min
            let l2 = mid2 > 0 ? nums2[mid2 - 1] : Int.min
            let r1 = mid1 < n1 ? nums1[mid1] : Int.max
            let r2 = mid2 < n2 ? nums2[mid2] : Int.max
            
            if l1 <= r2 && l2 <= r1 {
                if totalLength % 2 == 0 {
                    return Double(max(l1, l2) + min(r1, r2)) / 2.0
                } else {
                    return Double(max(l1, l2))
                }
            } else if l1 > r2 {
                high = mid1 - 1
            } else {
                low = mid1 + 1
            }
        }
        return 0.0
    }
}
