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
