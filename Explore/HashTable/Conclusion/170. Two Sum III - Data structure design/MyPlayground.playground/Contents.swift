/*
 Design a data structure that accepts a stream of integers and checks if it has a pair of integers that sum up to a particular value.

 Implement the TwoSum class:

 TwoSum() Initializes the TwoSum object, with an empty array initially.
 void add(int number) Adds number to the data structure.
 boolean find(int value) Returns true if there exists any pair of numbers whose sum is equal to value, otherwise, it returns false.
  
 Example 1:
 Input
 ["TwoSum", "add", "add", "add", "find", "find"]
 [[], [1], [3], [5], [4], [7]]
 Output
 [null, null, null, null, true, false]

 Explanation
 TwoSum twoSum = new TwoSum();
 twoSum.add(1);   // [] --> [1]
 twoSum.add(3);   // [1] --> [1,3]
 twoSum.add(5);   // [1,3] --> [1,3,5]
 twoSum.find(4);  // 1 + 3 = 4, return true
 twoSum.find(7);  // No two integers sum up to 7, return false
 */

// TC: add O(1), find O(N) SC: O(N)

class TwoSum {

    var dict: [Int: Int]!
    
    init() {
        dict = [Int: Int]()
    }
    
    func add(_ number: Int) {
        dict[number, default: 0] += 1
    }
    
    func find(_ value: Int) -> Bool {
        
        for key in dict.keys {
            let difference = value - key
            if let numberCount = dict[difference] {
                if key != difference || key == difference && numberCount > 1 {
                    return true
                }
            }
        }
        return false
    }
}
