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

// TC: O(n) SC: O(1)
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return String() }
         
        var common = strs.first!
        
        for str in strs {
            while !str.hasPrefix(common) {
                common = String(common.dropLast())
            }
        }
        return common
    }
}

let result = Solution().longestCommonPrefix(["flower","flow","flight"])
print(result)
