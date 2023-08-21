//: [Previous](@previous)

//:# Properties
//: - Date: 14th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Stored properties
 + Computed properties
 + Lazy properties
 + Property observers
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

//: Stored properties
struct Address {
    var buildingNumber  : Int?
    var street          : String    = ""
    var city            : String    = ""
    
    // The `??` is called as a nil coalescing operator.
    func describe() -> String {
        """
        VENUE
        ----------
        Building:       \(self.buildingNumber ?? -1)
        Street:         \(self.street)
        City:           \(self.city)
        """
    }
}

//: Computed properties
struct Score {
    var runs : Int = 0
    var overs : Int = 50
    
    var runRate : Int {
        get {
            self.runs/self.overs
        }
        set (newValue) {
            self.runs = self.overs * newValue
        }
    }
    
    
//    func getRunRate() -> Int {
//        runs/overs
//    }
//
//    mutating func setRunRate(newRate : Int) {
//        self.runs = self.overs * newRate
//    }
}

var teamScore   : Score = Score()
teamScore.runRate = 4

print(teamScore.runRate)
print(teamScore.runs)
print(teamScore.overs)


//: Lazy properties

struct Point {
    lazy var x = 0.0
    lazy var y = 0.0
}

var pt : Point = Point()

pt.x = 2.3

pt.y = 10.0

//: Property observers

struct Location {
    var latitude : Double   = 0.0 {
        willSet {
            print("Value will change to \(newValue)")
        }
        didSet {
            print("Value changed from \(oldValue)")
        }
    }
    var longitude : Double  = 0.0
}

var position : Location = Location()
position.latitude = 3.4

print(position.latitude)

position.latitude = 5.6



//: [Next](@next)
