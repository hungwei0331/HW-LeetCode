/*
 Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

 The testcases will be generated such that the answer is unique.

 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:

 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.
  

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
  
 Follow up: Could you find an algorithm that runs in O(m + n) time?
 */

// TC: O(n + m), which n is s length, which m is t length
// SC: O(k), which k = t
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty { return String() }
        
        var left = 0
        var right = 0
        
        let sArray = Array(s)
        
        var need = [Character: Int]()
        var window = [Character: Int]()
        var formed = 0
        var minLength = Int.max
        var startIndex = 0
        
        for char in t {
            need[char, default: 0] += 1
        }
        
        let required = need.count
        
        while right < sArray.count {
            let char = sArray[right]
            window[char, default: 0] += 1
            
            if let needCount = need[char] {
                if window[char] == needCount {
                    formed += 1
                }
            }
            
            while left <= right && formed == required {
                if right - left + 1 < minLength {
                    minLength = right - left + 1
                    startIndex = left
                }
                
                let leftChar = sArray[left]
                window[leftChar]! -= 1
                
                if let needCount = need[leftChar], window[leftChar]! < needCount {
                    formed -= 1
                }
                left += 1
            }
            right += 1
        }
        return minLength == Int.max ? "" : String(sArray[startIndex..<startIndex + minLength])
    }
}
