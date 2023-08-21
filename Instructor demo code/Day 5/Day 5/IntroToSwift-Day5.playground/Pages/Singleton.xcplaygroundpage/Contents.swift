//: [Previous](@previous)

import Foundation

class DBHandle {
    private static var refrence : DBHandle?
    
    static var shared : DBHandle {
        if DBHandle.refrence == nil {
            refrence = DBHandle()
        }
        
        return refrence!
    }
    
    private init() {}
}
//: [Next](@next)
