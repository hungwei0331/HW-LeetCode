/*
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

 Example 1:
 Input: s = "egg", t = "add"
 Output: true
 
 Example 2:
 Input: s = "foo", t = "bar"
 Output: false
 
 Example 3:
 Input: s = "paper", t = "title"
 Output: true
 */

// TC: O(N) SC:O(N)

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var dictS = [Character: Character]()
        var dictT = [Character: Character]()
        
        var sArray = Array(s)
        var tArray = Array(t)
        
        for i in 0..<sArray.count {
            let sChar = sArray[i]
            let tChar = tArray[i]
            
            if let mappedSChar = dictS[sChar], mappedSChar != tChar {
                return false
            }
            
            if let mappedTChar = dictT[tChar], mappedTChar != sChar {
                return false
            }
            
            dictS[sChar] = tChar
            dictT[tChar] = sChar
        }
        return true
    }
}
