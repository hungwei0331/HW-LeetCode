
// Radix Sort
// TC: O(W(N+K)),  Let W be the maximum digit length within the list of integers.
// Let N be the size of the original input integer array. And lastly, since we are using counting sort,
// we must also be aware of the alphabet size K.
// SC: O(N+K),  The amount of extra space needed is the same as counting sort – O(N+K).

class Solution {
    func countingSort(_ list: inout [Int], _ placeVal: Int, _ k: Int = 10) {
        var counts = [Int](repeating: 0, count: k)
        
        for num in list {
            let digital = (num / placeVal) % 10
            counts[digital] = counts[digital] + 1
        }
        
        var startIndex = 0
        for i in 0..<counts.count {
            let count = counts[i]
            counts[i] = startIndex
            startIndex = startIndex + count
        }
        
        var sortedList = [Int](repeating: 0, count: list.count)
        for num in list {
            let digital = (num / placeVal) % 10
            let index = counts[digital]
            sortedList[index] = num
            counts[digital] = counts[digital] + 1
        }
        
        for i in 0..<sortedList.count {
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
            countingSort(&list, placeVal)
            placeVal = placeVal * 10
        }
        
        for i in 0..<list.count {
            list[i] = list[i] + shift
        }
    }
}

var list = [256,336,736,443,831,907]
Solution().radixSort(&list)
print(list)
print()
