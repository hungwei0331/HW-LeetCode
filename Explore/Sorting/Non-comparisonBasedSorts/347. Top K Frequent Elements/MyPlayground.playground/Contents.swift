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
        var freqDict = [Int: Int]()
        for num in nums {
            freqDict[num, default: 0] += 1
        }
        
        var bucket = Array(repeating: [Int](), count: nums.count + 1)
        for (num, freq) in freqDict {
            bucket[freq].append(num)
        }
        
        var result = [Int]()
        for freq in (0..<bucket.count).reversed() {
            for num in bucket[freq] {
                result.append(num)
                if result.count == k {
                    return result
                }
            }
        }
        return result
    }
}

var nums = [1,1,1,2,2,3], k = 2
let result = Solution().topKFrequent(nums, k)
print(result)
print()
