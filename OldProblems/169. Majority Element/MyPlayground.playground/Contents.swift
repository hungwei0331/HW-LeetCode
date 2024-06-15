/*
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
 */

/*
 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2
 */

/*
 Step1. for loop for each element
 Step2. for loop in first for-loop
 Step3. once count > appearCount then get the result
 */

import Foundation


class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        
        let appearCount = nums.count / 2
        
        for i in nums {
            var count = 0
            
            for j in nums {
                if j == i {
                    count += 1
                }
            }
            
            if count > appearCount {
                return i
            }
        }
        
        return 1
    }
}


var nums = [2,2,1,1,1,2,2]
print(Solution().majorityElement(nums))

