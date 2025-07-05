/*
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  
 Example 1:
 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 
 Example 2:
 Input: s = "applepenapple", wordDict = ["apple","pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 
 Example 3:
 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: false
  
 Constraints:
 1 <= s.length <= 300
 1 <= wordDict.length <= 1000
 1 <= wordDict[i].length <= 20
 s and wordDict[i] consist of only lowercase English letters.
 All the strings of wordDict are unique.
 */

// TC: O(n^2), (index...i) for each node
// SC: O(n + m), where n is string length, which m is dict elements length
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let trie = Trie()
        for word in wordDict {
            trie.insert(word)
        }
        let chars = Array(s)
        var memo = [Int: Bool]()
        
        func dfs(_ index: Int) -> Bool {
            if index == chars.count {
                return true
            }

            if let reuslt = memo[index] {
                return reuslt
            }

            var node = trie.getRoot()
            for i in index..<chars.count {
                let char = chars[i]
                guard let nextNode = node.children[char] else {
                    break
                }

                node = nextNode
                if node.isWord {
                    if dfs(i + 1) {
                        memo[index] = true
                        return true
                    }
                }
            }
            memo[index] = false
            return false
        }
        return dfs(0)
    }
}

class TrieNode {
    var children = [Character: TrieNode]()
    var isWord = false
}

class Trie {
    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isWord = true
    }

    func getRoot() -> TrieNode {
        return root
    }
}
