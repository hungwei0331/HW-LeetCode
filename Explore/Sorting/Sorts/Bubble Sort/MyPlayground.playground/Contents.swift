
// Bubble Sort
// TC: O(n^2) SC: O(1)

class Solution {
    func bubbleSort(_ list: inout [Int]) {
        var hasSwap = true
        while hasSwap {
            hasSwap = false
            for i in 0..<list.count - 1 {
                if list[i] > list[i + 1] {
                    list.swapAt(i, i + 1)
                    hasSwap = true
                }
            }
        }
    }
}

var list = [7, 3, 2, 5, 6, 10, 9, 8, 1]
Solution().bubbleSort(&list)
print(list)
print()
