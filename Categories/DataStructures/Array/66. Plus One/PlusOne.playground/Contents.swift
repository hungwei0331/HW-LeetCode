/*
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

 Increment the large integer by one and return the resulting array of digits.
*/

/*
 Example 1:

 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 Example 2:

 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 Example 3:

 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
*/

//Runtime: 6 ms, faster than 53.86% of Swift online submissions for Plus One.
//Memory Usage: 14.1 MB, less than 63.91% of Swift online submissions for Plus One.

import Foundation

var digits = [1,2,3]

//var digits = [9, 9, 9]
//var digits = [1, 0, 0, 0]

//case 1
// [1, 2, 3] -> [1, 2, 4]

//case 2
// [1, 1, 9] -> [1, 2, 0]

//case 3
// [9, 9, 9] -> [1, 0, 0, 0]

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var nums = digits

        //[1, 2, 3] -> [3, 2, 1]
        for i in (0..<nums.count).reversed() {
            
            if nums[i] == 9 {
                //case 2
                nums[i] = 0
            } else {
                //case 1
                nums[i] =  nums[i] + 1
                return nums
            }
        }
        
        if nums.first == 0 {
            //case 3
            nums.insert(1, at: 0)
        }

        return nums
    }
}

Solution().plusOne(digits)

