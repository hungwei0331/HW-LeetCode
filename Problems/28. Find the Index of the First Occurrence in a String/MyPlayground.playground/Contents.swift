/*
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:
 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 
 Example 2:
 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
  
 Constraints:
 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 */

// TC: O(n * m), SC: O(n + m)
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var haychars = Array(haystack)
        var needleChars = Array(needle)

        if haychars.count < needleChars.count{ return -1 }

        for i in 0...(haychars.count - needleChars.count) {
            var isMatch = true
            
            for j in 0..<needleChars.count {
                if haychars[i + j] != needleChars[j] {
                    isMatch = false
                    break
                }
            }

            if isMatch {
                return i
            }
        }
        return -1
    }
}
