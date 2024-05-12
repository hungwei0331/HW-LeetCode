/*
 Write an algorithm to determine if a number n is happy.

 A happy number is a number defined by the following process:

 Starting with any positive integer, replace the number by the sum of the squares of its digits.
 Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 Those numbers for which this process ends in 1 are happy.
 Return true if n is a happy number, and false if not.

 Example 1:
 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 
 Example 2:
 Input: n = 2
 Output: false
 */

// Approach 1: Detect Cycles with a HashSet
// TC: O(logN) SC: O(logN)

class Solution1 {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var set: Set<Int> = []
        
        while n != 1 && !set.contains(n) {
            set.insert(n)
            n = getNext(n)
        }
        return n == 1
    }
    
    func getNext(_ num: Int) -> Int {
        var num = num
        var result = 0
        
        while num > 0 {
            let digital = num % 10
            result += digital * digital
            num = num / 10
        }
        return result
    }
}

// Approach 1: Approach 2: Floyd's Cycle-Finding Algorithm
// TC: O(logN) SC: O(1)

class Solution2 {
    func isHappy(_ n: Int) -> Bool {
        var slower = n
        var faster = getNext(n)
        
        while faster != 1 && slower != faster {
            slower = getNext(slower)
            faster = getNext(getNext(faster))
        }
        return faster == 1
    }
    
    func getNext(_ num: Int) -> Int {
        var num = num
        var result = 0
        
        while num > 0 {
            let digital = num % 10
            result += digital * digital
            num = num / 10
        }
        return result
    }
}

let result1 = Solution1().isHappy(19)
print(result1)

let result2 = Solution2().isHappy(19)
print(result2)
