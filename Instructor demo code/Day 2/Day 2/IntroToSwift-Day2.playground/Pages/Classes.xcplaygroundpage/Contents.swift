//: [Previous](@previous)
//:# Classes & Structs
//: - Date: 11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Declaring classes
 + Creating objects of a class
 + Access control
 + Inheritance
 + Overriding functions
 + static function
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation


open class Address {
    internal var buildingNumber  : Int?
    var street          : String    = ""
    var city            : String    = ""
    fileprivate var position        : String    = ""
    static var id       : UUID      = UUID()
    
    // The `??` is called as a nil coalescing operator.
    public func describe() -> String {
        """
        VENUE
        ----------
        Building:       \(self.buildingNumber ?? -1)
        Street:         \(self.street)
        City:           \(self.city)
        """
    }
}

class Match {
    var team1           : String        = ""
    var team2           : String        = ""
    var venue           : Address?
    var matchDate       : Date?
    var contactEmail    : String        = "contact@mail.com"
    
    func updateEmailAddress(newEmail : String) {
        self.contactEmail = newEmail
    }
    
    func describe() -> String {
        
        """
        MATCH
        ----------
        Team 1:         \(self.team1)
        Team 2:         \(self.team2)
        Venue:          \(self.venue?.describe() ?? "")
        Date:           \(self.matchDate?.description ?? "")
        Email:          \(self.contactEmail)
        """
    }
    
    static func doSomething() {
        
    }
    
    class func task() {
        
    }
}

var gameVenue       : Address       = Address()
gameVenue.buildingNumber            = 10
gameVenue.street                    = "Main Avenue"
gameVenue.city                      = "Mumbai"

var final           : Match         = Match()
final.team1                         = "India"
final.team2                         = "Australia"
final.venue                         = gameVenue
final.matchDate = Date(timeIntervalSince1970: 74389534)

final.updateEmailAddress(newEmail: "contactus@mail.com")

//print(final.describe())


class CricketMatch : Match {
    var tournament : String = ""
    
    override func describe() -> String {
        """
        MATCH
        ----------
        Team 1:         \(self.team1)
        Team 2:         \(self.team2)
        Venue:          \(self.venue?.describe() ?? "")
        Date:           \(self.matchDate?.description ?? "")
        Email:          \(self.contactEmail)
        Tournament:     \(self.tournament)
        """
    }
    
    //    override static func doSomething() {
    //
    //    }
    
    override class func task() {
        //
    }
}

var game : CricketMatch = CricketMatch()
game.team1                         = "India"
game.team2                         = "Australia"
game.venue                         = gameVenue
game.matchDate = Date(timeIntervalSince1970: 7438953445)
game.tournament                     = "World Cup"
game.updateEmailAddress(newEmail: "contact-us@mail.com")

print(game.describe())

print(Address.id.description)

CricketMatch.task()

var game2 : CricketMatch = game

/*:
 
 - Note: Apply to both `structs` as well as `classes`.
 
 - open
 - public
 - internal (default)
 - fileprivate
 - private
 */
//: [Next](@next)
