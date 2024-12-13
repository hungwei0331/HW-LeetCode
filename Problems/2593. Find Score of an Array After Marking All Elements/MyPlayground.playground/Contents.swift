/*
 You are given an array nums consisting of positive integers.

 Starting with score = 0, apply the following algorithm:

 Choose the smallest integer of the array that is not marked. If there is a tie, choose the one with the smallest index.
 Add the value of the chosen integer to score.
 Mark the chosen element and its two adjacent elements if they exist.
 Repeat until all the array elements are marked.
 Return the score you get after applying the above algorithm.

 Example 1:
 Input: nums = [2,1,3,4,5,2]
 Output: 7
 Explanation: We mark the elements as follows:
 - 1 is the smallest unmarked element, so we mark it and its two adjacent elements: [2,1,3,4,5,2].
 - 2 is the smallest unmarked element, so we mark it and its left adjacent element: [2,1,3,4,5,2].
 - 4 is the only remaining unmarked element, so we mark it: [2,1,3,4,5,2].
 Our score is 1 + 2 + 4 = 7.
 
 Example 2:
 Input: nums = [2,3,5,1,3,2]
 Output: 5
 Explanation: We mark the elements as follows:
 - 1 is the smallest unmarked element, so we mark it and its two adjacent elements: [2,3,5,1,3,2].
 - 2 is the smallest unmarked element, since there are two of them, we choose the left-most one, so we mark the one at index 0 and its right adjacent element: [2,3,5,1,3,2].
 */

// TC: O(nlogn), where n is processing each element takes a total of O(N) time
// SC: O(n)
class Solution {
    func findScore(_ nums: [Int]) -> Int {
        var result = 0
        var sorted = [(Int, Int)]()
        
        for (index, value) in nums.enumerated() {
            sorted.append((value, index))
        }
        sorted.sort{ $0.0 < $1.0 }
        
        var marked = [Bool](repeating: false, count: nums.count)
        
        for (value, index) in sorted {
            if marked[index] == false {
                marked[index] = true
                result = result + value
                
                if index - 1 >= 0 {
                    marked[index - 1] = true
                }
                if index + 1 < nums.count {
                    marked[index + 1] = true
                }
            }
        }
        return result
    }
}

var nums = [2,1,3,4,5,2]
let result = Solution().findScore(nums)
print(result)
print()

