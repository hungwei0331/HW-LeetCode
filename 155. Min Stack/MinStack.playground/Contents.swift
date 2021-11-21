/*
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the MinStack class:

MinStack() initializes the stack object.
void push(int val) pushes the element val onto the stack.
void pop() removes the element on the top of the stack.
int top() gets the top element of the stack.
int getMin() retrieves the minimum element in the stack.
*/

/*
 Example 1:

 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]

 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
*/

//MARK: - 80 ms, faster than 50.57% of Swift online submissions for Min Stack.


class MinStack {
    
    var array: [Int]

    init() {
        array = [Int]()
    }

    func push(_ val: Int) {
        array.append(val)
    }

    func pop() {
        array.popLast()
    }

    func top() -> Int {
        guard let topValue = array.last else { return 0 }
        return topValue
    }

    func getMin() -> Int {
        var minValue = 2147483647
        
        for element in array {
            if element < minValue {
                minValue = element
            }
        }
        return minValue
    }
}

//MARK: - Hight Order Solution

/*
class MinStack {

    var array: [Int]

    init() {
        array = [Int]()
    }

    func push(_ val: Int) {
        array.append(val)
    }

    func pop() {
        array.popLast()
    }

    func top() -> Int {
        guard let topValue = array.last else { return 0 }
        return topValue
    }

    func getMin() -> Int {
       guard let minVal = array.min() else { return 0 }
       return minVal
    }
}
*/


