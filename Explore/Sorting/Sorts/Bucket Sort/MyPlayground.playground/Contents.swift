
// Bucket Sort
// TC: O(nlogn), worst case O(n^2)
// SC: O(n + k),

class Solution {
    func bucketSort(_ list: inout [Int], _ k: Int) {
        var buckets = Array(repeating: [Int](), count: k)
        let shift = list.min()!
        let maxVal = list.max()! - shift
        let bucketSize = max(1, maxVal / k)
        
        for element in list {
            let index = (element - shift) / bucketSize
            if index == k {
                buckets[k - 1].append(element)
            } else {
                buckets[index].append(element)
            }
        }
        
        for i in 0..<k {
            buckets[i].sort()
        }
        
        var sortedArray: [Int] = []
        sortedArray = buckets.flatMap{ $0 }
        
        for i in 0..<list.count {
            list[i] = sortedArray[i]
        }
    }
}

var list = [42, 32, 33, 52, 37, 47, 51], k = 5
Solution().bucketSort(&list, k)
print(list)
print()
