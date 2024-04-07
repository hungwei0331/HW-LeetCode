/*
 Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

  

 Example 1:
 Input: head = [1,2,6,3,4,5,6], val = 6
 Output: [1,2,3,4,5]
 
 Example 2:
 Input: head = [], val = 1
 Output: []
 
 Example 3:
 Input: head = [7,7,7,7], val = 7
 Output: []
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return nil }
        
        var current = head
        
        while current?.next != nil {
            if current?.next?.val == val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return head?.val == val ? head?.next : head
    }
}
