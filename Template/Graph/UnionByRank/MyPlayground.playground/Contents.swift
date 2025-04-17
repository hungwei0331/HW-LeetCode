/*
Union By Rank implementation of the Disjoint Set.
 */

//TC: Find Union   Connected
//    O(N) O(logN) O(logN)
class UnionByRank {
    var root: [Int]
    var rank: [Int]
    
    init(_ size: Int) {
        root = Array(0...size)
        rank = Array(repeating: 1, count: size)
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
            if rank[rootX] > rank[rootY] {
                root[rootY] = rootX
            } else if rank[rootX] < rank[rootY] {
                root[rootX] = rootY
            } else if rank[rootX] == rank[rootY] {
                root[rootY] = rootX
                root[rootX] += 1
            }
        }
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
