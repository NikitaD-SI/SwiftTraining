//: [Previous](@previous)
//:# Enums
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

//:Simple enums
enum DaysOfTheWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

var today : DaysOfTheWeek = DaysOfTheWeek.monday

today = .friday


//: Associated type enums
enum MathExceptions : Error {
    case nan(String)
    case divideByZero(String)
}

func divide(TheNumber numerator : Int, by denominator : Int) throws -> Int {
    guard denominator > 0
    else {
        throw MathExceptions.divideByZero("Attempting to divide by zero. Not allowed. Negative numbers not allowed too.")
    }
    
    return numerator/denominator
}

do {
    try divide(TheNumber: 23, by: 0)
}
catch MathExceptions.divideByZero(let err) {
    print(#line, err)
}
catch let error {
    print(error.localizedDescription)
}

//: Raw value
enum Colors : Int {
    case red, yellow, blue, green, orange
    
    
    func toString() -> String {
        switch self {
            case .blue:
                return "Blue"
            default:
                return "..."
        }
    }
}

var fontColor : Colors = .blue

fontColor.rawValue

fontColor.toString()

enum Status : String {
    case success    = "Worked"
    case failure    = "Didn't work"
    case pending    = "Waiting"
}

var outcome : Status     = .pending
outcome.rawValue

//: [Next](@next)
