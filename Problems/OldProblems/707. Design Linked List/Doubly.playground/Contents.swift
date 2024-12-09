
class ListNode {
    var val: Int
    var next: ListNode?
    var prev: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class MyLinkedList {
    
    var head = ListNode(-1)
    var tail = ListNode(-1)
    var count = 0
    
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
        var newNode = ListNode(val)
        newNode.next = head.next
        newNode.prev = head
        head.next?.prev = newNode
        head.next = newNode
        count = count + 1
    }
    
    func addAtTail(_ val: Int) {
        var newNode = ListNode(val)
        newNode.next = tail
        newNode.prev = tail.prev
        tail.prev?.next = newNode
        tail.prev = newNode
        count = count + 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count && index <= 0 { return }
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
        if index > count && index <= 0 { return }
        guard count > index && index >= 0 else {
                    return
                }
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
