/*
 You are given a 0-indexed array of strings nums, where each string is of equal length and consists of only digits.

 You are also given a 0-indexed 2D integer array queries where queries[i] = [ki, trimi]. For each queries[i], you need to:

 Trim each number in nums to its rightmost trimi digits.
 Determine the index of the kith smallest trimmed number in nums. If two trimmed numbers are equal, the number with the lower index is considered to be smaller.
 Reset each number in nums to its original length.
 Return an array answer of the same length as queries, where answer[i] is the answer to the ith query.

 Note:
 To trim to the rightmost x digits means to keep removing the leftmost digit, until only x digits remain.
 Strings in nums may contain leading zeros.
  
 Example 1:
 Input: nums = ["102","473","251","814"], queries = [[1,1],[2,3],[4,2],[1,2]]
 Output: [2,2,1,0]
 Explanation:
 1. After trimming to the last digit, nums = ["2","3","1","4"]. The smallest number is 1 at index 2.
 2. Trimmed to the last 3 digits, nums is unchanged. The 2nd smallest number is 251 at index 2.
 3. Trimmed to the last 2 digits, nums = ["02","73","51","14"]. The 4th smallest number is 73.
 4. Trimmed to the last 2 digits, the smallest number is 2 at index 0.
    Note that the trimmed number "02" is evaluated as 2.
 
 Example 2:
 Input: nums = ["24","37","96","04"], queries = [[2,1],[2,2]]
 Output: [3,0]
 Explanation:
 1. Trimmed to the last digit, nums = ["4","7","6","4"]. The 2nd smallest number is 4 at index 3.
    There are two occurrences of 4, but the one at index 0 is considered smaller than the one at index 3.
 2. Trimmed to the last 2 digits, nums is unchanged. The 2nd smallest number is 24.
 */

import HeapModule

struct ClassInfo: Comparable {
    var gain: Double
    var pass: Int
    var total: Int
    
    static func < (lhs: ClassInfo, rhs: ClassInfo) -> Bool {
        return lhs.gain < rhs.gain
    }
}

// TC: O(klogn + nlogn)
// Each insertion and removal from the max heap takes O(logn) time. Since we perform this operation k times
// Calculating the final average pass ratio: This involves iterating through the heap, which takes O(nlogn)
// SC: O(n), max heap, which stores n elements
class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        var maxHeap = Heap<ClassInfo>()
        
        for classInfo in classes {
            let pass = classInfo[0]
            let total = classInfo[1]
            let gain = gain(pass, total)
            maxHeap.insert(ClassInfo(gain: gain, pass: pass, total: total))
        }
        
        var extraStudents = extraStudents
        while extraStudents > 0 {
            let maxImprove = maxHeap.removeMax()
            let updatePass = maxImprove.pass + 1
            let updateTotal = maxImprove.total + 1
            let gain = gain(updatePass, updateTotal)
            
            maxHeap.insert(ClassInfo(gain: gain, pass: updatePass, total: updateTotal))
            extraStudents = extraStudents - 1
        }
        
        var totalRatio = 0.0
        for i in 0..<maxHeap.count {
            let classInfo = maxHeap.removeMax()
            totalRatio += Double(classInfo.pass) / Double(classInfo.total)
        }
        return totalRatio / Double(classes.count)
    }
    
    func gain(_ pass: Int, _ total: Int) -> Double {
        return Double(pass + 1) / Double(total + 1) - Double(pass) / Double(total)
    }
}

var classes = [[1,2],[3,5],[2,2]], extraStudents = 2
let result = Solution().maxAverageRatio(classes, extraStudents)
print(result)
print("")
