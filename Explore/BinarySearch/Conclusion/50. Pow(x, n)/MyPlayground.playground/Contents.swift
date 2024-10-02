/*
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

 Example 1:
 Input: x = 2.00000, n = 10
 Output: 1024.00000
 
 Example 2:
 Input: x = 2.10000, n = 3
 Output: 9.26100
 
 Example 3:
 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 */

// TC: O(logN) SC: O(1)
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        
        var power = abs(n)
        var result = 1.0
        var base = x
        
        while power > 0 {
            if power % 2 == 1 {
                result = result * base
            }
            
            base = base * base
            power = power / 2
        }
        return n < 0 ?  1 / result : result
    }
}

