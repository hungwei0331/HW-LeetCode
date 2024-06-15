//Given an arbitrary ransom note string and another string containing letters from all the magazines,
//write a function that will return true if the ransom note can be constructed from the magazines;
//otherwise, it will return false.
//Each letter in the magazine string can only be used once in your ransom note.

/*
 Note:
 You may assume that both strings contain only lowercase letters.
 
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
*/

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    
    var tmpRansomNoteArray = Array(ransomNote)
    
    if ransomNote.count == 0 {
        return true
    }
    
    for (_, value) in Array(magazine).enumerated() {
        if let index = tmpRansomNoteArray.lastIndex(of: value) {
            tmpRansomNoteArray.remove(at: index)
            if tmpRansomNoteArray.count == 0 {
                return true
            }
        } else {
            continue
        }
    }
    return false
}

canConstruct("bg", "efjbdfbdgfjhhaiigfhbaejahgfbbgbjagbddfgdiaigdadhcfcj")
