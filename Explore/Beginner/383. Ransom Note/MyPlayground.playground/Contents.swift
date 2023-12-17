/*
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

  

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true

 */

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var copyMagazine = magazine
        for char in ransomNote {
            if let index = copyMagazine.lastIndex(of: char) {
                copyMagazine.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
}

let result = Solution().canConstruct("aa", "aab")
print("result", result)
