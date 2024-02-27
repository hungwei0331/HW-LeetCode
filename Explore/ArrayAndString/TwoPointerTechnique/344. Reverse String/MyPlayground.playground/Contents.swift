/*
 Write a function that reverses a string. The input string is given as an array of characters s.
 You must do this by modifying the input array in-place with O(1) extra memory.

 Example 1:
 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 
 Example 2:
 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]
 */

//TC: O(N) SC: O(1)

class Solution {
    func reverseString(_ s: inout [Character]) {
        
        if s.isEmpty { return }
        
        var left = 0
        var right = s.count - 1
        
        while left < right {
            var tmp = s[left]
            s[left] = s[right]
            s[right] = tmp
            
            left = left + 1
            right = right - 1
        }
    }
}

//var s: [Character] = ["h","e","l","l","o"]
var s: [Character] = ["H","a","n","n","a","h"]
Solution().reverseString(&s)
print(s)
