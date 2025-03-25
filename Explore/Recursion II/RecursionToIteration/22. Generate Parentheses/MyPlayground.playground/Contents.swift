/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 
 Example 2:
 Input: n = 1
 Output: ["()"]
 */

// TC:  O(4^n / sqrt(n)), SC: O(n)
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        helper(n, &result, "", 0, 0)
        return result
    }
    
    func helper(_ n: Int, _ result: inout [String], _ currentString: String, _ left: Int, _ right: Int) {
        if left == n && right == n {
            result.append(currentString)
            return
        }
        
        if left < n {
            helper(n, &result, currentString + "(", left + 1, right)
        }
        
        if right < left {
            helper(n, &result, currentString + ")", left, right + 1)
        }
    }
}
