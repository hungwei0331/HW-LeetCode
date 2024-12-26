/*
 A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

 Implement the Trie class:

 Trie() Initializes the trie object.
 void insert(String word) Inserts the string word into the trie.
 boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
 boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
  
 Example 1:
 Input
 ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
 [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
 Output
 [null, null, true, false, true, null, true]

 Explanation
 Trie trie = new Trie();
 trie.insert("apple");
 trie.search("apple");   // return True
 trie.search("app");     // return False
 trie.startsWith("app"); // return True
 trie.insert("app");
 trie.search("app");     // return True
 */

// TC: O(m), where m is length of the key
// SC: O(m), In the worst case, each newly inserted key might require adding m new nodes
class Trie {
    var root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var current = root
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = find(word) else { return false }
        return node.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return find(prefix) != nil
    }
    
    private func find(_ word: String) -> TrieNode? {
        var current = root
        for char in word {
            guard let nextNode = current.children[char] else { return nil }
            current = nextNode
        }
        return current
    }
}

class TrieNode {
    var children = [Character: TrieNode]()
    var isEndOfWord = false
}
