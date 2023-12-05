/*
 Given an integer n, return a string array answer (1-indexed) where:

 answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
 answer[i] == "Fizz" if i is divisible by 3.
 answer[i] == "Buzz" if i is divisible by 5.
 answer[i] == i (as a string) if none of the above conditions are true.
  

 Example 1:

 Input: n = 3
 Output: ["1","2","Fizz"]
 Example 2:

 Input: n = 5
 Output: ["1","2","Fizz","4","Buzz"]
 Example 3:

 Input: n = 15
 Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
  
 */

class Solution1 {
    func fizzBuzz(_ n: Int) -> [String] {
        var strs = [String]()
        for i in 1...n {
            if i % 3 == 0 && i % 5 == 0 {
                strs.append("FizzBuzz")
            } else if i % 3 == 0 {
                strs.append("Fizz")
            } else if i % 5 == 0 {
                strs.append("Buzz")
            } else {
                strs.append(String(i))
            }
        }
        return strs
    }
}

class Solution2 {
    func fizzBuzz(_ n: Int) -> [String] {
        var strs = [String]()
        
        for i in 1...n {
            
            var tmpString = String()
            
            let divisibleBy3 = i % 3 == 0
            let divisibleBy5 = i % 5 == 0
            
            if divisibleBy3 {
                tmpString += "Fizz"
            }
            
            if divisibleBy5 {
                strs.append("Buzz")
            }
            
            if tmpString.isEmpty {
                strs.append(String(i))
            }
        }
        return strs
    }
}


let result = Solution2().fizzBuzz(3)
print("result", result)
print("")
