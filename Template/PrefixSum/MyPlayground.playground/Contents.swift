// PrefixSum
// formula: prefixSum[i] = prefixSum[i - 1] + nums[i - 1]
//          sum(l, r) = prefixSum[r + 1] - prefixSum[l]
// TC: O(n + q), where q is quiries times, SC: O(n)
class Solution {
    func rangeSum(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var prefixSum = [Int](repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            prefixSum[i] = prefixSum[i - 1] + nums[i - 1]
        }
        
        var result = [Int]()
        for query in queries {
            let l = query[0]
            let r = query[1]
            let sum = prefixSum[r + 1] - prefixSum[l]
            result.append(sum)
        }
        return result
    }
}

let nums = [1, 2, 3, 4, 5]
let queries = [[0, 2], [1, 3], [0, 4]]
let result = Solution().rangeSum(nums, queries)
print(result) // [6, 9, 15]
