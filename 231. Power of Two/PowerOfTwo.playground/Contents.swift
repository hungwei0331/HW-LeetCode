/*
 
 Given an integer n, return true if it is a power of two. Otherwise, return false.

 An integer n is a power of two, if there exists an integer x such that n == 2x.

 Example 1:

 Input: n = 1
 Output: true
 Explanation: 20 = 1
 Example 2:

 Input: n = 16
 Output: true
 Explanation: 24 = 16
 Example 3:

 Input: n = 3
 Output: false
 
 */

//Runtime: 4 ms, faster than 68.84% of Swift online submissions for Power of Two.
//Memory Usage: 13.8 MB, less than 57.25% of Swift online submissions for Power of Two.

//let input = 3
let input = 16

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var tmpNum = 1
        
        guard n != 1 else { return true }
        
        while tmpNum < n {
            tmpNum = tmpNum * 2
            if tmpNum == n {
                return true
            }
        }
        return false
    }
}

print(Solution().isPowerOfTwo(input))
