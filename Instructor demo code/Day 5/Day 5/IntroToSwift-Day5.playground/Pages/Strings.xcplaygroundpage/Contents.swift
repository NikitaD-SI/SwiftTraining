//: [Previous](@previous)

//:# Strings
//: - Date: 11th August 2023
//: - Author: Arun Patwardhan
//: - Copyright: Copyright (c) Amaranthine 2015
/*:
 
 In this section we will be looking at the following topics
 + String literals
 + Multi line string literals
 + Special characters
 + Characters
 + String operations
 
 **Contact Details**
 
 [arun@amaranthine.co.in](mailto:arun@amaranthine.co.in)
 
 [www.amaranthine.in](https://www.amaranthine.in)
 
 - note: For more information about how these markups were written please visit: [Adding formatted Text to Swift](https://arunpatwardhan.com/2017/11/09/adding-formatted-text-to-swift-in-xcode/)
 */
import Foundation

//: String literal
var greeting = "Hello, playground"

//: Multiline string literal
var paragraph = """
This is the iOS App Development course.
I am really enjoying Swift Programming.
Looking forward to many new things.
"""

//: Unicode

var icon = "😁"

var 😇 = "Blessed"

var msg = "ख्केरल के्िकरेप्गहिैे ८२३ब८ी"


//: Character to string
var symbol : Character = "%"

var str : String = String(symbol)


for char in paragraph {
    //print(char)
}

//: String interpolation
var name = "Arun"
var email = "arun@amaranthine.co.in"
var phone = 90830958
var city = "Mumbai"

var message : String = "Name: \(name), Email: \(email), Phone: \(phone), City: \(city)"

print(message)


//: String operations

var str1 = message + paragraph

var contains = message.contains("@")

paragraph.suffix(3)
paragraph.hasPrefix("ABC")

if message == paragraph {
    print("They are the same")
}
else {
    print("They are different.")
}




//: [Next](@next)
