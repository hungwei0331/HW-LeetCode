/*
 Given an integer array nums and an integer k, return the kth largest element in the array.
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 Can you solve it without sorting?

 Example 1:
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 
 Example 2:
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
 */

import HeapModule

// Sorting
// TC: O(nlolgn) SC: O(n)
class Solution1 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sorted = nums.sorted(by: <)
        return sorted[nums.count - k]
    }
}

// Heap
// TC: O(nlolgk) SC: O(k)
class Solution2 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>()
        
        for num in nums {
            heap.insert(num)
            if heap.count > k {
                heap.popMin()
            }
        }
        return heap.min!
    }
}
