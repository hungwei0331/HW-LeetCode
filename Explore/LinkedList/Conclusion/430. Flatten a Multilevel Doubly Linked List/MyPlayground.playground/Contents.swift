/*
 You are given a doubly linked list, which contains nodes that have a next pointer, a previous pointer, and an additional child pointer. This child pointer may or may not point to a separate doubly linked list, also containing these special nodes. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure as shown in the example below.
 
 Given the head of the first level of the list, flatten the list so that all the nodes appear in a single-level, doubly linked list. Let curr be a node with a child list. The nodes in the child list should appear after curr and before curr.next in the flattened list.
 
 Return the head of the flattened list. The nodes in the list must have all of their child pointers set to null.
 
 Example 1:
 Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
 Output: [1,2,3,7,8,11,12,9,10,4,5,6]
 Explanation: The multilevel linked list in the input is shown.
 After flattening the multilevel linked list it becomes:
 
 Example 2:
 Input: head = [1,2,null,3]
 Output: [1,3,2]
 Explanation: The multilevel linked list in the input is shown.
 After flattening the multilevel linked list it becomes:
 
 Example 3:
 Input: head = []
 Output: []
 Explanation: There could be empty list in the input.
 */

public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

// DFS by Iteration(Stack)
// TC: O(N) SC: O(N)
class Solution {
    func flatten(_ head: Node?) -> Node? {
        if head == nil { return nil }
        var tail = Node(-1)
        var stack = [head!]
        
        while !stack.isEmpty {
            var node = stack.popLast()!
            node.prev = tail
            tail.next = node
            tail = node
            
            if let nextNode = node.next {
                stack.append(nextNode)
            }
            
            if let child = node.child {
                stack.append(child)
                node.child = nil
            }
        }
        
        tail.next = nil
        head?.prev = nil
        return head
    }
}




































//class Solution {
//    func flatten(_ head: Node?) -> Node? {
//        if head == nil { return nil }
//        var tail = Node(0)
//        var stack: [Node] = [head!]
//        
//        while let node = stack.popLast() {
//            tail.next = node
//            node.prev = tail
//            tail = node
//            if let next = node.next {
//                stack.append(next)
//            }
//            
//            if let child = node.child {
//                stack.append(child)
//                node.child = nil
//            }
//        }
//        tail.next = nil
//        head!.prev = nil
//        return head
//    }
//}