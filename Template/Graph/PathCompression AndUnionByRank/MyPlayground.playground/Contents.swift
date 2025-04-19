/*
 Path Compression implementation of the Disjoint Set.
 */

//TC: Find    Union   Connected
//    O(a(n)) O(a(n)) O(a(n))

class UnionFindWithPathCompressionAndUnionByRank {
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
            } else if rank[rootX] == rank[rootY] {
                root[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}


let unionFind = UnionFindWithPathCompressionAndUnionByRank(10)

// 1-2-5-6-7 3-8-9 4
unionFind.union(1, 2);
unionFind.union(2, 5);
unionFind.union(5, 6);
unionFind.union(6, 7);
unionFind.union(3, 8);
unionFind.union(8, 9);
print(unionFind.connected(1, 5)); // true
print(unionFind.connected(5, 7)); // true
print(unionFind.connected(4, 9)); // false

// 1-2-5-6-7 3-8-9-4
uf.union(9, 4);
print(unionFind.connected(4, 9)); // true
