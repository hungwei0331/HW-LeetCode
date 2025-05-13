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
  
 Constraints:
 1 <= word.length, prefix.length <= 2000
 word and prefix consist only of lowercase English letters.
 At most 3 * 104 calls in total will be made to insert, search, and startsWith.
 */

// Insert
// TC: O(n), where n is the length of the key
// SC: O(n), each newly inserted key might require adding n new nodes

// Search
// TC: O(n), Each step involves searching for the next character of the key, requiring n operations in the worst case.
// SC: O(1)

// Search for a Key Prefix
// TC: O(n), Traverse the Trie from the root until the end of the prefix or until it is no longer possible to continue the path.
// SC: O(1)

class Trie {
    class TrieNode {
        var children = [Character: TrieNode]()
        var isEnd = false
    }
    
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
        current.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var current = root
        for char in word {
            if let next = current.children[char] {
                current = next
            } else {
                return false
            }
        }
        return current.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = root
        for char in prefix {
            if let next = current.children[char] {
                current = next
            } else {
                return false
            }
        }
        return true
    }
}
