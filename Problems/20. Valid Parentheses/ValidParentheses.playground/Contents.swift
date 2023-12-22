/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 
 */

//Runtime: 3 ms, faster than 70.57% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.3 MB, less than 33.08% of Swift online submissions for Valid Parentheses.


//let s = "()"
let s = "()[]{}"
//let s = "(]"


class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let dict: [Character: Character] = [ "(": ")", "{": "}", "[": "]"]
        
        for char in s {
            if dict[char] != nil {
                stack.append(char)
            } else {
                if let value = stack.popLast(), dict[value] == char {
                    continue
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

print(Solution().isValid(s))
