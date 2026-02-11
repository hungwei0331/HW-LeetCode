/*
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 The functions get and put must each run in O(1) average time complexity.

 Example 1:
 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4
  
 Constraints:
 1 <= capacity <= 3000
 0 <= key <= 104
 0 <= value <= 105
 At most 2 * 105 calls will be made to get and put.
 */

class Node {
    var key: Int
    var value: Int
    var prev: Node?
    var next: Node?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

// TC: get and put must each run in O(1)
// SC: O(n)
class LRUCache {
    var capacity: Int
    var head = Node(key: 0, value: 0)
    var tail = Node(key: 0, value: 0)
    var cache = [Int: Node]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveToHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let cacheNode = cache[key] {
            cacheNode.value = value
            moveToHead(cacheNode)
        } else {
            let newNode = Node(key: key, value: value)
            cache[key] = newNode
            add(newNode)
            
            if cache.count > capacity {
                if let lastNode = tail.prev {
                    remove(lastNode)
                    cache.removeValue(forKey: lastNode.key)
                }
            }
        }
    }
    
    func add(_ node: Node) {
        node.prev = head
        node.next = head.next
        
        head.next?.prev = node
        head.next = node
    }
    
    func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev
    }
    
    func moveToHead(_ node: Node) {
        remove(node)
        add(node)
    }
}
