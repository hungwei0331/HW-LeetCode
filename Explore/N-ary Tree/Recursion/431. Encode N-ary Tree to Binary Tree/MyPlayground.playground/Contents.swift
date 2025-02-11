/*
 Design an algorithm to encode an N-ary tree into a binary tree and decode the binary tree to get the original N-ary tree. An N-ary tree is a rooted tree in which each node has no more than N children. Similarly, a binary tree is a rooted tree in which each node has no more than 2 children. There is no restriction on how your encode/decode algorithm should work. You just need to ensure that an N-ary tree can be encoded to a binary tree and this binary tree can be decoded to the original N-nary tree structure.

 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See following example).

 For example, you may encode the following 3-ary tree to a binary tree in this way:

 Input: root = [1,null,3,2,4,null,5,6]
 Note that the above is just an example which might or might not work. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

 Example 1:
 Input: root = [1,null,3,2,4,null,5,6]
 Output: [1,null,3,2,4,null,5,6]
 
 Example 2:
 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 
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

// TC: O(n), SC: O(n)
class Codec {
    func encode(_ root: Node?) -> TreeNode? {
        guard let root = root else { return nil }
        
        let treeRoot = TreeNode(root.val)
        
        if !root.children.isEmpty {
            treeRoot.left = encode(root.children[0])
        }
        
        if root.children.count < 2 {
            return treeRoot
        }
        
        var current = treeRoot.left
        for i in 1..<root.children.count {
            current?.right = encode(root.children[i])
            current = current?.right
        }
        return treeRoot
    }
    
    func decode(_ root: TreeNode?) -> Node? {
        guard let root = root else { return nil }
        
        let naryRoot = Node(root.val)
        var current = root.left
        
        while current != nil {
            if let node = decode(current) {
                naryRoot.children.append(node)
            }
            current = current?.right
        }
        return naryRoot
    }
}
