/*
 Given a string s, find the length of the longest
 substring
  without repeating characters.

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
 */

//TC: O(n) SC: O(n)

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var startIndex = 0
        var longest = 0
        var dict = [Character: Int]()
        
        for (index, char) in s.enumerated() {
            if let index = dict[char] {
                startIndex = max(index + 1, startIndex)
            }
            longest = max(longest, index - startIndex + 1)
            dict[char] = index
        }
        return longest
    }
}
