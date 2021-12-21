//The power of the string is the maximum length of a non-empty substring that contains only one unique character.
//Given a string s, return the power of s.

 
/*
Example 1:

Input: s = "leetcode"
Output: 2
Explanation: The substring "ee" is of length 2 with the character 'e' only.
Example 2:

Input: s = "abbcccddddeeeeedcba"
Output: 5
Explanation: The substring "eeeee" is of length 5 with the character 'e' only.
 */

//Runtime: 8 ms, faster than 41.73% of Swift online submissions for Consecutive Characters.
//Memory Usage: 14.1 MB, less than 97.64% of Swift online submissions for Consecutive Characters.

let s = "leetcode"

class Solution {
    func maxPower(_ s: String) -> Int {
        var previousChar = s.first
        var output = 0
        var count = 0
        
        for char in s {
            if char == previousChar {
                count = count + 1
            } else {
                count = 1
            }
            
            output = max(output, count)
            previousChar = char
        }
        return output
    }
}

print(Solution().maxPower(s))
