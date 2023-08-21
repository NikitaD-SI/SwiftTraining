//: [Previous](@previous)
//:# Functions
//: - Date: 11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Functions
 + Functions with arguments
 + Returning values from a function
 + Argument labels
 + Pass by reference
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */

import Foundation

//: Functions with arguments

func printMessage(input : String) {
    print(#line, input)
}

func multiply(lhs : Int, rhs : Int) {
    print(lhs * rhs)
}

func addition(lhs : Int, rhs : Int) -> Int {
    return lhs + rhs
}

func multiplication(lhs : Int, rhs : Int) -> Int {
    lhs * rhs
}

printMessage(input: "ABC")

multiply(lhs: 3, rhs: 5)

var answer : Int = addition(lhs: 45, rhs: 435)

_ = multiplication(lhs: 34, rhs: 345)

var amount : Int = 1_000_000

for _ in 0...100 {
    printMessage(input: "ABC")
}

func division(numerator : Double, denominator : Double) {
    printMessage(input: "Result = \(numerator/denominator)")
}

//: External and internal names
//createEntry("jkhsdf",45,true,4.5,"YES","...",false,78)


func divide(TheNumber numerator : Double, by denominator : Double) -> Double {
    numerator/denominator
}

_ = divide(TheNumber: 23.4, by: 56.7)

func createEntry(ForName name : String, withCount count : Int, WithAnActivationStateOf state : Bool) {
    
}

createEntry(ForName: "jsdhf", withCount: 45, WithAnActivationStateOf: true)

func divide(_ numerator : Float, by denominator : Float) {
    
}

divide(23.4, by: 5.6)



var a = 10
var b = 20

//: `inout` keyword
func swap(TheNumber lhs : inout Int, with rhs : inout Int) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

swap(TheNumber: &a, with: &b)

print(a) //20
print(b) //10


//: [Next](@next)
