/*
 A tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.

 Given a tree of n nodes labelled from 0 to n - 1, and an array of n - 1 edges where edges[i] = [ai, bi] indicates that there is an undirected edge between the two nodes ai and bi in the tree, you can choose any node of the tree as the root. When you select a node x as the root, the result tree has height h. Among all possible rooted trees, those with minimum height (i.e. min(h))  are called minimum height trees (MHTs).

 Return a list of all MHTs' root labels. You can return the answer in any order.

 The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.

 Example 1:
 Input: n = 4, edges = [[1,0],[1,2],[1,3]]
 Output: [1]
 Explanation: As shown, the height of the tree is 1 when the root is the node with label 1 which is the only MHT.
 
 Example 2:
 Input: n = 6, edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]
 Output: [3,4]
 */

// TC: O(n), each edge execute for twice, 2 × (n - 1) -> O(n)
// SC: O(n), graph and degree (2 * n) -> n
class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 { return [0]}

        var graph = Array(repeating: [Int](), count: n)
        var degree = Array(repeating: 0, count: n)
        var queue = [Int]()

        for edge in edges {
            let u = edge[0]
            let v = edge[1]

            graph[u].append(v)
            graph[v].append(u)

            degree[u] += 1
            degree[v] += 1
        }

        for node in 0..<n {
            if degree[node] == 1 {
                queue.append(node)
            }
        }

        var result = [Int]()
        while !queue.isEmpty {
            result = queue

            var nextLevel = [Int]()
            for node in queue {
                for neighbor in graph[node] {
                    degree[neighbor] -= 1
                    if degree[neighbor] == 1 {
                        nextLevel.append(neighbor)
                    }
                }

            }
            queue = nextLevel
        }
        return result
    }
}
