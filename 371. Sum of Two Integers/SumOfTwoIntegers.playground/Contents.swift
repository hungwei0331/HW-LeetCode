//Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.

/*
Example 1:
Input: a = 1, b = 2
Output: 3

Example 2:
Input: a = -2, b = 3
Output: 1
*/

var a = -2
var b = 3

func getSum(_ a: Int, _ b: Int) -> Int {
    let resultArray = [a, b]
    return resultArray.reduce(0) { $0 + $1}
}

getSum(a, b)
