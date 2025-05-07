/*
 oko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

 Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

 Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

 Return the minimum integer k such that she can eat all the bananas within h hours.

 Example 1:
 Input: piles = [3,6,7,11], h = 8
 Output: 4
 
 Example 2:
 Input: piles = [30,11,23,4,20], h = 5
 Output: 30
 
 Example 3:
 Input: piles = [30,11,23,4,20], h = 6
 Output: 23
  
 Constraints:
 1 <= piles.length <= 10^4
 piles.length <= h <= 10^9
 1 <= piles[i] <= 10^9
 */

// Binary Search
// TC: O(n * logm), Let n be the length of the input array piles, m be the maximum number of bananas in a single pile from piles
// The initial search space is from 1 to m, it takes logm comparisons to reduce the search space to 1.
// For each eating speed middle, we traverse the array and calculate the overall time Koko spends, which takes O(n) for each traversal.
// To sum up, the time complexity is O(n⋅logm)
// SC: O(1)
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = piles.max()!

        func canEatAll(_ speed: Int) -> Bool {
            var hours = 0

            for pile in piles {
                hours += Int(ceil(Double(pile) / Double(speed)))
            }
            return hours <= h
        }

        while left <= right {
            let mid = (left + right) / 2
            if canEatAll(mid) {
                right =  mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
