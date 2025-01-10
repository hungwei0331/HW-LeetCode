/*
 You are given an array of strings words and a string pref.
 Return the number of strings in words that contain pref as a prefix.
 A prefix of a string s is any leading contiguous substring of s.

 Example 1:
 Input: words = ["pay","attention","practice","attend"], pref = "at"
 Output: 2
 Explanation: The 2 strings that contain "at" as a prefix are: "attention" and "attend".
 
 Example 2:
 Input: words = ["leetcode","win","loops","success"], pref = "code"
 Output: 0
 Explanation: There are no strings that contain "code" as a prefix.
  
 Constraints:
 1 <= words.length <= 100
 1 <= words[i].length, pref.length <= 100
 words[i] and pref consist of lowercase English letters.
 */

// TC: O(n * l + m),
// for each word of maximum length l
// perform l operations to add each character
// we have n words, building the Trie takes O(n⋅l) time.
// searching for the prefix takes O(m) operations.
//
// SC: O(n * l),
// n words of maximum length l, the Trie can contain up to O(n * l) nodes
class Solution {
    class TrieNode {
        var children = [Character: TrieNode]()
        var count = 0
    }
    
    class Trie {
        var root = TrieNode()
        
        func insert(_ word: String) {
            var current = root
            for char in word {
                if current.children[char] == nil {
                    current.children[char] = TrieNode()
                }
                current = current.children[char]!
                current.count += 1
            }
        }
        
        func getCount(_ pref: String) -> Int {
            var current = root
            for char in pref {
                guard let nextNode = current.children[char] else {
                    return 0
                }
                current = nextNode
            }
            return current.count
        }
    }
    
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        var trie = Trie()
        for word in words {
            trie.insert(word)
        }
        return trie.getCount(pref)
    }
}

//let words = ["pay","attention","practice","attend"], pref = "at"
let words = ["leetcode","win","loops","success"], pref = "code"
let result = Solution().prefixCount(words, pref)
print(result)
print("")
