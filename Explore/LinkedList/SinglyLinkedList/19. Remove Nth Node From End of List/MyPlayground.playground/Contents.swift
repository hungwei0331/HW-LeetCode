/*
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

 Example 1:
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 
 Example 2:
 Input: head = [1], n = 1
 Output: []
 
 Example 3:
 Input: head = [1,2], n = 1
 Output: [1]

 */

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

// TC: O(N) SC:O(1)
// Aproch1: two pass
class Solution1 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        //step1: find the length of List
        
        var length = 0
        var current = head
        
        while current != nil {
            current = current?.next
            length = length + 1
        }
        
        if length == n {
            return head?.next
        }
        
        //setp2: remove node
        var nodeBeforeNodeToRemove = length - n - 1
        current = head
        
        for _ in 0..<nodeBeforeNodeToRemove {
            current = current?.next
        }
        
        current?.next = current?.next?.next
        return head
        
    }
}

// TC: O(N) SC:O(1)
// Aproch2: one pass
class Solution2 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var current = head
        
        for _ in 0..<n {
            current = current?.next
        }
        
        if current == nil {
            return head?.next
        }
        
        var nodeBeforeRemove = head
        
        while current?.next != nil {
            current = current?.next
            nodeBeforeRemove = nodeBeforeRemove?.next
        }
        
        nodeBeforeRemove?.next = nodeBeforeRemove?.next?.next
        return head
        
    }
}
