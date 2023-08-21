//: [Previous](@previous)
//:# Protocols
//: - Date:  14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */

import Foundation

//: Declaring protocols
protocol SomeRules {
    func doSomething()
    func describe()
}

//: Conforming to protocols
class Number : SomeRules {
    func doSomething() {
        
    }
    
    func describe() {
        
    }
}

//: Protocol inheritance
protocol MoreRules : SomeRules {
    func additionalTasks()
}

struct Demo : MoreRules {
    func additionalTasks() {
        
    }
    
    func doSomething() {
        
    }
    
    func describe() {
        
    }
    
    
}

//: Extending protocols
extension SomeRules {
    func doSomething() {
        print("doSomething")
    }
    
    func describe() {
        print("doSomething")
    }
}

struct Alpha : SomeRules {
    
}

//: Protocol oriented programming

protocol Viewable {
    
}

func render(item : Viewable) {
    
}

struct Beta : Viewable {
    
}

render(item: Beta())

class Gamma : Viewable {
    
}

render(item: Gamma())

enum Rays : Viewable{
    case one
}

render(item: Rays.one)



//: Protocol composition

protocol Searchable {
    
}

protocol Listable {
    
}


var items : [Searchable & Listable] = []

class One : Searchable {
    
}

class Two : Listable {
    
}

class Three : Searchable, Listable {
    
}

items.append(Three())


/*
 
 # Protocol naming convention
 - ...able
 - ...Datasource
 - ...Delegate
 
 */



// Conditional conformance and type constraints

class MathOperations<T> {
    var internalDS : T?
    
    func addition<T : Numeric>(lhs : T, rhs : T) -> T {
        lhs + rhs
    }
}

extension MathOperations : Equatable where T : Equatable {
    static func ==(lhs : MathOperations, rhs : MathOperations) -> Bool {
        lhs.internalDS == rhs.internalDS
    }
}



//: [Next](@next)
