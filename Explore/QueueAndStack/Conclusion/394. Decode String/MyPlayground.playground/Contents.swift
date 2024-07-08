/*
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].

 The test cases are generated so that the length of the output will never exceed 105.

 Example 1:
 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 
 Example 2:
 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 
 Example 3:
 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
 */

// TC: O(maxK * n): where maxK is the maximum value of k and n is the length of a given string s. We traverse a string of size n and iterate k times to decode each pattern of form k[string]. This gives us worst case time complexity as O(maxK⋅n).
// SC: O(m + n): where m is the number of letters(a-z) and n is the number of digits(0-9) in string s. In worst case, the maximum size of stringStack and countStack could be m and n respectively.

class Solution {
    func decodeString(_ s: String) -> String {
        var intStack = [Int]()
        var strStack = [String]()
        var currentNum = Int()
        var currentString = String()
        
        for char in s {
            if char == "[" {
                intStack.append(currentNum)
                strStack.append(currentString)
                currentNum = 0
                currentString = ""
            } else if char == "]" {
                let num = intStack.removeLast()
                let prevString = strStack.removeLast()
                currentString = prevString + String(repeating: currentString, count: num)
            } else if let charNum = Int(String(char)) {
                currentNum = currentNum * 10 + charNum
            } else {
                currentString.append(String(char))
            }
        }
        return currentString
    }
}
