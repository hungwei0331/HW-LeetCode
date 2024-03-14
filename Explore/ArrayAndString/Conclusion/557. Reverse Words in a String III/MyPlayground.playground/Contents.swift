/*
 Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

 Example 1:
 Input: s = "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 
 Example 2:
 Input: s = "Mr Ding"
 Output: "rM gniD"
 */

import Foundation

// TC: O(N) SC:O(1)
class Solution {
    func reverseWords(_ s: String) -> String {
        return s.components(separatedBy: " ")
                .map { swap($0) }
                .joined(separator: " ")
    }
    
    func swap(_ s: String) -> String {
        var s = Array(s)
        
        var left = 0
        var right = s.count - 1
        
        while left < right {
            s.swapAt(0, right)
            left = left + 1
            right = right - 1
        }
        return String(s)
    }
}

var s1 = "Let's take LeetCode contest"
var s2 = "Mr Ding"

let result = Solution().reverseWords(s2)
print(result)
