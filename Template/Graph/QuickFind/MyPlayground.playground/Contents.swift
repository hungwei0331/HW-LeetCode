/*
 Quick find implementation of the Disjoint Set.
 */

class UnionFind {
    var root = [Int]()
    
    init(_ size: Int) {
        self.root = Array(0...size)
    }
    
    func find(_ x: Int) -> Int {
        return root[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            for i in 0..<root.count {
                if root[i] == rootX {
                    root[i] = rootY
                }
            }
        }
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
