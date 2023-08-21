//: [Previous](@previous)
//:# Tuples
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Returning tuples
 + Accessing tuple values
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

func squareCube(num : Int) -> (square : Int, cube : Int, orignal : Int) {
    return (num * num, num * num * num, num)
}

var answer = squareCube(num : 3)

answer.square
answer.cube


//: [Next](@next)
