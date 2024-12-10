
// Radix Sort
// TC: O(n^2) SC: O(1)

class Solution {
    func countingSort(_ list: inout [Int], _ placeVal: Int, _ K: Int = 10) {
        var counts = [Int](repeating: 0, count: K)
        
        for num in list {
            let digit =  num / placeVal % 10
            counts[digit] = counts[digit] + 1
        }
        
        var startIndex = 0
        for i in 0..<counts.count {
            let tmp = counts[i]
            counts[i] = startIndex
            startIndex = startIndex + tmp
        }
        
        var sortedList = [Int](repeating: 0, count: list.count)
        for num in list {
            let digit = num / placeVal % 10
            sortedList[counts[digit]] = num
            counts[digit] = counts[digit] + 1
        }
        
        for i in 0..<list.count {
            list[i] = sortedList[i]
        }
    }
    
    func radixSort(_ list: inout [Int]) {
        var shift = list.min()!
        for i in 0..<list.count {
            list[i] = list[i] - shift
        }
        
        let max = list.max()!
        var placeVal = 1
        while placeVal < max {
            countingSort(&list, placeVal, list.count)
            placeVal = placeVal * 10
        }
        
        for i in 0..<list.count {
            list[i] = list[i] + shift
        }
    }
}

var list = [831, 443, 256, 336, 736, 907]
Solution().radixSort(&list)
print(list)
print()


