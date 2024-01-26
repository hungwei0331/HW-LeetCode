/*
 Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.

 Example 1:
 Input: nums = [3,2,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2.
 The third distinct maximum is 1.
 
 Example 2:
 Input: nums = [1,2]
 Output: 2
 Explanation:
 The first distinct maximum is 2.
 The second distinct maximum is 1.
 The third distinct maximum does not exist, so the maximum (2) is returned instead.
 
 Example 3:
 Input: nums = [2,2,3,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2 (both 2's are counted together since they have the same value).
 The third distinct maximum is 1.
 */

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        
        if nums.count < 3 { return nums.max() ?? 0}
        
        var max = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for num in nums {
            
            if num == max || num == max2 || num == max3 { continue }
            
            if num > max {
                max3 = max2
                max2 = max
                max = num
            } else if num > max2 {
                max3 = max2
                max2 = num
            } else if num > max3 {
                max3 = num
            }
        }
        
        if max3 != Int.min {
            return max3
        } else {
            return nums.max() ?? 0
        }
    }
}

//let result = Solution().thirdMax([3,2,1])
//let result = Solution().thirdMax([1,2])
let result = Solution().thirdMax([2,2,3,1])
print(result)
