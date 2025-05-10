/*
 Given an integer n, return true if it is a power of three. Otherwise, return false.
 An integer n is a power of three, if there exists an integer x such that n == 3x.

 Example 1:
 Input: n = 27
 Output: true
 Explanation: 27 = 33
 
 Example 2:
 Input: n = 0
 Output: false
 Explanation: There is no x where 3x = 0.
 
 Example 3:
 Input: n = -1
 Output: false
 Explanation: There is no x where 3x = (-1).
  
 Constraints:
 -231 <= n <= 231 - 1
 */

// TC: O(log3(n)), calculate the n mod 3 for n times
// SC: O(1), only copy the n
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n <= 0 { return false}
        var n = n

        while n % 3 == 0 {
            n = n / 3
        }
        return n == 1
    }
}
