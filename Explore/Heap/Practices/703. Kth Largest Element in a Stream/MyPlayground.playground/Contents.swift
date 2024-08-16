/*
 Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Implement KthLargest class:

 KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
 int add(int val) Appends the integer val to the stream and returns the element representing the kth largest element in the stream.
  

 Example 1:
 Input
 ["KthLargest", "add", "add", "add", "add", "add"]
 [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
 Output
 [null, 4, 5, 5, 8, 8]

 Explanation
 KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
 kthLargest.add(3);   // return 4
 kthLargest.add(5);   // return 5
 kthLargest.add(10);  // return 5
 kthLargest.add(9);   // return 8
 kthLargest.add(4);   // return 8
 */

import HeapModule

//TC: O((M+N)⋅logk) SC: O(k)
class KthLargest {
    
    var minHeap = Heap<Int>()
    var k = 0

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            minHeap.insert(num)
            if minHeap.count > k {
                minHeap.removeMin()
            }
        }
    }
    
    func add(_ val: Int) -> Int {
        minHeap.insert(val)
        if minHeap.count > k {
            minHeap.removeMin()
        }
        return minHeap.min!
    }
}
