/*
 Design a HashSet without using any built-in hash table libraries.

 Implement MyHashSet class:

 void add(key) Inserts the value key into the HashSet.
 bool contains(key) Returns whether the value key exists in the HashSet or not.
 void remove(key) Removes the value key in the HashSet. If key does not exist in the HashSet, do nothing.
  
 Example 1:
 Input
 ["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
 [[], [1], [2], [1], [3], [2], [2], [2], [2]]
 Output
 [null, null, null, true, false, null, true, null, false]

 Explanation
 MyHashSet myHashSet = new MyHashSet();
 myHashSet.add(1);      // set = [1]
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(1); // return True
 myHashSet.contains(3); // return False, (not found)
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(2); // return True
 myHashSet.remove(2);   // set = [1]
 myHashSet.contains(2); // return False, (already removed)
 */

class ListNode {
    var key: Int
    var next: ListNode?
    init(_ key: Int, next: ListNode? = nil) {
        self.key = key
        self.next = next
    }
}

// TC: O(N / K) SC: O(K + M)

class MyHashSet {
    
    var capacity: Int
    var bucket: [ListNode?]

    init() {
        capacity = 769
        bucket = Array(repeating: nil, count: capacity)
    }
    
    func add(_ key: Int) {
        if contains(key) {
            return
        }
        
        let index = getIndex(key)
        var newNode = ListNode(key)
        
        if bucket[index] == nil {
            bucket[index] = newNode
        } else {
            var current = bucket[index]
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    func remove(_ key: Int) {
        let index = getIndex(key)
        var current = bucket[index]
        var prev: ListNode?
        
        while current != nil {
            if current!.key == key {
                if prev == nil {
                    bucket[index] = current?.next
                } else {
                    prev?.next = current?.next
                }
                break
            }
            prev = current
            current = current?.next
        }
    }
    
    func contains(_ key: Int) -> Bool {
        var index = getIndex(key)
        var current = bucket[index]
        
        while current != nil {
            if current!.key == key {
                return true
            }
            current = current?.next
        }
        return false
    }
    
    func getIndex(_ key: Int) -> Int {
        return key % capacity
    }
}
