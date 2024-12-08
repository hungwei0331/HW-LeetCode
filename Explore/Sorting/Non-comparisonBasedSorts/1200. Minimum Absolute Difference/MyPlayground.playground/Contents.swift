/*
 Given an array of distinct integers arr, find all pairs of elements with the minimum absolute difference of any two elements.

 Return a list of pairs in ascending order(with respect to pairs), each pair [a, b] follows

 a, b are from arr
 a < b
 b - a equals to the minimum absolute difference of any two elements in arr
  
 Example 1:
 Input: arr = [4,2,1,3]
 Output: [[1,2],[2,3],[3,4]]
 Explanation: The minimum absolute difference is 1. List all pairs with difference equal to 1 in ascending order.
 
 Example 2:
 Input: arr = [1,3,6,10,15]
 Output: [[1,3]]
 
 Example 3:
 Input: arr = [3,8,-10,23,19,-4,-14,27]
 Output: [[-14,-10],[19,23],[23,27]]
 */
 
// Sort
// TC: O(nlogn) SC: O(n)
class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let sortedArray = arr.sorted(by: <)
        var minDifference = Int.max
        var result = [[Int]]()
        
        for i in 0..<(arr.count - 1) {
            let difference = sortedArray[i + 1] - sortedArray[i]
            if difference < minDifference {
                minDifference = difference
            }
        }
        
        for i in 0..<(arr.count - 1) {
            if (sortedArray[i + 1] - sortedArray[i]) == minDifference {
                result.append([sortedArray[i], sortedArray[i + 1]])
            }
        }
        return result
    }
}

// Counting Sort
// TC: O(m + n) SC: O(m + n)
class Solution1 {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let min = arr.min()!
        let max = arr.max()!
        let range = max - min + 1
        var counts = [Int](repeating: 0, count: range)
        
        for element in arr {
            counts[element - min] += 1
        }
        
        var startIndex = 0
        for (i, count) in counts.enumerated() {
            let index = counts[i]
            counts[i] = startIndex
            startIndex = startIndex + count
        }
        
        var sortedList = [Int](repeating: 0, count: arr.count)
        for element in arr {
            sortedList[counts[element - min]] = element
            counts[element - min] += 1
        }
        
        var minDiff = Int.max
        var result = [[Int]]()
        for i in 1..<sortedList.count {
            let diff = sortedList[i] - sortedList[i - 1]
            if diff < minDiff {
                minDiff = diff
                result = [[sortedList[i - 1], sortedList[i]]]
            } else if diff == minDiff {
                result.append([sortedList[i - 1], sortedList[i]])
            }
        }
        return result
    }
}

let arr = [3,8,-10,23,19,-4,-14,27]
let result = Solution().minimumAbsDifference(arr)
print(result)
print()

let arr1 = [3,8,-10,23,19,-4,-14,27]
let result1 = Solution1().minimumAbsDifference(arr1)
print(result1)
print()
