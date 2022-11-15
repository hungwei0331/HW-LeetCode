/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 */

/*
 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 Example 2:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.
 
 */

//Runtime: 1798 ms, faster than 52.44% of Swift online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 18.2 MB, less than 6.37% of Swift online submissions for Best Time to Buy and Sell Stock.

/*
 Step1. check prices is empty, if its, return 0
 Step2. for each value
 Step3. set maxProfit as 0 as default, set minCost as first value of prices
 Step4. if price less than minCost, set price to minCost
 Step5. if price substract minCost greater than maxProfit, set price substract minCost result to maxProfit
 */

    
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.isEmpty { return 0}
        
        var maxProfit = 0
        var minCost = prices[0]
        
        for price in prices {
            if price < minCost {
                minCost = price
            } else if (price - minCost) > maxProfit {
                maxProfit = price - minCost
            }
        }
        return maxProfit
    }
}

let solution = Solution().maxProfit([7,1,5,3,6,4])
print("solution", solution)

