/*
 Given a directed acyclic graph (DAG) of n nodes labeled from 0 to n - 1, find all possible paths from node 0 to node n - 1 and return them in any order.

 The graph is given as follows: graph[i] is a list of all nodes you can visit from node i (i.e., there is a directed edge from node i to node graph[i][j]).

 Example 1:
 Input: graph = [[1,2],[3],[3],[]]
 Output: [[0,1,3],[0,2,3]]
 Explanation: There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.
 
 Example 2:
 Input: graph = [[4,3,1],[3,2,4],[3],[4],[]]
 Output: [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
 */

//DFS
//TC: O(P * N), SC: O(P * N), where P is number of path, n number of node
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        
        func dfs(_ node: Int) {
            path.append(node)
            
            if node == graph.count - 1 {
                result.append(path)
            } else {
                for next in graph[node] {
                    dfs(next)
                }
            }
            path.removeLast()
        }
        
        dfs(0)
        return result
    }
}


