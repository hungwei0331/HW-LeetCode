/*
 Given a positive integer num, return true if num is a perfect square or false otherwise.

 A perfect square is an integer that is the square of an integer. In other words, it is the product of some integer with itself.

 You must not use any built-in library function, such as sqrt.

 Example 1:
 Input: num = 16
 Output: true
 Explanation: We return true because 4 * 4 = 16 and 4 is an integer.
 
 Example 2:
 Input: num = 14
 Output: false
 Explanation: We return false because 3.742 * 3.742 = 14 and 3.742 is not an integer.
 */

// TC: O(logN) SC: O(1)
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 1
        var right = num
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if mid * mid == num {
                return true
            }
            
            if mid * mid > num {
                right = mid - 1
            } else {
                left = left + 1
            }
        }
        return false
    }
}
