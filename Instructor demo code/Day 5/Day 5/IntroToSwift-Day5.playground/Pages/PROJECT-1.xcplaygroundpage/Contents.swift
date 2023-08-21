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

//var myQueue : Queue = Queue()
//
//myQueue.push(10)
//myQueue.push(10)
//myQueue.push(10)
//
//
//myQueue.pop()
//
//print(myQueue.length())
//
//myQueue.printAll()

/*:
 
 # THIS WILL MAKE ME VERY ANGRY!!
 
 
 struct Queue {
 var internalDS : [Int] = []
 
 func push(newInt : Int) {
 self.internalDS.append(newInt)
 }
 
 }
 
 
 */

/**
 Node<Element> class represents a single node.
 
 *Parameters*
 
 `data`          Represents the data stored in the Node.
 
 `nextNode`      Represents the next node in the queue.
 
 - Author: Arun Patwardhan
 - Version: 1.0
 */
final class Node<Element>
{
    var data        : Element?
    
    var nextNode    : Node<Element>?
    
    init(with newData : Element) {
        data = newData
    }
}

/**
 Exceptions for Queue
 
 *values*
 
 `elementNotFound(String)`
 
 Thrown when the element being searched is not present
 
 `empty(String)`
 
 Thrown when an action is being performed on an empty queue.
 
 `indexOutOfBounds(String)`
 
 Thrown when attempting to access queue item beyond the allowed capacity.
 
 `queueFull(String)`
 
 Thrown when attempting to add an item to a queue that has reached its maximum limit
 
 - Author: Arun Patwardhan
 - Version: 1.0
 */
public enum QueueExceptions : Error
{
    case elementNotFound(String)
    case empty(String)
    case indexOutOfBounds(String)
    case queueFull(String)
}

extension QueueExceptions : CustomStringConvertible
{
    public var description: String {
        var returnStr : String = ""
        switch self {
            case .elementNotFound(let str):
                returnStr = "Element not found: \(str)"
            case .empty(let str):
                returnStr = "Empty: \(str)"
            case .indexOutOfBounds(let str):
                returnStr = "Index out of bounds: \(str)"
            case .queueFull(let str):
                returnStr = "Queue full: \(str)"
        }
        return returnStr
    }
}

/**
 Search results for Queue
 
 *values*
 
 `elementNotFound`
 
 `elementFound`
 
 `empty`
 
 - Author: Arun Patwardhan
 - Version: 1.0
 - Date: 20th July 2019
 
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 */
public enum SearchResult {
    case elementFound
    case empty
    case elementNotFound
}

extension SearchResult {
    /**
     This function returns a `String` version of the value.
     - returns: `String`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "String converter")
    public func toString() -> String {
        switch self {
            case .elementFound:
                return "ElementFound"
            case .elementNotFound:
                return "ElementNotFound"
            case .empty:
                return "Empty"
        }
    }
}

/**
 AmaranthineQueue<Element> struct represents the entire queue
 
 **Variables**
 
 `startNode`
 
 Represents the starting node in the queue.
 
 `lastNode`
 
 Represents the last node in the queue.
 
 `length`
 
 Represents the size of the queue.
 
 **Functions**
 
 `func push(Element newElement : Element)`
 
 Used to add an element in the Queue
 
 `func pop() throws -> Element?`
 
 Removes the first element in the queue
 
 `func search(forElement searchElement : Element, with task : SearchClosure) throws -> SearchResult`
 
 Used to search for an element in the Queue
 
 **Protocols**
 
 Conforms to the following protocols
 
 `CustomStringConvertible`
 
 `Equatable`
 
 `Sequence`
 
 `Collection`
 
 `ExpressibleByArrayLiteral`
 
 
 - Author: Arun Patwardhan
 - Version: 1.0
 */
public struct AmaranthineQueue<Element> {
    //MARK: - Variables --------------------------------------------------
    fileprivate var startNode   : Node<Element>?    = nil
    public var size             : UInt64            = 0
    fileprivate var lastNode    : Node<Element>?    = nil
    private var maxCapacity     : UInt64            = UInt64.max
    
    //MARK: - Functions --------------------------------------------------
    //Empty queue
    /**
     This init creates an empty queue
     - important: This function does not do validation.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    public init()
    {
    }
    
    //Queue with maximum limit
    /**
     This init creates queue whose length cannot exceed the capacity specified
     - important: This function does not do validation.
     - requires: iOS 11 or later
     - Since: iOS 11
     - parameter withCapacity: This is specifies the maximum number of elements allowed.
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    public init(withCapacity length : UInt64) {
        self.init()
        self.maxCapacity = length
    }
    
    //Queue with prepopulated values
    /**
     This init creates queue which is filled with the contents of the array provided
     - important: This function does not do validation. Items will be added in the sequence in which they are present in the array
     - warning: The initalizer fails if the array size is greater than the capacity.
     - requires: iOS 11 or later
     - Since: iOS 11
     - returns: Can return nil is max capacity exceeded.
     - parameter val: This is contains the items to be added to the queue.
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    public init?(withValues val : [Element]) {
        self.init()
        guard val.count <= self.maxCapacity
        else {
            return nil
        }
        for i in val {
            do {
                try self.push(Element: i)
            }
            catch {
                return nil
            }
        }
    }
    
    /**
     This property provides the length of the queue
     - important: This function does not do validation.
     - returns: `UInt64`.
     - requires: iOS 13 or later
     - Since: iOS 13
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    @available(iOS, introduced: 13, message: "This code uses syntax available in Swift 5.1 or later")
    public var length : UInt64 {
        self.size
    }
    
    /**
     This function adds an element to the end of the queue
     - important: This function does not do validation.
     - warning: `push` can throw if the maximum capacity is breached
     - returns: Void.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11, message: "Use this to add elements to a Node")
    public mutating func push(Element newElement : Element) throws {
        guard self.size < self.maxCapacity
        else {
            throw QueueExceptions.queueFull("Reached the limit. Cannot add more than \(self.maxCapacity) items")
        }
        
        //1. Create a node
        let newNode : Node<Element> = Node<Element>(with: newElement)
        
        //2. Add node to queue
        if nil == startNode {
            startNode = newNode
        }
        else {
            lastNode?.nextNode = newNode
        }
        size += 1
        lastNode = newNode
    }
    
    /**
     This function removes the first element from the queue
     - important: This function throws an Exception if you try to remove from an empty queue
     - note: The reason why the return type is an optional is because the node may or may not hold data. A return value of `nil` indicates that there is a node, but the node is empty.
     - returns: `Element?`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    @discardableResult public mutating func pop() throws -> Element? {
        guard nil != startNode
        else {
            throw QueueExceptions.empty("The queue is empty")
        }
        let returnNode          = startNode
        startNode               = startNode?.nextNode
        returnNode?.nextNode    = nil
        size -= 1
        return returnNode?.data
    }
}

//:#### Extension to Queue Class
/**
 Adds search capability.
 
 - Author: Arun Patwardhan
 - Version: 1.1
 */
extension AmaranthineQueue {
    /**
     Closure Type used for searching
     
     *Arguments*
     
     Takes 2 arguments both of type element
     
     *Returns*
     
     `Bool`. True indicates a match.
     
     - Author: Arun Patwardhan
     - Version: 1.1
     */
    public typealias SearchClosure = (Element, Element) -> Bool
    
    /**
     This function searches for the given element in the queue
     - important: This function throws an Exception if you try to search from an empty queue
     - returns: `SearchResult`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Search for an Element Function")
    public func search(forElement searchElement : Element, with task : SearchClosure) throws -> SearchResult {
        guard nil != startNode
        else {
            throw QueueExceptions.empty("Cannot search. The queue is Empty.")
        }
        
        var searchNode : Node<Element>? = startNode
        for _ in 0..<size {
            guard nil != searchNode
            else {
                break
            }
            if nil != searchNode!.data {
                if task(searchElement, searchNode!.data!) {
                    return SearchResult.elementFound
                }
            }
            searchNode = searchNode!.nextNode
        }
        return SearchResult.elementNotFound
    }
}

//:#### Extension to Queue Class
/**
 Adds the following capabilities.
 ````
 +
 +=
 ````
 
 - Author: Arun Patwardhan
 - Version: 1.1
 */
extension AmaranthineQueue {
    /**
     This function overloads the `+` operator for the Queue. This function takes 2 Queues and combines them to form a new Queue.
     - note: This method will not add an element to the queue if there is an excpetion while attempting to do so. It will just move on to the next item. No exception or warnings are thrown.
     - returns: `AmaranthineQueue`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    public static func +(lhs : AmaranthineQueue, rhs : AmaranthineQueue) -> AmaranthineQueue {
        var resultingQueue  : AmaranthineQueue  = AmaranthineQueue()
        
        var iteratorNode    : Node<Element>?    = lhs.startNode
        
        for _ in 0..<lhs.size {
            guard nil != iteratorNode
            else {
                break
            }
            if nil != iteratorNode!.data {
                try? resultingQueue.push(Element: (iteratorNode?.data!)!)
            }
            iteratorNode = iteratorNode!.nextNode
        }
        
        iteratorNode = rhs.startNode
        
        for _ in 0..<rhs.size {
            guard nil != iteratorNode
            else {
                break
            }
            if nil != iteratorNode!.data {
                try? resultingQueue.push(Element: (iteratorNode?.data!)!)
            }
            iteratorNode = iteratorNode!.nextNode
        }
        return resultingQueue
    }
    
    /**
     This function overloads the `+=` operator for the Queue. This function takes 2 Queues and adds the contents of the second queue to your first queue.
     - note: This method will not add an element to the queue if there is an excpetion while attempting to do so. It will just move on to the next item. No exception or warnings are thrown.
     - returns: `Bool`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove Element Function")
    public static func +=(lhs : inout AmaranthineQueue, rhs : AmaranthineQueue) {
        var iteratorNode : Node<Element>? = rhs.startNode
        
        for _ in 0..<rhs.size {
            guard nil != iteratorNode
            else {
                break
            }
            if nil != iteratorNode!.data
            {
            try? lhs.push(Element: (iteratorNode?.data!)!)
            }
            iteratorNode = iteratorNode!.nextNode
        }
    }
}

//:#### Extension to Queue Class
/**
 Adds the following capabilities.
 ````
 empty queue
 ````
 
 - Author: Arun Patwardhan
 - Version: 1.2
 */
extension AmaranthineQueue {
    /**
     This function removes all the elements from the queue
     - important: This function throws an Exception if you try to remove from an empty queue
     - returns: `Void`
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Remove all Elements Function")
    public mutating func emptyQueue() throws {
        guard nil != startNode
        else {
            throw QueueExceptions.empty("The queue is empty")
        }
        
        for _ in 0..<size {
            let nodeToBeRemoved         = startNode
            startNode                   = startNode?.nextNode
            nodeToBeRemoved?.nextNode   = nil
        }
        size = 0
    }
}

//:#### Extension to Queue Class
/**
 Adds conformance to the CustomStringConvertible protocol
 
 - Author: Arun Patwardhan
 - Version: 1.5
 */
extension AmaranthineQueue : CustomStringConvertible {
    public var description: String {
        var returnString : String = ""
        if nil != startNode {
            var searchNode : Node<Element>? = startNode
            for i in 0..<size {
                guard nil != searchNode else { break }
                if nil != searchNode!.data {
                    returnString += "[\(i)]: \(searchNode!.data!)\n"
                }
                searchNode = searchNode!.nextNode
            }
        }
        return returnString
    }
}

//:#### Extension to Queue Class
/**
 Adds computed properties to access first and last element
 - note: returns `nil` if queue is empty
 - Date: 24th January 2021
 - Author: Arun Patwardhan
 - Version: 1.5
 */
extension AmaranthineQueue {
    var first : Element? {
        guard self.size > 0
        else {
            return nil
        }
        return self.startNode?.data
    }
    
    var last : Element? {
        guard self.size > 0
        else {
            return nil
        }
        return self.lastNode?.data
    }
}

//:#### Extension to Queue Class
/**
 Adds conformance to the Equatable protocol
 
 - Author: Arun Patwardhan
 - Version: 1.5
 */
extension AmaranthineQueue : Equatable where Element : Equatable {
    public static func == (lhs: AmaranthineQueue<Element>, rhs: AmaranthineQueue<Element>) -> Bool {
        
        if lhs.size == rhs.size && lhs.first == rhs.first {
            return true
        }
        return false
    }
}



// Example

var intQueue : AmaranthineQueue<Int> = AmaranthineQueue<Int>()
try? intQueue.push(Element: 123)
try? intQueue.push(Element: 213)
try? intQueue.push(Element: 231)
try? intQueue.push(Element: 423)
try? intQueue.push(Element: 243)
try? intQueue.push(Element: 234)

print(intQueue)

var num : AmaranthineQueue<Int> = AmaranthineQueue<Int>()
try? num.push(Element: 123)
try? num.push(Element: 213)
try? num.push(Element: 231)
try? num.push(Element: 423)
try? num.push(Element: 243)
try? num.push(Element: 234)

var thirdQueue : AmaranthineQueue<Int> = intQueue + num

print(thirdQueue.length)

//:# arun@amaranthine.co.in
//: [Next](@next)
