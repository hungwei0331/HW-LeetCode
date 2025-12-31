
/*
func backtacking(_ start: Int) {
    
    // 1) Termination condition (collect a valid result)
    if ... {
        res.append(path)
        return
    }
    
    // 2) Iterate through available choices
    for i in start..<n {
        // 3) Pruning: skip invalid or unnecessary choices if needed
        
        // 4) Make a choice
        path.append(nums[i])
        
        // 5) Recurse to explore further decisions
        //    i + 1: move to the next index to avoid reusing the same element
        backtacking(i + 1)
        
        // 6) Undo the choice (backtrack)
        path.removeLast()
    }
}
*/
