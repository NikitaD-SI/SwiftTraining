//: [Previous](@previous)
//:# Project
//: - Date:  11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */

/*:
 Custom Queue class that takes a generic type.
 
 - Important: The Generic type has to conform to the `Equatable` protocol.
 - Author: Arun Patwardhan
 - Version: 1.0
 */
/*:
 
 # Queue - FIFO
 
 ### Capabilities
 - Add items to a queue
 - remove items from a queue
 - get length of queue
 - print the contents of the queue
 - 3 init methods
    - create an empty queue
    - create a queue from an array
    - create a fixed size queue (may produce errors for certain operations)
 - Handle errors using exceptions
 - search for a specific item (using a closure)
 - conform to the following protocols: `CustomStringConvertible` and `Equatable`
 ### Requirements
 - appropriate access control
 - function argument names (external and internal)
 - safety checks for optionals
 - implement the length of queue as a computed property
 - implement exception handling using enums
 - make the queue generic
 */

var myQueue : Queue = Queue()

myQueue.push(10)
myQueue.push(10)
myQueue.push(10)


myQueue.pop()

print(myQueue.length())

myQueue.printAll()

/*:
 
 # THIS WILL MAKE ME VERY ANGRY!!
 
 
 struct Queue {
 var internalDS : [Int] = []
 
 func push(newInt : Int) {
 self.internalDS.append(newInt)
 }
 
 }
 
 
 */




//: [Next](@next)
