/*
 Quick find implementation of the Disjoint Set.
 */


class QucikUnion {
    var root: [Int]
    
    init(_ size: Int) {
        root = Array(0...size)
    }
    
    func find(_ x: Int) -> Int {
        var x = x
        while x != root[x] {
            x = root[x]
        }
        return x
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

