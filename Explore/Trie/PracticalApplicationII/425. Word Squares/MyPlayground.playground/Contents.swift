/*
 Given an array of unique strings words, return all the word squares you can build from words. The same word from words can be used multiple times. You can return the answer in any order.

 A sequence of strings forms a valid word square if the kth row and column read the same string, where 0 <= k < max(numRows, numColumns).

 For example, the word sequence ["ball","area","lead","lady"] forms a word square because each word reads the same both horizontally and vertically.
  
 Example 1:
 Input: words = ["area","lead","wall","lady","ball"]
 Output: [["ball","area","lead","lady"],["wall","area","lead","lady"]]
 Explanation:
 The output consists of two word squares. The order of output does not matter (just the order of words in each word square matters).
 
 Example 2:
 Input: words = ["abat","baba","atan","atal"]
 Output: [["baba","abat","baba","atal"],["baba","abat","baba","atan"]]
 Explanation:
 The output consists of two word squares. The order of output does not matter (just the order of words in each word square matters).
  

 Constraints:
 1 <= words.length <= 1000
 1 <= words[i].length <= 4
 All words[i] have the same length.
 words[i] consists of only lowercase English letters.
 All words[i] are unique.
 */

// TC: O(N * 26^L * L), where N is the number of input words
// and L is the length of a single word.

// SC: O(N * L + N * (L / 2) )= O(N * L) where N is the number of words
// and L is the length of a single word.

// [["ball",
//   "area",
//   "lead",
//   "lady"]]

class Solution {
    class TrieNode {
        var children = [Character: TrieNode]()
        var wordsWithPrefix = [String]()
    }
    
    class Trie {
        private(set) var root = TrieNode()
        
        func insert(_ word: String) {
            var current = root
            for char in word {
                if current.children[char] == nil {
                    current.children[char] = TrieNode()
                }
                current = current.children[char]!
                current.wordsWithPrefix.append(word)
            }
        }
        
        func findWordWithPrefix(_ word: String) -> [String] {
            var current = root
            for char in word {
                if let nextNode = current.children[char] {
                    current = nextNode
                } else {
                    return []
                }
            }
            return current.wordsWithPrefix
        }
    }
    
    func wordSquares(_ words: [String]) -> [[String]] {
        if words.count == 0 || words.isEmpty { return [] }
        
        var trie = Trie()
        for word in words {
            trie.insert(word)
        }
        
        var square = [String]()
        var result = [[String]]()
        
        func backtracking(_ step: Int) {
            if step == words[0].count {
                result.append(square)
                return
            }
            
            var prefix = String()
            for word in square {
                let index = word.index(word.startIndex, offsetBy: step)
                prefix.append(word[index])
            }
            
            var candidates = trie.findWordWithPrefix(prefix)
            for candidate in candidates {
                square.append(candidate)
                backtracking(step + 1)
                square.removeLast()
            }
        }
        
        for word in words {
            square.append(word)
            backtracking(1)
            square.removeLast()
        }
        return result
    }
}

let words = ["area","lead","wall","lady","ball"]
let result = Solution().wordSquares(words)
print(result)
print("")
