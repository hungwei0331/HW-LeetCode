
// Heap Sort
// TC: O(NlogN) SC: O(1)

class Solution {
    func heapSort(_ list: inout [Int]) {
        func maxHeapify(_ heapSize: Int, _ index: Int) {
            let left = 2 * index + 1
            let right = 2 * index + 2
            var largest = index
            
            if left < heapSize && list[left] > list[largest] {
                largest = left
            }
            
            if right < heapSize && list[right] > list[largest] {
                largest = right
            }
            
            if index != largest {
                list.swapAt(index, largest)
                maxHeapify(heapSize, largest)
            }
        }
        
        let startIndex = list.count / 2 - 1
        for i in (0..<startIndex).reversed() {
            maxHeapify(list.count, i)
        }
        
        for i in (1..<list.count).reversed() {
            list.swapAt(0, i)
            maxHeapify(i, 0)
        }
    }
}

var list = [7, 3, 2, 5, 6, 10, 9, 8, 1]
Solution().heapSort(&list)
print(list)
print()
  
