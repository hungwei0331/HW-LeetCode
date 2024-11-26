
// Selection Sort
// TC: O(n^2) SC: O(1)

class Solution {
    func selectionSort(_ list: inout [Int]) {
        for i in 0..<list.count {
            var minIndex = i
            for j in i..<list.count {
                if list[j] < list[minIndex] {
                    minIndex = j
                }
            }
            list.swapAt(i, minIndex)
        }
    }
}

var list = [7, 3, 2, 5, 6, 10, 9, 8, 1]
Solution().selectionSort(&list)
print(list)
print()
