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
 
 ### Requirements
 - appropriate access control
 - function argument names (external and internal)
 - safety checks for optionals
 
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
