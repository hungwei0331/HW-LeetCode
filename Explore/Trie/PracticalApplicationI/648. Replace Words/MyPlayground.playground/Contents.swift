/*
 In English, we have a concept called root, which can be followed by some other word to form another longer word - let's call this word derivative. For example, when the root "help" is followed by the word "ful", we can form a derivative "helpful".

 Given a dictionary consisting of many roots and a sentence consisting of words separated by spaces, replace all the derivatives in the sentence with the root forming it. If a derivative can be replaced by more than one root, replace it with the root that has the shortest length.

 Return the sentence after the replacement.

 Example 1:
 Input: dictionary = ["cat","bat","rat"], sentence = "the cattle was rattled by the battery"
 Output: "the cat was rat by the bat"
 
 Example 2:
 Input: dictionary = ["a","b","c"], sentence = "aadsfasf absbs bbab cadsfafs"
 Output: "a a b c"
 */

// Let d be the number of words in the dictionary, s be the number of words in the sentence, and w be the average length of each word.
// TC: O(d * w + s * w)
// SC: O(d * w + s * w)
class Solution {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        var trie = Trie()
        
        for word in dictionary {
            trie.insertWord(word)
        }
        
        let words = sentence.split(separator: " ")
        var result = [String]()
        
        for word in words {
            if let prefix = trie.getShortestPrefix( String(word) ) {
                result.append(prefix)
            } else {
                result.append(String(word))
            }
        }
        return result.joined(separator: " ")
    }
    
    class TrieNode {
        var children = [Character: TrieNode]()
        var isEndOfWorld = false
    }
    
    class Trie {
        private let root = TrieNode()
        
        func insertWord(_ word: String) {
            var current = root
            for char in word {
                if current.children[char] == nil {
                    current.children[char] = TrieNode()
                }
                current = current.children[char]!
            }
            current.isEndOfWorld = true
        }
        
        func getShortestPrefix(_ word: String) -> String? {
            var current = root
            var prefix = String()
            
            for char in word {
                if let nextNode = current.children[char] {
                    prefix.append(char)
                    current = nextNode
                    if current.isEndOfWorld {
                        return prefix
                    }
                } else {
                    break
                }
            }
            return nil
        }
    }
}



