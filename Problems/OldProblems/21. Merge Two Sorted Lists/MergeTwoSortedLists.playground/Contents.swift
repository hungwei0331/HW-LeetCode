/*
 You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.
 
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Input: list1 = [], list2 = []
 Output: []
 
 Input: list1 = [], list2 = [0]
 Output: [0]
 */

//Runtime: 21 ms, faster than 25.90% of Swift online submissions for Merge Two Sorted Lists.
//Memory Usage: 14.1 MB, less than 7.98% of Swift online submissions for Merge Two Sorted Lists.

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        var result: ListNode?
        
        if list1!.val < list2!.val {
            result = list1
            result!.next = mergeTwoLists(list1!.next, list2)
        } else {
            result = list2
            result!.next = mergeTwoLists(list1, list2!.next)
        }
        return result
    }
}

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
