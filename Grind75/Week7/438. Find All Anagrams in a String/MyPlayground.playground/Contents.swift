/*
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 Example 1:
 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 
 Example 2:
 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
  
 Constraints:

 1 <= s.length, p.length <= 3 * 104
 s and p consist of lowercase English letters.
 */

// TC: O(n), where n = s.length
// SC: O(1), pCount → 26, window → 26, result → output（does not count to extra space）
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var sArr = Array(s)
        var pArr = Array(p)
        
        if sArr.count < pArr.count { return [] }
        
        var windowCount = Array(repeating: 0, count: 26)
        var pCount = Array(repeating: 0, count: 26)
        var result = [Int]()

        let aAsciiValue = Int(Character("a").asciiValue!)

        for i in 0..<pArr.count {
            let index = Int(pArr[i].asciiValue!) - aAsciiValue
            pCount[index] += 1
        }

        let windowSize = pArr.count

        for i in 0..<sArr.count {
            let rightIndex = Int(sArr[i].asciiValue!) - aAsciiValue
            windowCount[rightIndex] += 1

            if i >= windowSize {
                let leftIndex = Int(sArr[i - windowSize].asciiValue!) - aAsciiValue
                windowCount[leftIndex] -= 1
            }

            if windowCount == pCount {
                result.append(i - windowSize + 1)
            }
        }
        return result
    }
}

