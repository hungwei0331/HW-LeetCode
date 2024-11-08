/*
 Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

 Example 1:
 Input: head = [1,2,3,4]
 Output: [2,1,4,3]
 Explanation:

 Example 2:
 Input: head = []
 Output: []

 Example 3:
 Input: head = [1]
 Output: [1]

 Example 4:
 Input: head = [1,2,3]
 Output: [2,1,3]

 Constraints:
 The number of nodes in the list is in the range [0, 100].
 0 <= Node.val <= 100
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// TC: O(n) SC: O(n)
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let first = head, let second = head?.next else {
            return head
        }
        
        first.next = swapPairs(second.next)
        second.next = first
        
        return second
    }
}
