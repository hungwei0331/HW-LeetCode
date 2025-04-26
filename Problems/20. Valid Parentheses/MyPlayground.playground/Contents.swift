/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
  
 Example 1:
 Input: s = "()"
 Output: true

 Example 2:
 Input: s = "()[]{}"
 Output: true

 Example 3:
 Input: s = "(]"
 Output: false

 Example 4:
 Input: s = "([])"
 Output: true

 Constraints:
 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

// TC: O(n), SC: O(n)
class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 { return false }
        
        var stack = [Character]()

        for char in s {
            switch char {
                case "(" :
                    stack.append(")")
                case "{" :
                    stack.append("}")
                case "[" :
                    stack.append("]")
                default :
                    // stack.isEmpty
                    // it could be handle edge case when data is "())",
                    if stack.isEmpty || stack.removeLast() != char {
                        return false
                    }
            }
        }
        // it could be handle edge case when data is "((",
        return stack.isEmpty
    }
}
