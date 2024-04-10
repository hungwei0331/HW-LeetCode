/*
 Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
 A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
 If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

 Implement the MyLinkedList class:

 MyLinkedList() Initializes the MyLinkedList object.
 int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
 void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 void addAtTail(int val) Append a node of value val as the last element of the linked list.
 void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
 void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
 
 Example 1:
 Input
 ["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
 [[], [1], [3], [1, 2], [1], [1], [1]]
 Output
 [null, null, null, null, 2, null, 3]

 Explanation
 MyLinkedList myLinkedList = new MyLinkedList();
 myLinkedList.addAtHead(1);
 myLinkedList.addAtTail(3);
 myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
 myLinkedList.get(1);              // return 2
 myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
 myLinkedList.get(1);              // return 3
 */

class ListNode {
    var val: Int
    var next: ListNode?
    var prev: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}


class MyLinkedList {
    
    var count = 0
    var head = ListNode(-1)
    var tail = ListNode(-1)
    
    init() {
        head.next = tail
        tail.prev = head
    }
    
    func get(_ index: Int) -> Int {
        if index > count || index < 0 { return -1 }
        var node = head.next
        var index = index
        while index > 0 {
            node = node?.next
            index = index - 1
        }
        return node!.val
    }
    
    func addAtHead(_ val: Int) {
        var node = ListNode(val)
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
        count = count + 1
    }
    
    func addAtTail(_ val: Int) {
        var node = ListNode(val)
        node.next = tail
        node.prev = tail.prev
        tail.prev?.next = node
        tail.prev = node
        count = count + 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count || index < 0 { return }
        var node: ListNode? = head
        var index = index
        while index > 0 {
            node = node?.next
            index = index - 1
        }
        var newNode = ListNode(val)
        newNode.next = node?.next
        newNode.prev = node
        node?.next?.prev = newNode
        node?.next = newNode
        count = count + 1
    }
    
    func deleteAtIndex(_ index: Int) {
        if index > count || index < 0 { return }
        var node: ListNode? = head.next
        var index = index
        while index > 0 {
            node = node?.next
            index = index - 1
        }
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        count = count - 1
    }
}
