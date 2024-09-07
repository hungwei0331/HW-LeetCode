/*
 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

 For example, for arr = [2,3,4], the median is 3.
 For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
 Implement the MedianFinder class:

 MedianFinder() initializes the MedianFinder object.
 void addNum(int num) adds the integer num from the data stream to the data structure.
 double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
  
 Example 1:
 Input
 ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
 [[], [1], [2], [], [3], []]
 Output
 [null, null, null, 1.5, null, 2.0]

 Explanation
 MedianFinder medianFinder = new MedianFinder();
 medianFinder.addNum(1);    // arr = [1]
 medianFinder.addNum(2);    // arr = [1, 2]
 medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
 medianFinder.addNum(3);    // arr[1, 2, 3]
 medianFinder.findMedian(); // return 2.0
 */

import HeapModule

// Two Heap
// TC: insert: O(nlogn), find midian: O(1) SC: O(n)

class MedianFinder {
    
    var maxHeap: Heap<Int>
    var minHeap: Heap<Int>

    init() {
        maxHeap = Heap<Int>()
        minHeap = Heap<Int>()
    }
    
    func addNum(_ num: Int) {
        if maxHeap.count == 0 || maxHeap.max! > num {
            maxHeap.insert(num)
        } else {
            minHeap.insert(num)
        }
        
        if maxHeap.count > minHeap.count + 1 {
            minHeap.insert(maxHeap.removeMax())
        } else if maxHeap.count < minHeap.count {
            maxHeap.insert(minHeap.removeMin())
        }
    }
    
    func findMedian() -> Double {
        if maxHeap.count == minHeap.count {
            return Double(maxHeap.max! + minHeap.min!) / 2.0
        } else {
            return Double(maxHeap.max!)
        }
    }
}

// Sort
// TC: O(nlogn) SC: O(n)
class MedianFinder1 {
    
    var datas: [Int]

    init() {
        datas = [Int]()
    }
    
    func addNum(_ num: Int) {
        datas.append(num)
    }
    
    func findMedian() -> Double {
        datas.sort()
        let n = datas.count
        if datas.count % 2 == 0 {
            return Double(datas[n / 2] + datas[n / 2 - 1]) / 2.0
        } else {
            return Double(datas[n / 2])
        }
    }
}
