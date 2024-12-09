/*
 An array is considered special if every pair of its adjacent elements contains two numbers with different parity.
 You are given an array of integer nums and a 2D integer matrix queries, where for queries[i] = [fromi, toi] your task is to check that
 subarray
  nums[fromi..toi] is special or not.
 Return an array of booleans answer such that answer[i] is true if nums[fromi..toi] is special.

 Example 1:
 Input: nums = [3,4,1,2,6], queries = [[0,4]]
 Output: [false]
 Explanation:
 The subarray is [3,4,1,2,6]. 2 and 6 are both even.

 Example 2:
 Input: nums = [4,3,1,6], queries = [[0,2],[2,3]]
 Output: [false,true]

 Explanation:
 The subarray is [4,3,1]. 3 and 1 are both odd. So the answer to this query is false.
 The subarray is [1,6]. There is only one pair: (1,6) and it contains numbers with different parity. So the answer to this query is true.
 */

// TC: O(n + q), where q is quiries times, SC: O(n)
class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var result = [Bool]()
        var sameParity = [Int](repeating: 0, count: nums.count)
        var prefixSum = [Int](repeating: 0, count: nums.count + 1)
        
        for i in 1..<nums.count {
            if nums[i] % 2 == nums[i - 1] % 2  {
                sameParity[i] = 1
            }
        }
        
        for i in 1...nums.count {
            prefixSum[i] = prefixSum[i - 1] + sameParity[i - 1]
        }
        
        for query in queries {
            let l = query[0]
            let r = query[1]
            let count = prefixSum[r + 1] - prefixSum[l + 1]
            result.append(count == 0)
        }
        return result
    }
}

// PrefixSum
// formula: prefixSum[i] = prefixSum[i - 1] + nums[i - 1]
//          sum(l, r) = prefixSum[r + 1] - prefixSum[l]


class Solution1 {
    func rangeSum(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var prefixSum = [Int](repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            prefixSum[i] = prefixSum[i - 1] + nums[i - 1]
        }
        
        var result = [Int]()
        for querie in queries {
            let l = querie[0]
            let r = querie[1]
            let sum = prefixSum[r + 1] - prefixSum[l]
            result.append(sum)
        }
        return result
    }
}

let nums = [1, 2, 3, 4, 5]
let queries = [[0, 2], [1, 3], [0, 4]]
let result = Solution1().rangeSum(nums, queries)
print(result) // [6, 9, 15]
