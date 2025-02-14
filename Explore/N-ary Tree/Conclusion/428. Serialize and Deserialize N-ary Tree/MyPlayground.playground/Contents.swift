/*
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize an N-ary tree. An N-ary tree is a rooted tree in which each node has no more than N children. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that an N-ary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 For example, you may serialize the following 3-ary tree

 as [1 [3[5 6] 2 4]]. Note that this is just an example, you do not necessarily need to follow this format.

 Or you can follow LeetCode's level order traversal serialization format, where each group of children is separated by the null value.
 
 For example, the above tree may be serialized as [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14].

 You do not necessarily need to follow the above-suggested formats, there are many more different formats that work so please be creative and come up with different approaches yourself.

 Example 1:
 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 
 Example 2:
 Input: root = [1,null,3,2,4,null,5,6]
 Output: [1,null,3,2,4,null,5,6]
 
 Example 3:
 Input: root = []
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 104].
 0 <= Node.val <= 104
 The height of the n-ary tree is less than or equal to 1000
 Do not use class member/global/static variables to store states. Your encode and decode algorithms should be stateless.
 */

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Codec {
    // Serialization: TC: O(n), SC: O(n)
    func serialize(_ root: Node?) -> String {
        guard let root = root else { return String() }
        var result = [String]()
        serializeHelper(root, &result)
        return result.joined(separator: ",")
    }
    
    private func serializeHelper(_ node: Node?, _ result: inout [String]) {
        guard let node = node else { return }
        
        result.append(String(node.val))
        result.append(String(node.children.count))
        
        for child in node.children {
            serializeHelper(child, &result)
        }
    }
    
    // Deserialization: TC: O(n), SC: O(n)
    func deserialize(_ data: String) -> Node? {
        if data.isEmpty { return nil }
        
        var values = data.split(separator: ",").map{ String($0) }
        var index = 0
        
        return deserializeHelper(&index, &values)
    }
    
    private func deserializeHelper(_ index: inout Int, _ values: inout [String]) -> Node? {
        if index > values.count { return nil }
        
        let val = Int(values[index])!
        let childCount = Int(values[index + 1])!
        index = index + 2
        
        let node = Node(val)
        
        for _ in 0..<childCount {
            if let child = deserializeHelper(&index, &values) {
                node.children.append(child)
            }
        }
        return node
    }
}
