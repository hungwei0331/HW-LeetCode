/*
 Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

 The first node is considered odd, and the second node is even, and so on.

 Note that the relative order inside both the even and odd groups should remain as it was in the input.

 You must solve the problem in O(1) extra space complexity and O(n) time complexity.

 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [1,3,5,2,4]
 
 Example 2:
 Input: head = [2,1,3,5,6,4,7]
 Output: [2,3,6,7,1,5,4]
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// TC: O(N) SC:O(1)
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        if head == nil { return nil }
        
        var odd = head
        var even = head?.next
        var evenHead = even
        
        while even != nil && even?.next != nil {
            odd?.next = odd?.next?.next
            even?.next = even?.next?.next
            odd = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        return head
    }
}
