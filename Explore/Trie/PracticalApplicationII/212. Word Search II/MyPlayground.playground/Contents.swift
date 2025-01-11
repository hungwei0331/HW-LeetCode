/*
 Given an m x n board of characters and a list of strings words, return all words on the board.
 Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

 Example 1:
 Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
 Output: ["eat","oath"]
 
 Example 2:
 Input: board = [["a","b"],["c","d"]], words = ["abcb"]
 Output: []
  
 Constraints:
 m == board.length
 n == board[i].length
 1 <= m, n <= 12
 board[i][j] is a lowercase English letter.
 1 <= words.length <= 3 * 104
 1 <= words[i].length <= 10
 words[i] consists of lowercase English letters.
 All the strings of words are unique.
 */

// TC: O(M(4 * 3^(L - 1))),
// L is the maximum length of words
// we would have at most 4 directions
// we have at most 3 neighbor cells
// we would traverse at most 4⋅3^(L−1) cells during the backtracking exploration.
// SC: O(n), where N is the total number of letters in the dictionary.
class Solution {
    class TrieNode {
        var children = [Character: TrieNode]()
        var word: String? = nil
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
            }
            current.word = word
        }
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        
        let rows = board.count
        let cols = board[0].count
        var result = Set<String>()
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        func backtracking(_ row: Int, _ col: Int, _ node: TrieNode) {
            if row < 0 || col < 0 || row >= rows || col >= cols { return }
            if visited[row][col] == true { return }
            
            let char = board[row][col]
            guard let nextNode = node.children[char] else { return }
            
            visited[row][col] = true
            
            if let word = nextNode.word {
                result.insert(word)
            }
            
            let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
            for direction in directions {
                backtracking(row + direction.0, col + direction.1, nextNode)
            }
            visited[row][col] = false
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                backtracking(row, col, trie.root)
            }
        }
        return Array(result)
    }
}
