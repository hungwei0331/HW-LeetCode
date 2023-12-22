//Given the head of a singly linked list, reverse the list, and return the reversed list.

/*
Example 1:
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]

Example 2:
Input: head = [1,2]
Output: [2,1]

Example 3:
Input: head = []
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var stack = [Int]()
        var tmpHead = head
        
        while tmpHead != nil {
            stack.append(tmpHead!.val)
            let second = tmpHead?.next
            tmpHead = second
        }
        
        tmpHead = head
        
        while tmpHead != nil {
            tmpHead!.val = stack.popLast()!
            let second = tmpHead?.next
            tmpHead = second
        }
        return head
    }
}

//let solution = Solution()
//
//let fifthNode = ListNode(5, nil)
//let fourthNode = ListNode(4, fifthNode)
//let thirdNode = ListNode(3, fourthNode)
//let secNode = ListNode(2, thirdNode)
//let headNode = ListNode(1, secNode)
//
//let listNode = solution.reverseList(headNode)


