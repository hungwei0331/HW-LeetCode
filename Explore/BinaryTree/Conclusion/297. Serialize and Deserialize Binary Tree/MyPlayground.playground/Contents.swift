/*
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

 Example 1:
 Input: root = [1,2,3,null,null,4,5]
 Output: [1,2,3,null,null,4,5]
 
 Example 2:
 Input: root = []
 Output: []
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// TC: O(n), where N is the number of nodes
// SC: O(n), in both serialization and deserialization functions, we keep the entire tree, either at the beginning or at the end, therefore, the space complexity is O(N).

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var result = [String]()
        
        func helper(_ node: TreeNode?) {
            if let node = node {
                result.append(String(node.val))
                helper(node.left)
                helper(node.right)
            } else {
                result.append("null")
            }
        }
        helper(root)
        return result.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var nodes = data.split(separator: ",").map{ String($0) }
        
        print(nodes)
        
        func helper() -> TreeNode? {
            if nodes.isEmpty { return nil }
            
            let value = nodes.removeFirst()
            if value == "null" {
                return nil
            }
            
            let node = TreeNode(Int(value)!)
            node.left = helper()
            node.right = helper()
            
            return node
        }
        return helper()
    }
}
