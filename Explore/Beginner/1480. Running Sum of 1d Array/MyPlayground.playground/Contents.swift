/*
 Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

 Return the running sum of nums.

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: [1,3,6,10]
 Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
 Example 2:

 Input: nums = [1,1,1,1,1]
 Output: [1,2,3,4,5]
 Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
 Example 3:

 Input: nums = [3,1,2,10,1]
 Output: [3,4,6,16,17]
 */

class Solution1 {
    func runningSum(_ nums: [Int]) -> [Int] {
        var tmpNums = nums
        var tmpSum: Int = 0
        
        for (index, value) in nums.enumerated() {
            tmpSum = value + tmpSum
            tmpNums[index] = tmpSum
        }
        return tmpNums
    }
}

class Solution2 {
    func runningSum(_ nums: [Int]) -> [Int] {
        var tmpNums = nums
        for i in 0..<nums.count - 1 {
            tmpNums[i + 1] = tmpNums[i] + tmpNums[i + 1]
        }
        return tmpNums
    }
}

