/*
 We are playing the Guess Game. The game is as follows:

 I pick a number from 1 to n. You have to guess which number I picked.

 Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

 You call a pre-defined API int guess(int num), which returns three possible results:

 -1: Your guess is higher than the number I picked (i.e. num > pick).
 1: Your guess is lower than the number I picked (i.e. num < pick).
 0: your guess is equal to the number I picked (i.e. num == pick).
 Return the number that I picked.
 */

// TC: O(logN) SC: O(1)
class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left <= right {
            let mid = left + (right - left) / 2
            var result = guess(mid)
            
            if result == 0 {
                return mid
            } else if result == -1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
         }
        return 0
    }
}
