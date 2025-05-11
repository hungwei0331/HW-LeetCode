/*
 You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

 Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

 Return intervals after the insertion.

 Note that you don't need to modify intervals in-place. You can make a new array and return it.

 Example 1:
 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 
 Example 2:
 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
  
 Constraints:
 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 105
 intervals is sorted by starti in ascending order.
 newInterval.length == 2
 0 <= start <= end <= 105
 */

// 1. while loop, add intervals which not overlapping
// 2. merge overlaypping intervals
// 3 add intervals which not overlapping at the right side

// TC: O(n), which n is number of intervals
// SC: O(n), store totoal of intervals
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var i = 0
        var n = intervals.count
        var result = [[Int]]()
        var newInterval = newInterval
        
        while i < n && intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i = i + 1
        }
        
        while i < n && intervals[i][0] <= newInterval[1] {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
            i = i + 1
        }
        
        result.append(newInterval)
        
        while i < n {
            result.append(intervals[i])
            i = i + 1
        }
        return result
    }
}
