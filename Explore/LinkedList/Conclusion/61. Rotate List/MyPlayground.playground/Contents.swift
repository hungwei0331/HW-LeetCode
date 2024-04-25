/*
 Given the head of a linked list, rotate the list to the right by k places.
 
 Example 1:
 Input: head = [1,2,3,4,5], k = 2
 Output: [4,5,1,2,3]
 
 Example 2:
 Input: head = [0,1,2], k = 4
 Output: [2,0,1]
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// TC: O(N) SC: O(1)
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil}
        
        var length = 1
        var tail = head
        
        while tail?.next != nil {
            length = length + 1
            tail = tail?.next
        }
        
        var steps = k % length
        if steps == 0 { return head }
        
        var newTail = head
        for _ in 0..<(length - steps - 1) {
            newTail = newTail?.next
        }
        
        var newHead = newTail?.next
        newTail?.next = nil
        tail?.next = head
        
        return newHead
    }
}
