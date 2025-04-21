/*
 You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.

 Return the number of connected components in the graph.

 Example 1:
 Input: n = 5, edges = [[0,1],[1,2],[3,4]]
 Output: 2
 
 Example 2:
 Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
 Output: 1
  
 Constraints:
 1 <= n <= 2000
 1 <= edges.length <= 5000
 edges[i].length == 2
 0 <= ai <= bi < n
 ai != bi
 There are no repeated edges.
 */


// TC: O(V + E * a(N)), E = Number of edges, V = Number of vertices
// SC: O(n), we store the root array
class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        let uf = UnionFind(n)

        for edge in edges {
            uf.union(edge[0], edge[1])
        }
        return uf.getCount()
    }
}

class UnionFind {
    var root: [Int]
    var connectedCount: Int

    init(_ n: Int) {
        root = Array(0...n)
        connectedCount = n
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
            connectedCount = connectedCount - 1
        }
    }

    func getCount() -> Int {
        return connectedCount
    }
}
