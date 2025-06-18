/*
 Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

 The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

 The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

 Example 1:
 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 
 Example 2:
 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]
 
 Example 3:
 Input: candidates = [2], target = 1
 Output: []
 */

// TC: O(N^(T/M)), 樹的分支係數 N，深度約 T/M，總共 N^(T/M) 個節點。
// SC: 取決於有多少合法解組合，最壞空間為O(number_of_solutions * T/M)。
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()

        func backtrack(_ start: Int, _ combination: [Int], _ remaining: Int) {
            if remaining == 0 {
                result.append(combination)
                return
            }

            if remaining < 0 {
                return
            }

            for i in start..<candidates.count {
                let candidate = candidates[i]

                backtrack(i, combination + [candidate], remaining - candidate)
            }
        }
        backtrack(0, [], target)
        return result
    }
}
