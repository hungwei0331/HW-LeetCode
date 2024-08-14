/*
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

 Example 1:
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 Example 2:
 Input: nums = [1], k = 1
 Output: [1]
 */

// TC: O(n) SC: O(n)

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqMap = [Int: Int]()
        
        for num in nums {
            freqMap[num, default: 0] += 1
        }
        
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        for (num, freq) in freqMap {
            buckets[freq].append(num)
        }
        
        var result = [Int]()
        for i in (0..<buckets.count).reversed() {
            result += buckets[i]
            if result.count == k {
                break
            }
        }
        return result
    }
}
