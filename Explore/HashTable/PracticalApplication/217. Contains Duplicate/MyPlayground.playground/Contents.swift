/*
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

 Example 1:
 Input: nums = [1,2,3,1]
 Output: true
 
 Example 2:
 Input: nums = [1,2,3,4]
 Output: false
 
 Example 3:
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */

// Linear Search
// TC: O(N^2) SC: O(1)
class Solution1 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] == nums[j] {
                    return true
                }
            }
        }
        return false
    }
}

// Hash Table
// TC: O(n) SC: O(n)
class Solution2 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}

// Sort
// TC: O(nLogn) SC: O(1)
class Solution3 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var nums = nums.sorted(by: <)
        
        for i in 0..<nums.count - 1 {
            if nums[i] == nums[i + 1] {
                return true
            }
        }
        return false
    }
}

let result1 = Solution1().containsDuplicate([1,2,3,1])
print(result1)

let result2 = Solution1().containsDuplicate([1,2,3,1])
print(result2)

let result3 = Solution1().containsDuplicate([1,2,3,1])
print(result3)
