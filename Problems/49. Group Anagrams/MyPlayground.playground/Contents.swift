/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:
 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 
 Example 2:
 Input: strs = [""]
 Output: [[""]]

 Example 3:
 Input: strs = ["a"]
 Output: [["a"]]

 Constraints:
 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 */

// TC: O(n * klogk), which n is numbers of string, k is length of string
// SC: O(n * k), dict n keys, and k strings
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.isEmpty { return [[String]]() }

        var dict = [String: [String]]()

        for string in strs {
            let sortedString = String(string.sorted())
            dict[sortedString, default: []].append(string)
        }

        return Array(dict.values)
    }
}
