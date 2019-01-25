//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

/*
Example 1:

Input: 121
Output: true
 
Example 2:
Input: -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
Example 3:
Input: 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
*/

let x = 121

func isPalindrome(_ x: Int) -> Bool {
    
    var palindrome = Array(String(x))
    //var reverserdPalindrome = Array(palindrome.reversed())
    var reverserdPalindrome = Array<Character>()
    var isPalindrome = false
    var totalCount = 0
    
    for arrayIndex in 0..<palindrome.count {
        reverserdPalindrome.append(palindrome[(palindrome.count - 1) - arrayIndex])
    }
    print(reverserdPalindrome)
    
    for (index, value) in palindrome.enumerated() {
        if (palindrome[index] == reverserdPalindrome[index]) {
            totalCount = totalCount + 1
            if (totalCount == palindrome.count) {
                isPalindrome = true
                return isPalindrome
            }
        } else {
            isPalindrome = false
            return isPalindrome
        }
    }
    return isPalindrome
}

isPalindrome(x)
