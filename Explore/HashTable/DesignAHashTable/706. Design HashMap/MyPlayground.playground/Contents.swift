/*
 Design a HashMap without using any built-in hash table libraries.

 Implement the MyHashMap class:

 MyHashMap() initializes the object with an empty map.
 void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
 int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
 void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.
  
 Example 1:
 Input
 ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
 [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
 Output
 [null, null, null, 1, -1, null, 1, null, -1]

 Explanation
 MyHashMap myHashMap = new MyHashMap();
 myHashMap.put(1, 1); // The map is now [[1,1]]
 myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
 myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
 myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
 myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
 myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
 myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
 myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]
 */

// TC: O(N / K) SC: O(K + M)

class ListNode {
    var key: Int
    var value: Int
    var next: ListNode?
    
    init(key: Int, value: Int, _ next: ListNode? = nil) {
        self.key = key
        self.value = value
        self.next = next
    }
}

class MyHashMap {
    
    let capacity: Int = 2069
    var hashMap: [ListNode?]

    init() {
        hashMap = Array(repeating: nil, count: capacity)
    }
    
    func getIndex(_ key: Int) -> Int {
        return key % capacity
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = getIndex(key)
        var node = hashMap[index]
        while node != nil {
            if node!.key == key {
                node!.value = value
                return
            }
            node = node!.next
        }
        var newNode = ListNode(key: key, value: value)
        newNode.next = hashMap[index]
        hashMap[index] = newNode
    }
    
    func get(_ key: Int) -> Int {
        let index = getIndex(key)
        var node = hashMap[index]
        
        while node != nil {
            if node!.key == key {
                return node!.value
            }
            node = node!.next
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let index = getIndex(key)
        var current = hashMap[index]
        var prev: ListNode?
        
        while current != nil {
            
            if current!.key == key {
                if prev != nil {
                    prev!.next = current!.next
                } else {
                    hashMap[index] = current!.next
                }
                return
            }
            prev = current
            current = current!.next
        }
    }
}

