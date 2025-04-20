/*
 You have a graph of n nodes labeled from 0 to n - 1. You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that there is an undirected edge between nodes ai and bi in the graph.

 Return true if the edges of the given graph make up a valid tree, and false otherwise.

 Example 1:
 Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
 Output: true
 
 Example 2:
 Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
 Output: false
 */

// TC: O(n * a(n)), n edges call O(a(n)) find
// SC: O(n), store root vertex array

/// is vaild tree
/// 1. edges.count  equal vertex - 1
/// 2. have loop
/// 3. all node has been connected
class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if n - 1 != edges.count { return false }
        
        var root = Array(0...n)
        
        func find(_ x: Int) -> Int {
            if x == root[x] {
                return x
            }
            root[x] = find(root[x])
            return root[x]
        }
        
        func union(_ x: Int, _ y: Int) -> Bool {
            let rootX = find(x)
            let rootY = find(y)
            
            if rootX == rootY {
                return false
            }
            root[rootY] = rootX
            return true
        }
        
        for edge in edges {
            if !union(edge[0], edge[1]) {
                return false
            }
        }
        return true
    }
}

