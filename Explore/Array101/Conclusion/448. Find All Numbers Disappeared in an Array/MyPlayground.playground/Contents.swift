/*
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

 Example 1:
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 
 Example 2:
 Input: nums = [1,1]
 Output: [2]
 */

// Set solution, TC(n) SC(n)
class Solution1 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var set = Set<Int>(nums)
        
        for num in 1...nums.count {
            if !set.contains(num) {
                result.append(num)
            }
        }
        return result
    }
}

// Index solution, TC(n) SC(1)
// Technically this problem cannot be done in O(1) space in Swift since we must create a new array. This could be done in O(1) space only if we had _ nums: inout [Int] in the method signature.
class Solution2 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        
        for i in 0..<nums.count {
            let index = abs(nums[i]) - 1
            if nums[index] >= 0 {
                nums[index] = nums[index] * -1
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] > 0 {
                result.append(i + 1)
            }
        }
        return result
    }
}

//let result1 = Solution1().findDisappearedNumbers([4,3,2,7,8,2,3,1])
//print(result1)

let result2 = Solution2().findDisappearedNumbers([4,3,2,7,8,2,3,1])
print(result2)
