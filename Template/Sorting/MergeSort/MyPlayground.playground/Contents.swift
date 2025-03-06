
// Merge Sort
//
// TC: O(NlogN), This dividing step computes the midpoint of each of the sublists,
// which takes O(1) time. This step is repeated N times until a single element remains
// it takes O(N) time for the merging process to complete on each level.
// And since there are atotal oflogN levels,
// the overall complexity of the merge process is O(NlogN)
//
// SC: O(N), where N is the length of the input list

class Solution {
    func mergeSort(_ list: [Int]) -> [Int] {
        if list.count <= 1 { return list }
        
        let mid = list.count / 2
        let left = mergeSort(Array(list[0..<mid]))
        let right = mergeSort(Array(list[mid...]))
        
        return merge(left, right)
    }
    
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var merge = [Int]()
        var i = 0, j = 0
        
        while i < left.count && j < right.count {
            if left[i] <= right[j] {
                merge.append(left[i])
                i = i + 1
            } else {
                merge.append(right[j])
                j = j + 1
            }
        }
        
        while i < left.count {
            merge.append(left[i])
            i = i + 1
        }
    
        while j < right.count {
            merge.append(right[j])
            j = j + 1
        }
        return merge
    }
}

var list = [256,336,736,443,831,907]
let sortedList = Solution().mergeSort(list)
print(sortedList)
print()
