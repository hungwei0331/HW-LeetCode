/*
 Given an input string s, reverse the order of the words.

 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

 Return a string of the words in reverse order concatenated by a single space.

 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

 Example 1:
 Input: s = "the sky is blue"
 Output: "blue is sky the"
 
 Example 2:
 Input: s = "  hello world  "
 Output: "world hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 
 Example 3:
 Input: s = "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 */
import Foundation

// TC: O(N) SC: O(N)
class Solution1 {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
}

// TC: O(N) SC: O(N)
class Solution2 {
    func reverseWords(_ s: String) -> String {
        var words = s.components(separatedBy: " ").filter{ $0.count != 0}
        
        var left = 0
        var right = words.count - 1
        
        while left < right {
            var tmp = words[left]
            words[left] = words[right]
            words[right] = tmp
            
            left = left + 1
            right = right - 1
        }
        
        return words.joined(separator: " ")
    }
}

//let result1 = Solution1().reverseWords("the sky is blue")
let result1 = Solution1().reverseWords("  hello world  ")
//let result1 = Solution1().reverseWords("a good   example")
print(result1)

//let result2 = Solution2().reverseWords("the sky is blue")
let result2 = Solution2().reverseWords("  hello world  ")
//let result2 = Solution2().reverseWords("a good   example")
print(result1)
