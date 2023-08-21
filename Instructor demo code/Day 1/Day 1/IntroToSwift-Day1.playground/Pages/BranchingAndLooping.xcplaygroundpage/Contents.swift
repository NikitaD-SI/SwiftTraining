//: [Previous](@previous)
//:# Branching & Control Flow
//: - Date: 11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 In this section we will be looking at the following topics
 + If statement
 + Else statement
 + For loop
 + While loop
 + Repeat while
 + Switch case
 + Optional binding
 + Labeled statemnent
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

//: Looping

for i in 0...10 {
    //print(i)
}

for i in 0..<10 {
    //print(i)
}

var k = 10

while k > 0 {
    //print(k)
    k -= 1
}

repeat {
    k += 1
    //print(k)
} while k <= 10


//: Condition check

for i in 0...100 {
//    if i % 2 == 0 {
//        print("Even")
//    }
//    else if i % 5 == 0 {
//        print("Mulitple of 5")
//    }
//    else {
//        print(i)
//    }
}

for j in 0...100 {
    switch j {
        case 0:
            print("Case 0")
        case 1,2,3:
            print("Next 3")
        case 4...50:
            print("Range")
        case 51:
            print("51")
            fallthrough
        case 52:
            print("Fallthrough")
        case 90:
            break
        default:
            print("Everything else")
    }
}


//: optional binding

let arr = [1,2,3,nil,nil,nil,-9,nil,-392084, 32,32424, nil,nil]

for item in arr {
    //Option 1
    if item != nil {
        print(item!)
    }
    
    //Option 2: Optional binding
    if let num = item {
        print(num)
    }
}


//: [Next](@next)
