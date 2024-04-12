/*
 You are given the heads of two sorted linked lists list1 and list2.
 
 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
 
 Return the head of the merged linked list.
 
 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Example 2:
 Input: list1 = [], list2 = []
 Output: []
 
 Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// Recursion
// TC: O(n + m) SC: O(n + m)
class Solution1 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }

        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list1, list2?.next)
            return list2
        }
    }
}

// Iteration
// TC: O(n + m) SC: O(1)
class Solution2 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummyNode = ListNode(-1)
        var head = dummyNode
        var list1 = list1
        var list2 = list2
        
        while list1 != nil && list2 != nil {
            if list1!.val > list2!.val {
                dummyNode.next = list2
                list2 = list2?.next
            } else {
                dummyNode.next = list1
                list1 = list1?.next
            }
            dummyNode = dummyNode.next!
        }
        
        if list1 == nil {
            dummyNode.next = list2
        } else {
            dummyNode.next = list1
        }
        
        return head.next
    }
}
