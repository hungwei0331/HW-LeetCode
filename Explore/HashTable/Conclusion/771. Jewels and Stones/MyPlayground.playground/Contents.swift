/*
 You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.

 Letters are case sensitive, so "a" is considered a different type of stone from "A".

 Example 1:
 Input: jewels = "aA", stones = "aAAbbbb"
 Output: 3
 
 Example 2:
 Input: jewels = "z", stones = "ZZ"
 Output: 0
 */

// TC: O(J.length + S.length) SC: O(J.length)

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        
        var set = Set<Character>()
        var result = 0
        
        for char in jewels {
            set.insert(char)
        }
        
        for char in stones {
            if set.contains(char) {
                result = result + 1
            }
        }
        return result
    }
}

let result = Solution().numJewelsInStones("aA", "aAAbbbb")
