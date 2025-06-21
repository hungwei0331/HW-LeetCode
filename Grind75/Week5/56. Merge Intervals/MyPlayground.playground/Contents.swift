/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 Example 1:
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 
 Example 2:
 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
  
 Constraints:
 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 */

// TC: O(nlogn), SC: O(n)
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        let sorted = intervals.sorted{ $0[0] < $1[0] }
        
        for interval in sorted {
            if result.isEmpty || result.last![1] < interval[0] {
                result.append(interval)
            } else {
                result[result.count - 1][1] = max(result.last![1], interval[1])
            }
        }
        return result
    }
}

var intervals = [[1,3],[2,6],[8,10],[15,18]]
let result = Solution().merge(intervals)
print(result)
print()
