//Implement strStr().
//
//Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//Clarification:
//
//What should we return when needle is an empty string? This is a great question to ask during an interview.
//
//For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

/*
 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
*/

//Runtime: 3 ms, faster than 86.14% of Swift online submissions for Implement strStr().
//Memory Usage: 14.3 MB, less than 61.83% of Swift online submissions for Implement strStr().

//var haystack = "hello"
//var needle = "ll"

import Foundation

var haystack = "aaaaa"
var needle = "bba"

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty { return 0 }
    if haystack.count < needle.count { return 0 }
    
    if let range = haystack.range(of: needle) {
        return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
    } else {
        return -1
    }
}

strStr(haystack, needle)
