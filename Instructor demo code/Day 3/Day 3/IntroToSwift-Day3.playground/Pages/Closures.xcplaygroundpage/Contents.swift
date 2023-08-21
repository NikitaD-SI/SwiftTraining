//: [Previous](@previous)
//:# Closures
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

/*:
 - Important: Closures tend to have an unreadable syntax. Try to make your closures as verbose as possible to improve readability
 
 ````
 var closureVariableName : () -> Void = {() -> Void in //closure body}
 */

//: Closure syntax
var cls : (Int) -> Int = {(arg1 : Int) -> Int in
    arg1 * arg1
}

cls(3)

var cls2 : (Int) -> Int = cls

cls2(3)



//: Passing a closure to a function

class Number {
    var internalNum : Int = 0
    
    init(WithNum newNum : Int) {
        self.internalNum = newNum
    }
    
    func prettyPrint(task : (Int) -> String) -> String {
        return task(self.internalNum)
    }
    
    lazy var someTask : (Int) -> Int = {[unowned self](arg1 : Int) -> Int in return arg1 * self.internalNum }
}

var myNumber : Number = Number(WithNum: 33)

//MARK: - Option 1
var printCls : (Int) -> String = {(arg1 : Int) -> String in
    let str : String = "**\(arg1)**"
    return str
}

myNumber.prettyPrint(task: printCls)

//MARK: - Option 2
myNumber.prettyPrint(task: {(arg1 : Int) -> String in let str : String = "**\(arg1)**"; return str })

//MARK: - Option 3
myNumber.prettyPrint(task: {(arg1 : Int) -> String in "**\(arg1)**" })

//MARK: - Option 4
myNumber.prettyPrint(task: {(arg1 : Int) in "**\(arg1)**" })

//MARK: - Option 5
myNumber.prettyPrint(task: { arg1  in "**\(arg1)**" })

//MARK: - Option 6
myNumber.prettyPrint(task: { "**\($0)**" })

//MARK: - Option 7 (Trailing closures)
myNumber.prettyPrint { "**\($0)**" }


//: Higher order functions

var arr = [1,2,3,4,554,34,65655,777,8]

arr.sort(by: {(lhs : Int, rhs :Int) -> Bool in
    lhs > rhs
})
arr.sort(by: {(lhs : Int, rhs :Int) in
    lhs > rhs
})

arr.sort(by: { lhs, rhs  in
    lhs > rhs
})

arr.sort(by: { $0 > $1 })

arr.sort(by: >)


//: Escaping closures

var tasks : [() -> Void] = []

func collect(tsk : @escaping () -> Void ) {
    tasks.append(tsk)
}

//: Auto closures

var numbers = [1,2,3,4,5,56]

func taskExecutor(tsk : @autoclosure () -> Int) {
    numbers.append(9999)
    tsk()
}

taskExecutor(tsk: numbers.last!)
//: [Next](@next)
