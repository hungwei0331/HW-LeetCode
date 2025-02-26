/*
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.
  
 Example 1:
 Input: root = [5,3,6,2,4,null,7], key = 3
 Output: [5,4,6,2,null,null,7]
 Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
 One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
 Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.

 Example 2:
 Input: root = [5,3,6,2,4,null,7], key = 0
 Output: [5,3,6,2,4,null,7]
 Explanation: The tree does not contain a node with value = 0.
 
 Example 3:
 Input: root = [], key = 0
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 104].
 -105 <= Node.val <= 105
 Each node has a unique value.
 root is a valid binary search tree.
 -105 <= key <= 105
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// TC: O(h), which h is average height for binary search tree
// SC: O(1), only using variable to store parent, successor, successorParent
class Solution {
   func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
       var parent: TreeNode? = nil
       var current = root
       
       // Step 1: Find the node to delete
       while current != nil, current?.val != key {
           parent = current
           if key > current!.val {
               current = current?.right
           } else {
               current = current?.left
           }
       }
       
       // If the key is not found
       guard let target = current else { return root }
       
       // Step 2: Node has at most one child
       if target.left == nil || target.right == nil {
           let child = target.left ?? target.right
           
           // If deleting the root node
           if parent == nil { return child }
           
           if parent!.left === target {
               parent!.left = child
           } else {
               parent!.right = child
           }
       } else {
           // Step 3: Node has two children - find inorder successor
           
           var successorParent = target
           var successor = target.right
           
           while successor?.left != nil {
               successorParent = successor!
               successor = successor?.left
           }
           
           target.val = successor!.val
           
           if successorParent.left === successor {
               successorParent.left = successor?.right
           } else {
               successorParent.right = successor?.right
           }
       }
       return root
   }
}
