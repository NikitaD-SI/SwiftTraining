//: [Previous](@previous)
//:# Structs
//: - Date: 11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + Declaring structs
 + Creating objects of struct
 + mutating keyword
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

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

struct Match {
    var team1       : String        = ""
    var team2       : String        = ""
    var venue       : Address
    var matchDate   : Date?
    var contactEmail    : String    = "contact@mail.com"
    
    mutating func updateEmailAddress(newEmail : String) {
        self.contactEmail = newEmail
    }
    
    func describe() -> String {
        
        """
        MATCH
        ----------
        Team 1:         \(self.team1)
        Team 2:         \(self.team2)
        Venue:          \(self.venue.describe())
        Date:           \(self.matchDate?.description ?? "")
        Email:          \(self.contactEmail)
        """
        
        //        var str = ""
        //        if let dt = self.matchDate {
        //            str = dt.description
        //        }
        //
        //        return """
        //        MATCH
        //        ----------
        //        Team 1:         \(self.team1)
        //        Team 2:         \(self.team2)
        //        Venue:          \(self.venue.describe())
        //        Date:           \(str)
        //
        //        """
    }
}

var gameVenue       : Address       = Address(buildingNumber: 10,
                                              street: "Main Avenue",
                                              city: "Mumbai")

var final           : Match         = Match(team1: "India",
                                            team2: "Australia",
                                            venue: gameVenue,
                                            matchDate: Date(timeIntervalSince1970: 74389534))

final.updateEmailAddress(newEmail: "contactus@mail.com")

print(final.describe())


var leagueGame  : Match = final
//: [Next](@next)
