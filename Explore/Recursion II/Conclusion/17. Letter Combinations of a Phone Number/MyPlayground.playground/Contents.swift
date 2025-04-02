/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

 Example 1:
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
 Example 2:
 Input: digits = ""
 Output: []
 
 Example 3:
 Input: digits = "2"
 Output: ["a","b","c"]
  
 Constraints:
 0 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 */

// TC: O(4^N * N), where N is the length of digits. Note that 4 in this expression is referring to the maximum value length in the hash map
// SC: O(N), where N is the length of digits
class Solution {
    private var phoneMap: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        var result = [String]()
        
        backtracking(digits, 0, "", &result)
        
        return result
    }
    
    func backtracking(_ digits: String, _ index: Int, _ currentString: String, _ result: inout [String]) {
        if index == digits.count {
            result.append(currentString)
            return
        }
        
        let digital = digits[digits.index(digits.startIndex, offsetBy: index)]
        guard let letters = phoneMap[digital] else { return }
        
        for letter in letters {
            backtracking(digits, index + 1, currentString + String(letter), &result)
        }
    }
}
