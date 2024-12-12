/*
 You are given an integer array gifts denoting the number of gifts in various piles. Every second, you do the following:

 Choose the pile with the maximum number of gifts.
 If there is more than one pile with the maximum number of gifts, choose any.
 Leave behind the floor of the square root of the number of gifts in the pile. Take the rest of the gifts.
 Return the number of gifts remaining after k seconds.

 Example 1:
 Input: gifts = [25,64,9,4,100], k = 4
 Output: 29
 Explanation:
 The gifts are taken in the following way:
 - In the first second, the last pile is chosen and 10 gifts are left behind.
 - Then the second pile is chosen and 8 gifts are left behind.
 - After that the first pile is chosen and 5 gifts are left behind.
 - Finally, the last pile is chosen again and 3 gifts are left behind.
 The final remaining gifts are [5,8,9,4,3], so the total number of gifts remaining is 29.
 
 Example 2:
 Input: gifts = [1,1,1,1], k = 4
 Output: 4
 Explanation:
 In this case, regardless which pile you choose, you have to leave behind 1 gift in each pile.
 That is, you can't take any pile with you.
 So, the total gifts remaining are 4.
 */

import HeapModule

// TC: O(n + k * logn), initialization of the heap requires O(n) time,
// (pop and push) have a time complexity of O(logn), we perform this operation k times
// SC: O(n)
class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var maxHeap = Heap(gifts)
        var sum = 0

        for _ in 0..<k {
            let maxVal = maxHeap.removeMax()
            let squareRoot = Int(sqrt(Double(maxVal)))
            maxHeap.insert(squareRoot)
        }
        
        for _ in 0..<maxHeap.count {
            sum = sum + maxHeap.removeMax()
        }
        return sum
    }
}

var gifts = [25,64,9,4,100], k = 4
//var gifts = [1,1,1,1], k = 4

let result = Solution().pickGifts(gifts, k)
print(result)
print("")
