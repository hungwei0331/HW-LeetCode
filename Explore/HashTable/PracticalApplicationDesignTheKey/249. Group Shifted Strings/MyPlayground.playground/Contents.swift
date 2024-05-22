/*
 We can shift a string by shifting each of its letters to its successive letter.

 For example, "abc" can be shifted to be "bcd".
 We can keep shifting the string to form a sequence.

 For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".
 Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.

 Example 1:
 Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
 Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
 
 Example 2:
 Input: strings = ["a"]
 Output: [["a"]]
 */

// TC: O(N * K): 
///We iterate over all NNN strings and for each string, we iterate over all the characters to generate the Hash value, which takes O(K)O(K)O(K) time. To sum up, the overall time complexity is O(N∗K)O(N * K)O(N∗K).


// SC: O(N * K):
/// We need to store all the strings plus their Hash values in mapHashToList. In the worst scenario, when each string in the given list belongs to a different Hash value, the maximum number of strings stored in mapHashToList is 2∗N2 * N2∗N. Each string takes at most O(K)O(K)O(K) space. Hence the overall space complexity is O(N∗K)O(N * K)O(N∗K).

class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        var dict = [[Int]: [String]]()
        
        for string in strings {
            dict[diffs(string), default: [String]()].append(string)
        }
        
        return Array(dict.values)
    }
    
    func diffs(_ string: String) -> [Int] {
        var diffs = [Int]()
        var chars = Array(string)
        
        for i in 1..<chars.count {
            var diff = Int(chars[i].asciiValue!) - Int(chars[i - 1].asciiValue!)
            if diff < 0 { diff = diff + 26 }
            diffs.append(diff)
        }
        return diffs
    }
}
