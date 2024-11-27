
// Insertion Sort
// TC: O(n^2) SC: O(1)

class Solution {
    func insertionSort(_ list: inout [Int]) {
        for i in 0..<list.count {
            var currentIndex = i
            while currentIndex > 0 && list[currentIndex - 1] > list[currentIndex] {
                list.swapAt(currentIndex, currentIndex - 1)
                currentIndex = currentIndex - 1
            }
        }
    }
}

var list = [7, 3, 2, 5, 6, 10, 9, 8, 1]
Solution().insertionSort(&list)
print(list)
print()
