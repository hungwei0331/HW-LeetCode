/*
 5. Longest Palindromic Substring
 Medium
 Topics
 conpanies icon
 Companies
 Hint
 Given a string s, return the longest palindromic substring in s.

 Example 1:
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 
 Example 2:
 Input: s = "cbbd"
 Output: "bb"
 */

// TC: O(n^2), SC: O(1)
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty { return "" }
        
        var char = Array(s)
        var start = 0, end = 0
        
        for i in 0..<char.count {
            let len1 = expandAroundCenter(char, i, i)
            let len2 = expandAroundCenter(char, i, i + 1)
            let len = max(len1, len2)
            
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(char[start...end])
    }
    
    func expandAroundCenter(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        var L = left, R = right
        while L >= 0 && R < chars.count && chars[L] == chars[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
}


class Solution2 {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty { return "" }
        var start = 0
        var end = 0
        var chars = Array(s)

        for i in 0..<chars.count {
            let (left1, right1) = expandAroundCenter(chars, i, i)
            let (left2, right2) = expandAroundCenter(chars, i, i + 1)

            if right1 - left1 > end - start {
                start = left1
                end = right1
            }

            if right2 - left2 > end - start {
                start = left2
                end = right2
            }
        }
        return String(chars[start...end])
    }

    func expandAroundCenter(_ chars: [Character], _ left: Int, _ right: Int) -> (Int, Int) {
        var L = left
        var R = right

        while L >= 0 && R < chars.count && chars[L] == chars[R] {
            L = L - 1
            R = R + 1
        }
        return (L + 1, R - 1)
    }
}
