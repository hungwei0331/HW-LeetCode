/*
 Design a data structure that supports adding new words and finding if a string matches any previously added string.
 
 Implement the WordDictionary class:
 
 WordDictionary() Initializes the object.
 void addWord(word) Adds word to the data structure, it can be matched later.
 bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
 
 Example:
 Input
 ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
 [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
 Output
 [null,null,null,null,false,true,true,true]
 
 Explanation
 WordDictionary wordDictionary = new WordDictionary();
 wordDictionary.addWord("bad");
 wordDictionary.addWord("dad");
 wordDictionary.addWord("mad");
 wordDictionary.search("pad"); // return False
 wordDictionary.search("bad"); // return True
 wordDictionary.search(".ad"); // return True
 wordDictionary.search("b.."); // return True
 
 Constraints:
 1 <= word.length <= 25
 word in addWord consists of lowercase English letters.
 word in search consist of '.' or lowercase English letters.
 There will be at most 2 dots in word for search queries.
 At most 104 calls will be made to addWord and search.
 */

// TC: O(N * 26^M), O(M) for the "well-defined" words without dots, where M is the key length, and N is a number of keys, and O(N * 26^M) for the "undefined" words.
// SC: O(M), O(1) for the search of "well-defined" words without dots, and up to O(M) for the "undefined" words, to keep the recursion stack.
class WordDictionary {
    
    class TrieNode {
        var children = [Character: TrieNode]()
        var isEndOfWord = false
    }
    
    var root: TrieNode
    
    init() {
        root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var currentNode = root
        for char in word {
            if currentNode.children[char] == nil {
                currentNode.children[char] = TrieNode()
            }
            currentNode = currentNode.children[char]!
        }
        currentNode.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        return dfs(0, Array(word), root)
    }
    
    func dfs(_ index: Int, _ characters: [Character], _ node: TrieNode) -> Bool {
        if index == characters.count { return node.isEndOfWord }
        let char = characters[index]
        
        if char == "." {
            for child in node.children.values {
                if dfs(index + 1, characters, child) {
                    return true
                }
            }
        } else {
            guard let nextNode = node.children[char] else { return false }
            return dfs(index + 1, characters, nextNode)
        }
        return false
    }
}





