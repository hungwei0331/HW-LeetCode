/*
Disjoint Set.
 */

protocol UnionFind {
    func find(_ x: Int) -> Int
    func Union(_ x: Int, _ y: Int)
    func connected(_ x: Int, _ y: Int)
}

//TC: Find Union   Connected
//    O(N) O(logN) O(logN)
class BasicUnion {
    var root: [Int]
    
    init(_ size: Int) {
        root = Array(0...size)
    }
    
    func find(_ x: Int) -> Int {
        var x = x
        while x != root[x]{
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

//TC: Find    Union   Connected
//    O(a(n)) O(a(n)) O(a(n))

///optimized path compression and union by rank
class Union {
    var root: [Int]
    var rank: [Int]
    
    init(_ size: Int) {
        root = Array(0...size)
        rank = Array(repeating: 1, count: size)
    }
    
    func find(_ x: Int) -> Int {
        if x == root[x] {
            return x
        }
        root[x] = find(root[x])
        return root[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            if rank[rootX] > rank[rootY] {
                root[rootY] = rootX
            } else if rank[rootX] < rank[rootY] {
                root[rootX] = rootY
            } else {
                root[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
