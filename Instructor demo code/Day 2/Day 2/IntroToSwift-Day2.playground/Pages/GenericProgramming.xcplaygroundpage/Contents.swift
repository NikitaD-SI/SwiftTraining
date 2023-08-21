//: [Previous](@previous)
//:# Generic Programming
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

//: Generic functions

//func swapThe(Number lhs : inout Int, withTheNumber rhs : inout Int) {
//    let temp = lhs
//    lhs = rhs
//    rhs = temp
//}
//
//func swapThe(Number lhs : inout Float, withTheNumber rhs : inout Float) {
//    let temp = lhs
//    lhs = rhs
//    rhs = temp
//}
//
//func swapThe(Item lhs : inout Bool, withTheItem rhs : inout Bool) {
//    let temp = lhs
//    lhs = rhs
//    rhs = temp
//}
//
//func swapThe(Item lhs : inout String, withTheItem rhs : inout String) {
//    let temp = lhs
//    lhs = rhs
//    rhs = temp
//}

func swapThe<Element>(Item lhs : inout Element, withTheItem rhs : inout Element) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

var str1 = "ABC"
var str2 = "DEF"

swapThe(Item: &str1, withTheItem: &str2)

var num1 = 10
var num2 = 20

swapThe(Item: &num1, withTheItem: &num2)

//swapThe(Item: &str1, withTheItem: &num1)

//: Generic types

class AdvancedMathOperations<T> {
    var info : T?
    
    func log() -> T {
        return info!
    }
    
    func product(input : T) {
        info = input
    }
}

var myData  : AdvancedMathOperations<Int> = AdvancedMathOperations<Int>()
myData.info = 10

myData.log()
myData.product(input: 3)

var decimal : AdvancedMathOperations<Double> = AdvancedMathOperations<Double>()
decimal.info = 90.4
decimal.product(input: 45.6)


struct MyArray<Element> {
    func append(newElement : Element) {
        
    }
}

var ints : MyArray<Int> = MyArray<Int>()
ints.append(newElement: 10)

struct Map<Key, Value> {
    func insert(Value value : Value, forKey key : Key) {
        
    }
}

var myMap : Map<String, Int> = Map<String, Int>()
myMap.insert(Value: 12, forKey: "A")



//: [Next](@next)
