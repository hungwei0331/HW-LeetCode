
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

// 90 ms, faster than 30.31% of Swift online submissions for Two Sum.
// kind of bubble sort

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var fristIndex: Int = 0
    var secondIndex: Int = 0
    
    for (index, value) in nums.enumerated() {
        
        let nextIndex = index + 1
        
        for nextIndex in nextIndex..<nums.count {
            
            if value + nums[nextIndex] == target {
                fristIndex = index
                secondIndex = nextIndex
            }
        }
        
    }
    return [fristIndex, secondIndex]
}

twoSum(nums, target)


