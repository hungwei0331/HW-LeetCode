/*
 Given an array nums of integers, return how many of them contain an even number of digits.

 Example 1:
 Input: nums = [12,345,2,6,7896]
 Output: 2
 Explanation:
 12 contains 2 digits (even number of digits).
 345 contains 3 digits (odd number of digits).
 2 contains 1 digit (odd number of digits).
 6 contains 1 digit (odd number of digits).
 7896 contains 4 digits (even number of digits).
 Therefore only 12 and 7896 contain an even number of digits.
 
 Example 2:
 Input: nums = [555,901,482,1771]
 Output: 1
 Explanation:
 Only 1771 contains an even number of digits.
 */

class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var totalEvens = 0
        
        for num in nums {
            
            var tmpNum = num
            var digits = 0
            
            while tmpNum != 0 {
                tmpNum = tmpNum / 10
                digits = digits + 1
            }
            
            if digits % 2 == 0 {
                totalEvens = totalEvens + 1
            }
        }
        return totalEvens
    }
}

let result = Solution().findNumbers([555,901,482,1771])
print("result", result)
