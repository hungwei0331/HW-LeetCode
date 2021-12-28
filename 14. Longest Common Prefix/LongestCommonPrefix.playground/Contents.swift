/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 
 */

//Runtime: 8 ms, faster than 97.12% of Swift online submissions for Longest Common Prefix.
//Memory Usage: 14.2 MB, less than 64.10% of Swift online submissions for Longest Common Prefix.


let strs = ["flower","flow","flight"]
//let strs = ["dog","racecar","car"]

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        
        var tmpPrefix = strs.first!
        
        for str in strs[1..<strs.count] {
            while !str.hasPrefix(tmpPrefix) {
                tmpPrefix = String(tmpPrefix.dropLast())
            }
        }
        return tmpPrefix
    }
}

print(Solution().longestCommonPrefix(strs))
