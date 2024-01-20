/*
 Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.

 Return any array that satisfies this condition.

  

 Example 1:
 Input: nums = [3,1,2,4]
 Output: [2,4,3,1]
 Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 
 Example 2:
 Input: nums = [0]
 Output: [0]
 */

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        
        if nums.count == 1 { return nums }

        var ans = nums
        var writer = 0
        
        for reader in 0..<ans.count {
            
            if ans[reader] % 2 == 0 {
                ans.swapAt(reader, writer)
                writer = writer + 1
            }
        }
        return ans
    }
}

let result = Solution().sortArrayByParity([3,1,2,4])
print(result)
