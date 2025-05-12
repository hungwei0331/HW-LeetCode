/*
 Given a string s, find the length of the longest substring without duplicate characters.

 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  
 Constraints:
 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

// TC: O(n), visit each element for once
// SC: O(n), one set to store substring
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var s = Array(s)
        var set = Set<Character>()
        var left = 0
        var length = 0

        for right in 0..<s.count {
            while set.contains(s[right]) {
                set.remove(s[left])
                left += 1
            }
            set.insert(s[right])
            length = max(length, right - left + 1)
        }
        return length
    }
}
