/*
 Companies
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
 */

// TC: O(n log n + m log m) SC: O(n + m)
//Time Complexity: O(nlogn+mlogm), where n and m are the lengths of the arrays. We sort two arrays independently, and then do a linear scan.

//Space Complexity: from O(logn+logm) to O(n+m), depending on the implementation of the sorting algorithm. For the complexity analysis purposes, we ignore the memory required by inputs and outputs.

class Solution1 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var sortedNums1 = nums1.sorted()
        var sortedNums2 = nums2.sorted()
        var nums1pointer = 0
        var nums2pointer = 0
        var result = [Int]()
        
        while nums1pointer < nums1.count && nums2pointer < nums2.count {
            if sortedNums1[nums1pointer] == sortedNums2[nums2pointer] {
                result.append(sortedNums1[nums1pointer])
                nums1pointer = nums1pointer + 1
                nums2pointer = nums2pointer + 1
            } else if sortedNums1[nums1pointer] < sortedNums2[nums2pointer] {
                nums1pointer = nums1pointer + 1
            } else {
                nums2pointer = nums2pointer + 1
            }
        }
        return result
    }
}

// TC: O(n log n + m log m) SC: O(n + m)
//Time Complexity: O(n+m), where n and m are the lengths of the arrays. We iterate through the first, and then through the second array; insert and lookup operations in the hash map take a constant time.

//Space Complexity: O(min(n,m)). We use hash map to store numbers (and their counts) from the smaller array.

class Solution2 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        
        for num in nums1 {
            dict[num] = (dict[num] ?? 0) + 1
        }
        
        var result = [Int]()
        for num in nums2 {
            if let index = dict[num], index > 0 {
                result.append(num)
                dict[num] = dict[num]! - 1
            }
        }
        return result
    }
}
