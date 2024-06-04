/*
 Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

 Implement the MovingAverage class:

 MovingAverage(int size) Initializes the object with the size of the window size.
 double next(int val) Returns the moving average of the last size values of the stream.
  

 Example 1:

 Input
 ["MovingAverage", "next", "next", "next", "next"]
 [[3], [1], [10], [3], [5]]
 Output
 [null, 1.0, 5.5, 4.66667, 6.0]

 Explanation
 MovingAverage movingAverage = new MovingAverage(3);
 movingAverage.next(1); // return 1.0 = 1 / 1
 movingAverage.next(10); // return 5.5 = (1 + 10) / 2
 movingAverage.next(3); // return 4.66667 = (1 + 10 + 3) / 3
 movingAverage.next(5); // return 6.0 = (10 + 3 + 5) / 3
 */

// Circular Queue
// TC: O(1) SC: O(N)

class MovingAverage {
    
    var queue: [Int]
    var sum = 0
    var count = 0
    
    init(_ size: Int) {
        queue = [Int](repeating: 0, count: size)
    }
    
    func next(_ val: Int) -> Double {
        let targentIndex = count % queue.count
        let oldValue = queue[targentIndex]
        
        queue[targentIndex] = val
        sum = sum - oldValue + val
        count = count + 1
        
        let diviend = min(queue.count, count)
        
        return Double(sum) / Double(diviend)
    }
}

let movingAverage = MovingAverage(6)
var tmp1 = movingAverage.next(1);
var tmp2 = movingAverage.next(10);
var tmp3 = movingAverage.next(3);
var tmp4 = movingAverage.next(5);
var tmp5 = movingAverage.next(6);
var tmp6 = movingAverage.next(7);
