/*
 Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

 Example 1:
 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2
 
 Example 2:
 Input: intervals = [[7,10],[2,4]]
 Output: 1
 */

import HeapModule

// TC: O(NlogN) SC: O(N)

class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted{ $0[0] < $1[0] }
        var heap = Heap<Int>()
        
        heap.insert(sorted[0][1])
        
        for i in 1..<intervals.count {
            let currentMeeting = sorted[i]
            if currentMeeting[0] >= heap.min! {
                heap.removeMin()
            }
            heap.insert(currentMeeting[1])
        }
        return heap.count
    }
}
