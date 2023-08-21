//: [Previous](@previous)

//:# Dictionaries
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Declaring dictionaries
 + Adding data to an dictionaries
 + reading from an dictionaries
 + Iterating over an dictionaries
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

//: Declaring a dictionary

var map : Dictionary<String, Int> = Dictionary<String, Int>()
var hashmap : [String : Int]        = [:]
var index   : [String : Int]        = [String : Int]()

var collection                      = ["A" : 1, "B" : 2, "C" : 3]


//: Accessing elements

index["D"] = 1

print(index["D"]!)


for (key, value) in collection {
    print(key)
    print(value)
}


var complex : Array<Dictionary<String,[Float?]>>?

var a : [Int]?

var b : [Int?]

var c : [Int?]?


//: [Next](@next)
