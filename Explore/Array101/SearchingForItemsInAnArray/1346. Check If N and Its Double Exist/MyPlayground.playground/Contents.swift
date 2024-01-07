/*
 Given an array arr of integers, check if there exist two indices i and j such that :

 i != j
 0 <= i, j < arr.length
 arr[i] == 2 * arr[j]
  

 Example 1:
 Input: arr = [10,2,5,3]
 Output: true
 Explanation: For i = 0 and j = 2, arr[i] == 10 == 2 * 5 == 2 * arr[j]
 
 Example 2:
 Input: arr = [3,1,7,11]
 Output: false
 Explanation: There is no i and j that satisfy the conditions.
 */

//https://www.youtube.com/watch?v=DkDcLtvrtNc

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var seen = Set<Int>()
        
        for num in arr {
            if seen.contains(num * 2) || seen.contains(num / 2) {
                return true
            }
            seen.insert(num)
        }
        return false
    }
}

let result = Solution().checkIfExist([-16,-13,8])
//let result = Solution().checkIfExist([7,1,14,11])
print("result", result)
