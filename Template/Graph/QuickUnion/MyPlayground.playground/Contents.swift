/*
 Quick find implementation of the Disjoint Set.
 */


class QuickUnion {
    var root: [Int]
    
    init(_ size: Int) {
        root = Array(0..<size)
    }
    
    func find(_ x: Int) -> Int {
        while x != root[x] {
            root[x] = x
        }
        return root[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        var rootX = find(x)
        var rootY = find(y)
        
        if rootX != rootY {
            root[rootY] = rootX
        }
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return root[x] == root[y]
    }
}
