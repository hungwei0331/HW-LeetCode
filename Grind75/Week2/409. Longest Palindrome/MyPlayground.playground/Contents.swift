/*
 Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
 Letters are case sensitive, for example, "Aa" is not considered a palindrome.

 Example 1:
 Input: s = "abccccdd"
 Output: 7
 Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
 
 Example 2:
 Input: s = "a"
 Output: 1
 Explanation: The longest palindrome that can be built is "a", whose length is 1.
  
 Constraints:
 1 <= s.length <= 2000
 s consists of lowercase and/or uppercase English letters only.
 */

// TC: O(n), SC: O(n)
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var s = Array(s)
        var dict = [Character: Int]()
        var longestSum = 0
        var hasOdd = false
        
        for char in s {
            dict[char, default: 0] += 1
        }
        
        for value in dict.values {
            if value % 2 == 0 {
                longestSum += value
            } else {
                let count = value - 1
                longestSum = longestSum + count
                hasOdd = true
            }
        }
        
        if hasOdd {
            longestSum += 1
        }
        
        return longestSum
    }
}
