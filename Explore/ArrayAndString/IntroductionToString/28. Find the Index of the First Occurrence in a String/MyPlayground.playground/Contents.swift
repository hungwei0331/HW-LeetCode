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
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        if needle.count > haystack.count { return -1 }
        
        let haystackCount = haystack.count
        let needleCount = needle.count
        
        for i in 0...(haystackCount - needleCount) {
            var startIndex = haystack.index(haystack.startIndex, offsetBy: i)
            var endIndex = haystack.index(startIndex, offsetBy: needleCount)
            
            if haystack[startIndex..<endIndex] == needle {
                return i
            }
        }
        return -1
    }
}

let result = Solution().strStr("sadbutsad", "sad")
//let result1 = Solution1().strStr("leetcode", "leeto")
print(result)

