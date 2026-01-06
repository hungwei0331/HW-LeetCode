/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

 Example 1:
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
 Example 2:
 Input: digits = "2"
 Output: ["a","b","c"]
 */

// TC: O(4^N * N), where N is the length of digits. Note that 4 in this expression is referring to the maximum value length in the hash map
// SC: O(N), where N is the length of digits

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var map: [Character: [Character]] = [
            "2": ["a","b","c"],
            "3": ["d","e","f"],
            "4": ["g","h","i"],
            "5": ["j","k","l"],
            "6": ["m","n","o"],
            "7": ["p","q","r","s"],
            "8": ["t","u","v"],
            "9": ["w","x","y","z"],
        ]

        var path = [Character]()
        var result = [String]()
        var digits = Array(digits)

        func backtracking(_ index: Int) {
            if index == digits.count {
                result.append(String(path))
                return
            }

            let digit = digits[index]
            guard let letters = map[digit] else { return }

            for letter in letters {
                path.append(letter)
                
                backtracking(index + 1)

                path.removeLast()
            }
        }

        backtracking(0)
        return result
    }
}
