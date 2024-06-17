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
 */

//TC: O(N) SC: O(N)

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 { return false }
        var stack = [Character]()
        
        for bracket in s {
            switch bracket {
            case "(":
                stack.append(")")
            case "[":
                stack.append("]")
            case "{":
                stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != bracket {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
