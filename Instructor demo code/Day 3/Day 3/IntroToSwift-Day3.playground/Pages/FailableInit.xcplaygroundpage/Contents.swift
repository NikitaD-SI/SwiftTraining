//: [Previous](@previous)
//:# Failable Initializer
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

//: Failable init
class Picture {
    var file : String = ""
    
    func draw() {
        if file.isEmpty {
            assertionFailure("Empty file")
        }
        
        print(file)
    }
    
    init?(newFile : String) {
        guard !newFile.isEmpty
        else {
            return nil
        }
        
        self.file = newFile
        
//        if !newFile.isEmpty {
//            self.file = newFile
//        }
//        else {
//            return  nil
//        }
    }
}

var icon : Picture? = Picture(newFile: "dfd")


icon?.draw()




//: [Next](@next)
