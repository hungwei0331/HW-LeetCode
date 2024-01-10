/*
 Given an array of integers arr, return true if and only if it is a valid mountain array.

 Recall that arr is a mountain array if and only if:

 arr.length >= 3
 There exists some i with 0 < i < arr.length - 1 such that:
 arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
 arr[i] > arr[i + 1] > ... > arr[arr.length - 1]

 Example 1:
 Input: arr = [2,1]
 Output: false
 
 Example 2:
 Input: arr = [3,5,5]
 Output: false
 
 Example 3:
 Input: arr = [0,3,2,1]
 Output: true
 */

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        
        // there is not mountain if length less then 3
        if arr.count < 3 { return false }
        
        var n = arr.count
        var index = 0
        
        // current num less then next num, that mean increasing
        while ( index < n - 1 && arr[index] < arr[index + 1] ) {
            index = index + 1
        }
        
        // peak should not be first and last
        if index == 0 || index == n - 1 {
            return false
        }
        
        // current num greater then next num, that mean decresing
        while ( index < n - 1 && arr[index] > arr[index + 1]) {
            index = index + 1
        }
        
        // check doest the index process to last item,
        // if so that meaning there has moutain in the array
        return index == n - 1
    }
}

//let result = Solution().validMountainArray([2,1])
//let result = Solution().validMountainArray([3,5,5])
let result = Solution().validMountainArray([0,3,2,1])
print("result", result)
