/*
 Design a map that allows you to do the following:

 Maps a string key to a given value.
 Returns the sum of the values that have a key with a prefix equal to a given string.
 Implement the MapSum class:

 MapSum() Initializes the MapSum object.
 void insert(String key, int val) Inserts the key-val pair into the map. If the key already existed, the original key-value pair will be overridden to the new one.
 int sum(string prefix) Returns the sum of all the pairs' value whose key starts with the prefix.
  
 Example 1:
 Input
 ["MapSum", "insert", "sum", "insert", "sum"]
 [[], ["apple", 3], ["ap"], ["app", 2], ["ap"]]
 Output
 [null, null, 3, null, 5]

 Explanation
 MapSum mapSum = new MapSum();
 mapSum.insert("apple", 3);
 mapSum.sum("ap");           // return 3 (apple = 3)
 mapSum.insert("app", 2);
 mapSum.sum("ap");           // return 5 (apple + app = 3 + 2 = 5)
 */

// TC: O(m), which m is key length
// TC: O(m), which m is prefix length
class MapSum {
    var root: TrieNode
    var keyValueMap = [String: Int]()
    
    init() {
        root = TrieNode()
    }
    
    func insert(_ key: String, _ val: Int) {
        let delta = val - (keyValueMap[key] ?? 0)
        keyValueMap[key] = val
        
        var current = root
        for char in key {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
            current.value += delta
        }
    }
    
    func sum(_ prefix: String) -> Int {
        var current = root
        for char in prefix {
            guard let nextNode = current.children[char] else {
                return 0
            }
            current = nextNode
        }
        return current.value
    }
}

class TrieNode {
    var children = [Character: TrieNode]()
    var value = 0
}
