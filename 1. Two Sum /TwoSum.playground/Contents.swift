
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.

/*
Example:
Given nums = [2, 7, 11, 15], target = 9,
Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/

//let nums   = [2, 7, 11, 15]
//let target = 9

let nums   = [3,2,4]
let target = 6

// kind of bubble sort
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, value) in nums.enumerated() {
        let tmpTarget = target - value
        let nextIndex = index + 1
        for tmpIndex in nextIndex..<nums.count {
            if ((tmpTarget - nums[tmpIndex]) == 0) {
                return [index, tmpIndex]
            }
        }
    }
    return[0]
}

twoSum(nums, target)
