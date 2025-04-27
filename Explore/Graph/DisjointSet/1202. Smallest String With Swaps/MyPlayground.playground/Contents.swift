/*
 You are given a string s, and an array of pairs of indices in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string.

 You can swap the characters at any pair of indices in the given pairs any number of times.

 Return the lexicographically smallest string that s can be changed to after using the swaps.

 Example 1:
 Input: s = "dcab", pairs = [[0,3],[1,2]]
 Output: "bacd"
 Explaination:
 Swap s[0] and s[3], s = "bcad"
 Swap s[1] and s[2], s = "bacd"
 
 Example 2:
 Input: s = "dcab", pairs = [[0,3],[1,2],[0,2]]
 Output: "abcd"
 Explaination:
 Swap s[0] and s[3], s = "bcad"
 Swap s[0] and s[2], s = "acbd"
 Swap s[1] and s[2], s = "abcd"
 
 Example 3:
 Input: s = "cba", pairs = [[0,1],[1,2]]
 Output: "abc"
 Explaination:
 Swap s[0] and s[1], s = "bca"
 Swap s[1] and s[2], s = "bac"
 Swap s[0] and s[1], s = "abc"
  
 Constraints:
 1 <= s.length <= 10^5
 0 <= pairs.length <= 10^5
 0 <= pairs[i][0], pairs[i][1] < s.length
 s only contains lower case English letters.
 */

// TC: O(m + n \log n)
// SC: O(n)
class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        var uf = UnionFind(s.count)
        var group = [Int: [Int]]()
        var chars = Array(s)
        
        for pair in pairs {
            uf.union(pair[0], pair[1])
        }
        
        for i in 0..<s.count {
            let root = uf.find(i)
            group[root, default: []].append(i)
        }
        
        var result = Array(repeating: Character(" "), count: s.count)
        
        for indices in group.values {
            var tmpChars = [Character]()
            for index in indices {
                tmpChars.append(chars[index])
            }
            
            tmpChars.sort()
            let sortedIndices = indices.sorted()

            for (i, index) in sortedIndices.enumerated() {
                result[index] = tmpChars[i]
            }
        }
        return String(result)
    }
    
    class UnionFind {
        var root: [Int]
        
        init(_ n: Int) {
            root = Array(0..<n)
        }
        
        func find(_ x: Int) -> Int {
            if x == root[x] {
                return x
            }
            root[x] = find(root[x])
            return root[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            
            if rootX != rootY {
                root[rootY] = rootX
            }
        }
    }
}
