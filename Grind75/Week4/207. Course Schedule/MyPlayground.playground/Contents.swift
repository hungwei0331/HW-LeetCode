/*
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return true if you can finish all courses. Otherwise, return false.

 Example 1:
 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0. So it is possible.
 
 Example 2:
 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
  
 Constraints:
 1 <= numCourses <= 2000
 0 <= prerequisites.length <= 5000
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 All the pairs prerequisites[i] are unique.
 */

// Topological Sort
// 1. generate graph by dictonary
// 2. calculuate in-degree in an array
// 3. start(append) the in-drgrees node to queue
// 4. if visited, in-digress minus 1
// 5. until all node in-digres become zero, then finish sort

// TC: O(V + E), generate graph cost O(E), visit each node from queue cost O(V)
// SC: O(V + E), in-degress cost O(V), graph cost O(E), queue store most V nodes
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Int: [Int]]()
        var inDegree = Array(repeating: 0, count: numCourses)
        var finishedCourse = 0
        
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let preCourse = prerequisite[1]
            graph[preCourse, default: []].append(course)
            inDegree[course] += 1
        }
        
        var queue = [Int]()
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let course = queue.removeFirst()
            finishedCourse = finishedCourse + 1
            
            for neighbor in graph[course]! {
                inDegree[neighbor] -= 1
                if inDegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
            finishedCourse = finishedCourse + 1
        }
        return numCourses == finishedCourse
    }
}
