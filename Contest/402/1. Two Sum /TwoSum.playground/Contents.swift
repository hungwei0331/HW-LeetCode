
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.

/*
 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]
*/

//let nums   = [2, 7, 11, 15]
//let target = 9

let nums   = [3,2,4]
let target = 6

class Solution1 {
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
}

class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index, value) in nums.enumerated() {
            if let tmpIndex = dict[target - value] {
                return [index, tmpIndex]
            }
            dict[value] = index
        }
        return [0]
    }
}

let result = Solution2().twoSum([2,7,11,15], 9)


