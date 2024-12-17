/*
 Given an integer array nums, return the maximum difference between two successive elements in its sorted form. If the array contains less than two elements, return 0.
 You must write an algorithm that runs in linear time and uses linear extra space.

 Example 1:
 Input: nums = [3,6,9,1]
 Output: 3
 Explanation: The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.
 
 Example 2:
 Input: nums = [10]
 Output: 0
 Explanation: The array contains less than 2 elements, therefore return 0.
 */

// TC: O(d * (n + k)), where n is array length, d is max number, k is base number
// SC: O(n + k), n is tmp store array, k is bucket number

class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 { return 0 }
        var maxDiff = Int.min
        let sorted = radixSort(nums)
        
        for i in 0..<sorted.count - 1 {
            if sorted[i + 1] - sorted[i] > maxDiff {
                maxDiff = sorted[i + 1] - sorted[i]
            }
        }
        return maxDiff
    }
    
    func radixSort(_ nums: [Int]) -> [Int] {
        var nums = nums
        var placeValue = 1
        let base = 10
        let max = nums.max()!
        
        while placeValue <= max {
            var bucket = [[Int]](repeating: [], count: 10)
            
            for num in nums {
                let digital = num / placeValue % 10
                bucket[digital].append(num)
            }
            nums = bucket.flatMap{ $0 }
            placeValue = placeValue * base
        }
        return nums
    }
}

//let nums = [3,6,9,1]
//let nums = [100,3,2,1]
let nums = [0,0,0]
let result = Solution().maximumGap(nums)
print(result)
print()
