import UIKit

var str = "Hello, playground"

//let nums   = [2, 7, 11, 15]
//let target = 9

let nums   = [3,2,4]
let target = 6

// kind of bubble sort
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, value) in nums.enumerated() {
        let tmpTarget = target - value
        let nextIndex = index + 1
        for tmpIndex in nextIndex..<nums.count {
            if ((tmpTarget - nums[tmpIndex]) == 0) {
                return [index, tmpIndex]
            }
        }
    }
    return[0]
}

twoSum(nums, target)
