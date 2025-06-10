/*
 Given an array nums, return true if the array was originally sorted in non-decreasing order, then rotated some number of positions (including zero). Otherwise, return false.

 There may be duplicates in the original array.

 Note: An array A rotated by x positions results in an array B of the same length such that B[i] == A[(i+x) % A.length] for every valid index i.

 Example 1:
 Input: nums = [3,4,5,1,2]
 Output: true
 Explanation: [1,2,3,4,5] is the original sorted array.
 You can rotate the array by x = 3 positions to begin on the element of value 3: [3,4,5,1,2].
 
 Example 2:
 Input: nums = [2,1,3,4]
 Output: false
 Explanation: There is no sorted array once rotated that can make nums.
 
 Example 3:
 Input: nums = [1,2,3]
 Output: true
 Explanation: [1,2,3] is the original sorted array.
 You can rotate the array by x = 0 positions (i.e. no rotation) to make nums.
 */

// B[i] == A[(i+x) % A.length]
// A = [10, 20, 30, 40, 50]
// x = 2 （rotated right two times）
// B[0] = A[(0 + 2) % 5] = A[2] = 30
// B[1] = A[(1 + 2) % 5] = A[3] = 40
// B[2] = A[(2 + 2) % 5] = A[4] = 50
// B[3] = A[(3 + 2) % 5] = A[0] = 10
// B[4] = A[(4 + 2) % 5] = A[1] = 20

// connect two nums into one array
// [3, 4, 5, 1, 2] + [3, 4, 5, 1, 2]
// [3, 4, 5, 1, 2, 3, 4, 5, 1, 2] then find the ascending [1, 2, 3, 4, 5]
// TC: O(n), SC: O(n)
class Solution1 {
    func check(_ nums: [Int]) -> Bool {
        if nums.count == 1 { return true }
        
        var tmpNums = nums + nums
        var count = 1
        
        for i in 1..<tmpNums.count {
            if tmpNums[i - 1] < tmpNums[i] {
                count = count + 1
            } else {
                count = 1
            }
            if count == nums.count {
                return true
            }
        }
        return false
    }
}

// compare array like cycle
// the rotated situation will be only once
// TC: O(n), SC: O(1)
class Solution2 {
    func check(_ nums: [Int]) -> Bool {
        var count = 0
        for i in 0..<nums.count {
            if nums[i] > nums[(i + 1) % nums.count] {
                count = count + 1
            }
            if count > 1 {
                return false
            }
        }
        return true
    }
}

var nums = [3,4,5,1,2]
let result = Solution1().check(nums)
print(result)
print()

