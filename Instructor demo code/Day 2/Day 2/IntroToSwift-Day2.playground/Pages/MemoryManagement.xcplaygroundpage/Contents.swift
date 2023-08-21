//: [Previous](@previous)

//:# Memory Management
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Declaring sets
 + Adding data to an sets
 + reading from an sets
 + Iterating over an sets
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */

import Foundation

//:#### Parent Class
class Parent
{
    //Member variable of Parent
    var x : Int = 90
    
    //Designated constructor
    init()
    {
    print("Designated constructor of parent called")
    }
    
    //convenience constructor
    convenience init(X newX : Int)
    {
    print("Convenience constructor of parent")
    self.init()
    x = newX
    }
}

//:#### Child Class
class Child : Parent
{
    //Member variable of Child
    var y : Int = 10
    
    //Designated constructor
    override init()
    {
    super.init()
    print("Designated constructor of child")
    }
    
    //Convenience constructor
    convenience init(Y newY : Int)
    {
    print("Convenience constructo of child")
    self.init()
    y = newY
    x = y * 3
    }
}

var childObj : Child = Child(Y: 1234)









class A
{
    var x : Int?
    var y : Int?
    
    //Designated init
    init()
    {
    x = 0
    y = 0
    }
    
    convenience init(X newX : Int)
    {
    self.init()
    x = newX
    }
    
    convenience init(Y newY : Int)
    {
    self.init()
    y = newY
    }
    
    //Deinit
    deinit {
        print("Deinit")
    }
}

//: Automatic Reference Counting
func someFunction()
{
    var x : Int = 0
}

var obj : A = A()
var newObj = obj

var outerVariable : A?

func doesSomething()
{
    var newVar : A = A()
    outerVariable = newVar
}

print("1")

outerVariable = nil

print("0")


class Demo {
    var alpha : Int
    
//    init() {
//        alpha = 0
//    }
}

//: [Next](@next)
