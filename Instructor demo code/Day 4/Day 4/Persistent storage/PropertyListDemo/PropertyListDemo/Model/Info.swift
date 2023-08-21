//
//  Info.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import Foundation

struct Info {
    var text        : String    = ""
    var decimal     : Double    = 0.0
    var eventDate   : Date      = Date.now
}

extension Info : Codable {
    
}

extension Info : CustomStringConvertible {
    var description: String {
        """
        Info
        -----
        TEXT:       \(self.text)
        DECIMAL:    \(self.decimal)
        DATE:       \(self.eventDate.description)
        """
    }
}
