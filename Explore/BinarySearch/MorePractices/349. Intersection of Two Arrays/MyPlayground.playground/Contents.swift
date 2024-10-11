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

//TC: O(n + m) SC: O(n)
//Time complexity: O(n+m), where n and m are the arrays' lengths. O(n) time is used to convert nums1 into a set, O(m) time is used to convert nums2, and contains/in operations are O(1) in the average case.

//Space complexity: O(m+n) because in the worst case, when all elements in the arrays are unique, n space is used to store set1 and m space is used to store set2.

class Solution1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set1 = Set<Int>(nums1)
        var set2 = Set<Int>(nums2)
        return Array(set1.intersection(set2))
    }
}

//TC: O(nlogn) SC: O(n)
// sort is O(m log m), where m is the nums2 length
// binary search for each element in nums1 is O(n log m), where n is the nums1 length
// O(m log m + n log m)
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set = Set<Int>()
        let sortedNums2 = nums2.sorted()
        for num in nums1 {
            if binarySearch(sortedNums2, num) {
                set.insert(num)
            }
        }
        return Array(set)
    }
    
    func binarySearch(_ nums: [Int], _  target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                return true
            }
            
            if nums[mid] > target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}

var nums1 = [2,1], nums2 = [1,2]
//var nums1 = [1,2,2,1], nums2 = [2,2]
//var nums1 = [4,9,5], nums2 = [9,4,9,8,4]
let result = Solution().intersection(nums1, nums2)
print(result)
