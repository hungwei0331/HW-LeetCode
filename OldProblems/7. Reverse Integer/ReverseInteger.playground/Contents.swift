
//Given a 32-bit signed integer, reverse digits of an integer.

/*
Example 1:
Input: 123
Output: 321
 
Example 2:
Input: -123
Output: -321
 
Example 3:
Input: 120
Output: 21
 
Note:
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1].
For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
*/

let x = 1534236469

func reverse(_ x: Int) -> Int {
    
    if x == 0 {
        return 0
    }
    
    var coverArray = Array(String(x))
    
    if coverArray.first == "-" {
        
        coverArray.remove(at: 0)
        coverArray.reverse()
        coverArray.insert("-", at: 0)
        
    } else if coverArray.last == "0" {
        
        coverArray.removeLast()
        coverArray.reverse()
        
    } else {
        
        coverArray.reverse()
        
    }
    
    //print(coverArray)
    //print(Int(String(coverArray))!)
    
    if let coverInt = Int32(String(coverArray)) {
        return Int(coverInt)
    } else {
        return 0
    }
}

reverse(x)
