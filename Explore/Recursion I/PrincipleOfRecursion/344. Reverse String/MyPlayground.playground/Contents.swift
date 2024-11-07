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

// Iterative
// TC: O(n) SC: O(n)
class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        
        while left < right {
            s.swapAt(left, right)
            left = left + 1
            right = right - 1
        }
    }
}

// Recursive
// TC: O(n) SC: O(n)
class Solution1 {
    func reverseString(_ s: inout [Character]) {
        func helper(_ left: Int, _ right: Int) {
            if left >= right { return }
            s.swapAt(left, right)
            helper(left + 1, right - 1)
        }
        helper(0, s.count - 1)
    }
}
