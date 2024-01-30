/*
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

 Example 1:
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 
 Example 2:
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
 */

// TC: O(nLogn) SC: O(n)
class Solution1 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        
        for i in 0..<nums.count {
            result.append(nums[i] * nums[i])
        }
        result.sort(by: <)
        return result
    }
}

// TC: O(n) SC: O(n)
class Solution2 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            if nums[left] * nums[left] < nums[right] * nums[right] {
                result.append(nums[right] * nums[right])
                right = right - 1
            } else {
                result.append(nums[left] * nums[left])
                left = left + 1
            }
        }
        return result.reversed()
    }
}

let result1 = Solution1().sortedSquares([-4,-1,0,3,10])
print(result1)

let result2 = Solution2().sortedSquares([-4,-1,0,3,10])
print(result2)
