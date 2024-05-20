/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 
 Example 2:
 Input: strs = [""]
 Output: [[""]]
 
 Example 3:
 Input: strs = ["a"]
 Output: [["a"]]
 */

// TC: O(NKlogK)
// SC: O(NK)

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var anagramsGroup = [String: [String]]()
        
        for str in strs {
            let sortedStr = String(str.sorted())
            if var group = anagramsGroup[sortedStr] {
                group.append(str)
                anagramsGroup[sortedStr] = group
            } else {
                anagramsGroup[sortedStr] = [str]
            }
        }
        return Array(anagramsGroup.values)
    }
}
