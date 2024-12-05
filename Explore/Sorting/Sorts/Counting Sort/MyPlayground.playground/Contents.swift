
// Counting Sort
// TC: O(N+K), where N is the size of the input array and K is the maximum value in the array.
// SC: O(N+K), a new array of size N, and a counts array of size K + 1

class Solution {
    func countingSort(_ list: inout [Int]) {
        let maxValue = list.max()!
        
        var counts = Array(repeating: 0, count: maxValue + 1)
        
        for element in list {
            counts[element] = counts[element] + 1
        }
        
        var startIndex = 0
        for i in 0..<counts.count {
            let count = counts[i]
            counts[i] = startIndex
            startIndex = startIndex + count
        }
        
        var sortedList = [Int](repeating: 0, count: list.count)
        for element in list {
            let index = counts[element]
            sortedList[index] = element
            counts[element] = counts[element] + 1
        }
        
        for i in 0..<list.count {
            list[i] = sortedList[i]
        }
    }
}

var list = [5, 4, 5, 5, 1, 1, 3]
Solution().countingSort(&list)
print(list)
print()
