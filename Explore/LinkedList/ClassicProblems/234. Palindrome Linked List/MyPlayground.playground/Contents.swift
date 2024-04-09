/*
 Given the head of a singly linked list, return true if it is a
 palindrome
  or false otherwise.

 Example 1:
 Input: head = [1,2,2,1]
 Output: true
 
 Example 2:
 Input: head = [1,2]
 Output: false
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//TC: O(N) SC: O(N)
// copy val of listNode into array, then compare orginal and reverse
class Solution1 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var list = [Int]()
        var current = head
        
        while current != nil {
            list.append(current?.val ?? 0)
            current = current?.next
        }
        
        var reverse: [Int] = list.reversed()
        
        for i in 0..<list.count - 1 {
            if list[i] != reverse[i] {
                return false
            }
        }
        return true
    }
}


//TC: O(N) SC: O(1)
// step1: find the middle point
// step2: reverse second half
// step3: compare head and second half
class Solution2 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head
        var middleHalf = findMiddle(head)
        middleHalf = reverse(middleHalf)
        
        while middleHalf != nil {
            if middleHalf?.val != head?.val {
                return false
            }
            head = head?.next
            middleHalf = middleHalf?.next
        }
        
        return true
    }
    
    func findMiddle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var head = head
        var prev: ListNode?
        
        while head != nil {
            var nextNode = head?.next
            head?.next = prev
            prev = head
            head = nextNode
        }
        return prev
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(2)
head.next?.next?.next = ListNode(1)
//head.next?.next?.next?.next = ListNode(1)

//print(Solution1().isPalindrome(head))
print(Solution2().isPalindrome(head))
