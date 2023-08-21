//: [Previous](@previous)
//:# Arrays
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Declaring arrays
 + Adding data to an array
 + reading from an array
 + Iterating over an array
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

//: Declaring an array
var numbers : Array<Int>    = Array<Int>()
var ints    : [Int]         = [Int]()
var integers                = [1,2,34,4,6,67,7]
var decimals    : [Int]     = []

var nums     : Array<Int>   = [45,456,7]

let floats  : [Float]       = [2.1,3.2,4.5]

//: Accessing anc changing array elements
nums.append(10)
nums.append(contentsOf: integers)

//floats.append(3.56) //**ERROR** Cannot use mutating member on immutable value: 'floats' is a 'let' constant

//: Iterating over an array
for i in 0..<nums.count {
    print(nums[i])
}

for element in nums {
    print(element)
}


//: [Next](@next)
