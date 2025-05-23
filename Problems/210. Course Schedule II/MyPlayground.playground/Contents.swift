/*
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

 Example 1:
 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
 
 Example 2:
 Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
 
 Example 3:
 Input: numCourses = 1, prerequisites = []
 Output: [0]
  
 Constraints:
 1 <= numCourses <= 2000
 0 <= prerequisites.length <= numCourses * (numCourses - 1)
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 ai != bi
 All the pairs [ai, bi] are distinct.
 */


// Topological Sort
// 1. generate graph by dictonary
// 2. calculuate in-degree in an array
// 3. start(append) the in-drgrees node to queue
// 4. if visited, in-digress minus 1
// 5. until all node in-digres become zero, then finish sort

// TC: O(V + E), generate graph cost O(E), visit each node from queue cost O(V)
// SC: O(V + E), in-degress cost O(V), graph cost O(E),
//               queue store most V nodes, courses store V nodes


class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = [Int: [Int]]()
        var indegree = Array(repeating: 0, count: numCourses)
        
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let prere = prerequisite[1]
            
            graph[prere, default: []].append(course)
            indegree[course] += 1
        }
        
        var queue = [Int]()
        var courses = [Int]()
        
        for i in 0..<indegree.count {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let course = queue.removeFirst()
            courses.append(course)
            
            for neighbor in graph[course] ?? [] {
                indegree[neighbor] -= 1
                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        return courses
    }
}

//Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
//Output: [0,2,1,3]
