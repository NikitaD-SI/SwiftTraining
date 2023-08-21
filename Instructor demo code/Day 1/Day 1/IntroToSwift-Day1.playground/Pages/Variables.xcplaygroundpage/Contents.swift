//: [Previous](@previous)
//:# Variables, Types & Optionals
//: - Date: 11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Variable
 + Constants
 + Optionals
 + Implicit Optionals
 + Swift defined types
 + Swift defined operators
 
**Contact Details**

[arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)

[www.amaranthine.in](https://www.amaranthine.in)
    
- note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */

//:Foundation framework
/*:
 The `Foundation` framework is the framework which contains the basic building blocks for all Swift components.
 */
import Foundation

//: Implicit type inference
var greeting = "Hello, playground"

//: Explicit type declaration
var name : String = "Arun"

var priceOfOil = 3.45; var a = 10

let pi : Float = 3.14159



//: Optional

//: - Important: An optional is something that may or may not have a value.

var index : Int?
var count : Int = 0

//index = 10


//print(index!)

if index != nil {
    print(index!)
}

//: Implicit optionals
var counter : Int!

//counter

/*:
 
 - Important: The `++` and `--` operators are **NOT** supported in Swift.
 
 - Note: It is posible for you to create your **OWN** operators. Including ones that don't exist.
 
 ### Operators
 
 - `+`
 - `-`
 - `*`
 - `\`
 - `%`
 - `!=`
 - `==`
 - `>`
 - `<`
 - `>=`
 - `<=`
 - `&`
 - `&&`
 - `|`
 - `||`
 - `!`
 - `=`
 - `+=`
 - `-=`
 
 
 */


/*:
 
 ### Types
 
 - `Int`
 - `Int8`
 - `Int16`
 - `Int32`
 - `Int64`
 - `UInt`
 - `UInt8`
 - `UInt16`
 - `UInt32`
 - `UInt64`
 - `String`
 - `Float`
 - `Float32`
 - `Float64`
 - `Double`
 -  `Bool`
 - `Character`
 
 */

var num1 : Int8 = 10
var num2 : Int16 = 20

var answer : Int64 = Int64(num1) + Int64(num2)

var number = 10     //`Int`

var decimal = 3.4   //`Double`

var id = "KJSHF"    //`String`

var currency = "$"  //`String`

var status = true   //`Bool`

var symbol : Character  = "^"



//: [Next](@next)
