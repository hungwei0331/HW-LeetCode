/*
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

 Example 1:
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 Example 2:
 Input: nums = [1], k = 1
 Output: [1]
 */

// TC: O(nlogn) SC: O(n)

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        var result = [Int]()
        
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        let sortDict = dict.sorted{ $0.value > $1.value }
        
        for i in 0..<k {
            result.append(sortDict[i].key)
        }
        return result
    }
}
