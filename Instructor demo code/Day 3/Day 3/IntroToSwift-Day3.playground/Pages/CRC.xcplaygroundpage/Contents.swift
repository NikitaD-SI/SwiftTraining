//: [Previous](@previous)
//:# Cyclic References
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

class Screen {
    var nextScreen  : Screen?
    weak var previosScreen   : Screen?
}

var first : Screen  = Screen()
var second : Screen  = Screen()
//var third : Screen  = Screen()


first.nextScreen = second
second.previosScreen = first


//second.nextScreen = third
//third.previosScreen = second

//: [Next](@next)
