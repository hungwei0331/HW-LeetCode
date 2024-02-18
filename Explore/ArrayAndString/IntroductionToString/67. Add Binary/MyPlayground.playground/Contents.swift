/*
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 
 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = Array(a)
        var b = Array(b)
        
        var i = a.count - 1
        var j = b.count - 1
        
        var result = String()
        var carry = 0
        
        while ( i >= 0 || j >= 0 || carry > 0) {
            var sum = carry
            
            if i >= 0 {
                sum += Int(String(a[i]))!
                i = i - 1
            }
            
            if j >= 0 {
                sum += Int(String(b[j]))!
                j = j - 1
            }
            
            result = "\(sum % 2)" + result
            carry = sum / 2
            
        }
        return result
    }
}

let result = Solution().addBinary("11", "1")
//let result = Solution().addBinary("1010", "1011")
print(result)
