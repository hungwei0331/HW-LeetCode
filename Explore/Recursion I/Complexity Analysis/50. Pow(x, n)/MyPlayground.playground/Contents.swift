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
  
 Constraints:
 -100.0 < x < 100.0
 -231 <= n <= 231-1
 n is an integer.
 Either x is not zero or n > 0.
 -104 <= xn <= 104
 */

// Iterative
// TC: O(log n) SC: O(1)
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = x
        var power = abs(n)
        var result = 1.0
        
        while power > 0 {
            if power % 2 == 1 {
                result = result * base
            }
            base = base * base
            power = power / 2
        }
        return n < 1 ? 1 / result : result
    }
}

// Recursive
// TC: O(log n) SC: O(log n)
class Solution1 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1.0 }
        if n < 0 {
            return 1 / myPow(x , -n)
        }
        let half = myPow(x, n / 2)
        return n % 2 == 0 ? half * half : half * half * x
    }
}

var x = 2.00000, n = 10
//var x = 2.00000, n = -2

let result = Solution().myPow(x, n)
print(result)
print()
