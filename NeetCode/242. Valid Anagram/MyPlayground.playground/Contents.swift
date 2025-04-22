/*
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true

 Example 2:
 Input: s = "rat", t = "car"
 Output: false

 Constraints:

 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
 */

// TC: O(n), because accessing the counter table is a constant time operation.
// SC: O(1), Although we do use extra space, the space complexity is O(1) because the table's size stays constant no matter how large n is.
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var dict = [Character: Int]()

        for char in s {
            dict[char, default: 0] += 1
        }

        for char in t {
            guard let count = dict[char] else {
                return false
            }
            dict[char]! -= 1
        }

        for (index, value) in dict {
            if value > 0 {
                return false
            }
        }
        return true
    }
}
