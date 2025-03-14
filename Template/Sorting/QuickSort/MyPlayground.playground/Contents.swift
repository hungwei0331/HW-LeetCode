
// Quick Sort
// TC: O(n log n), SC: O(n log n)

class Solution {
    func sortArray(_ list: [Int]) -> [Int] {
        var list = list
        qucikSort(&list, 0, list.count - 1)
        return list
    }
    
    func qucikSort(_ list: inout [Int], _ left: Int, _ right: Int) {
        if left >= right { return }
        var pivotIndex = partition(&list, left, right)
        qucikSort(&list, left, pivotIndex - 1)
        qucikSort(&list, pivotIndex + 1, right)
    }
    
    func partition(_ list: inout [Int], _ left: Int, _ right: Int) -> Int {
        var pivot = list[right]
        var i = left
        
        for j in left...right {
            if list[j] < pivot {
                list.swapAt(i, j)
                i = i + 1
            }
        }
        list.swapAt(i, right)
        return i
    }
}

var list = [256,336,736,443,831,907]
Solution().sortArray(list)
print(list)
print()
