/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.
 */

/*
 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:

 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 
 */

//Runtime: 35 ms, faster than 57.80% of Swift online submissions for Valid Palindrome.
//Memory Usage: 16 MB, less than 61.16% of Swift online submissions for Valid Palindrome.

/*
 Step1. check array is empty, if its, return true
 Step2. make two index, i is startIndex, j is endIndex
 Step3. run the loop check array[i] is not letter or not number, if yes, i += 1 to progress check array
 Step4. check array[j] is not letter or not number, if yes, j -= 1 to progress check array
 Step5. check array[i] isEqueal array[j], if so, i += 1 and j -= 1 to progress check array
 step6. if not fit all condition, it means string not palindrome
 step7. if run loop finish, it is palindrome
 */

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let array = Array(s)
        
        if array.isEmpty { return true }
        
        var i = 0
        var j = s.count - 1
        
        while i < j {
            if !array[i].isLetter && !array[i].isNumber {
                i += 1
            } else if !array[j].isLetter && !array[j].isNumber {
                j -= 1
            } else if String(array[i]).lowercased() == String(array[j]).lowercased() {
                i += 1
                j -= 1
            } else {
                return false
            }
        }
        return true
    }
}

print(Solution().isPalindrome("A man, a plan, a canal: Panama"))



