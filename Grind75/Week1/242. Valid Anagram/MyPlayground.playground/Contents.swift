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

// TC: O(nlogn), SC: O(n)
class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        if s.count != t.count { return false }
        
        var s = s.sorted()
        var t = t.sorted()
        
        for i in 0..<s.count {
            if s[i] != t[i] {
                return false
            }
        }
        return true
    }
}

// TC: O(n), SC: O(n)
class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        var dict = [Character: Int]()
        
        for char in s {
            dict[char, default: 0] += 1
        }
        
        for char in t {
            if dict[char] == nil { return false }
            dict[char]! -= 1
        }
        
        for value in dict.values {
            if value != 0 {
                return false
            }
        }
        return true
    }
}


