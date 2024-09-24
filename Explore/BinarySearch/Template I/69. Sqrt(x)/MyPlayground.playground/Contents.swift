/*
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
  

 Example 1:

 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 */

//TC: O(logN) SC: O(1)
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 1
        var right = x
        var result = 0
        
        while left <= right {
            let mid = left + (right - left) / 2
            let midSquare = mid * mid
            
            if midSquare == x {
                return mid
            } else if midSquare < x {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}

let x = 8
let result = Solution().mySqrt(x)
print(result)
