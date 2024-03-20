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

// O(1) for addAtHead. O(k) for get, addAtIndex and deleteAtIndex,
// where kkk is an index of the element
// O(N) for addAtTail.
// SC: O(1)
class MyLinkedList {
    
    var head: Node?
    var count: Int
    
    init() {
        self.head = nil
        self.count = 0
    }
    
    func get(_ index: Int) -> Int {
        if index >= count { return -1 }
        
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node!.val
    }
    
    func addAtHead(_ val: Int) {
        var node = Node(val)
        node.next = head
        head = node
        count = count + 1
    }
    
    func addAtTail(_ val: Int) {
        if count == 0 {
            addAtHead(val)
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        var node = Node(val)
        current?.next = node
        count = count + 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count { return }
        if index == 0 {
            addAtHead(val)
            return
        }
        
        var current = head
        var prev: Node?
        
        for _ in 0..<index {
            prev = current
            current = current?.next
        }
        
        var node = Node(val)
        prev?.next = node
        node.next = current
        count = count + 1
    }
    
    func deleteAtIndex(_ index: Int) {
        if index >= count { return }
        if index == 0 {
            head = head?.next
            count = count - 1
            return
        }
        
        var current = head
        var prev: Node?
        
        for _ in 0..<index {
            prev = current
            current = current?.next
        }
        
        prev?.next = current?.next
        count = count - 1
    }
}

class Node {
    var val: Int
    var next: Node?
    init(_ val: Int) {
        self.val = val
    }
}
