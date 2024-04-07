/*
 Given the head of a singly linked list, reverse the list, and return the reversed list.
 
 Example 1:
 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 
 Example 2:
 Input: head = [1,2]
 Output: [2,1]
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//Iteratively
//TC: O(N) SC: O(1)
class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var head = head
        
        while head != nil {
            var nextNode = head?.next
            head?.next = prev
            prev = head
            head = nextNode
        }
        return prev
    }
}

//Recursively
//TC: O(N) SC: O(N) <-- call stack
class Solution2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var reverseList = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return reverseList
    }
}
