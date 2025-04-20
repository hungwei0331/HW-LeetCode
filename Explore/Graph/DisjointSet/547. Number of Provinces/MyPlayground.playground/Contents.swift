/*
 There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.

 A province is a group of directly or indirectly connected cities and no other cities outside of the group.

 You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.

 Return the total number of provinces.

 Example 1:
 Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
 Output: 2
 
 Example 2:
 Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
 Output: 3
  
 Constraints:
 1 <= n <= 200
 n == isConnected.length
 n == isConnected[i].length
 isConnected[i][j] is 1 or 0.
 isConnected[i][i] == 1
 isConnected[i][j] == isConnected[j][i]
 */

// TC: O(O^2), for loop to n x n array
// SC: O(n), store root and rank array
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let uf = UnionFind(isConnected.count)
        
        for i in 0..<isConnected.count {
            for j in (i + 1)..<isConnected.count {
                if isConnected[i][j] == 1 {
                    uf.union(i, j)
                }
            }
        }
        return uf.provinces
    }
}

class UnionFind {
    var root: [Int]
    var rank: [Int]
    var provinces: Int
    
    init(_ size: Int) {
        self.root = Array(0...size)
        self.rank = Array(repeating: 1, count: size)
        self.provinces = size
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
            if rank[rootX] > rank[rootY] {
                root[rootY] = rootX
            } else if rank[rootX] < rank[rootY] {
                root[rootX] = rootY
            } else { //rank equal
                root[rootY] = rootX
                rank[rootX] += 1
            }
            provinces = provinces - 1
        }
    }
    
    func getCount() -> Int {
        return provinces
    }
}

