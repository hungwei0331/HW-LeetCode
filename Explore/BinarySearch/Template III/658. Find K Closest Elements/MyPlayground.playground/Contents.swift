/*
 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.

 An integer a is closer to x than an integer b if:

 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
  
 Example 1:
 Input: arr = [1,2,3,4,5], k = 4, x = 3
 Output: [1,2,3,4]

 Example 2:
 Input: arr = [1,1,2,3,4,5], k = 4, x = -1
 Output: [1,1,2,3]
 */

// TC: O(logN + k) SC: O(1)
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var low = 0
        var high = arr.count - 1
        
        while high - low >= k {
            if abs(arr[low] - x) > abs(arr[high] - x) {
                low = low + 1
            } else {
                high = high - 1
            }
        }
        
        var result = [Int]()
        for i in low...high {
            result.append(arr[i])
        }
        return result
    }
}

var arr = [1,2,3,4,5], k = 4, x = 3
// Output: [1,2,3,4]

//var arr = [1,1,2,3,4,5], k = 4, x = -1
//Output: [1,1,2,3]

let result = Solution().findClosestElements(arr, k, x)
print(result)



