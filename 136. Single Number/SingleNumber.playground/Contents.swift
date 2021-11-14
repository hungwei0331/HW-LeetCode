//Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//You must implement a solution with a linear runtime complexity and use only constant extra space.

/*
 Example 1:
 Input: nums = [2,2,1]
 Output: 1

 Example 2:
 Input: nums = [4,1,2,1,2]
 Output: 4

 Example 3:
 Input: nums = [1]
 Output: 1
*/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count != 1 else { return nums.first! }
        
        var numsSet: Set<Int> = []
         
        for (_, value) in nums.enumerated() {
            if numsSet.contains(value) {
                numsSet.remove(value)
            } else {
                numsSet.insert(value)
            }
        }
        return numsSet.first!
    }
}

let nums = [2,2,1]
//let nums = [4,1,2,1,2]
//let nums = [1]

Solution().singleNumber(nums)




