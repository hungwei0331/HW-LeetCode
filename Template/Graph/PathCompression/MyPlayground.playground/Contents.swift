/*
 Path Compression implementation of the Disjoint Set.
 */

//TC: Find    Union   Connected
//    O(logN) O(logN) O(logN)

class UnionFindWithPathCompression {
    var root: [Int]
    
    init(_ size: Int) {
        root = Array(0...size)
    }
    
    func find(_ x: Int) -> Int {
        if x == root[x]{
            return x
        }
        root[x] = find(root[x])
        return root[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            root[rootY] = rootX
        }
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
