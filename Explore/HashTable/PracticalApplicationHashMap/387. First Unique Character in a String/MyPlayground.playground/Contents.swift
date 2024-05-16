/*
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

 Example 1:
 Input: s = "leetcode"
 Output: 0
 
 Example 2:
 Input: s = "loveleetcode"
 Output: 2
 
 Example 3:
 Input: s = "aabb"
 Output: -1
 */

// TC: O(N) SC: O(1)

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        
        for char in s {
            dict[char] = (dict[char] ?? 0) + 1
        }
        
        for (index, value) in s.enumerated() {
            if dict[value] == 1 {
                return index
            }
        }
        return -1
    }
}
