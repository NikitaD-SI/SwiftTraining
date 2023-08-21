//
//  SurveyModel.swift
//  FinalProject
//
//  Created by Arun Patwardhan on 08/08/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

/**
This struct represents a single Response from the customer.
 
 - Author: Arun Patwardhan
 - Version: 1.0
 */
struct SurveyModel : Codable
{
    var name            : String
    var dateOfBirth     : Date
    var email           : String
    var phone           : String
    var comfortRating   : Rating
    var safetyRating    : Rating
    var securityRating  : Rating
    var dateOfSurvey    : Date
    
    enum CodingKeys : String, CodingKey {
        case name
        case dateOfBirth
        case email
        case phone
        case comfortRating
        case safetyRating
        case securityRating
        case dateOfSurvey
    }
    
    init(name :String, dateOfBirth : Date, email : String, phone : String, comfortRating : Rating, safetyRating : Rating, securityRating : Rating, dateOfSurvey : Date) {
        self.name           = name
        self.dateOfBirth    = dateOfBirth
        self.email          = email
        self.phone          = phone
        self.comfortRating  = comfortRating
        self.safetyRating   = safetyRating
        self.securityRating  = securityRating
        self.dateOfSurvey   = dateOfSurvey
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer  = try decoder.container(keyedBy: CodingKeys.self)
        self.name           = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.dateOfBirth    = try valueContainer.decode(Date.self, forKey: CodingKeys.dateOfBirth)
        self.email          = try valueContainer.decode(String.self, forKey: CodingKeys.email)
        self.phone          = try valueContainer.decode(String.self, forKey: CodingKeys.phone)
        self.comfortRating  = try valueContainer.decode(Rating.self, forKey: CodingKeys.comfortRating)
        self.safetyRating = try valueContainer.decode(Rating.self, forKey: CodingKeys.safetyRating)
        self.securityRating  = try valueContainer.decode(Rating.self, forKey: CodingKeys.securityRating)
        self.dateOfSurvey   = try valueContainer.decode(Date.self, forKey: CodingKeys.dateOfSurvey)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: CodingKeys.name)
        try container.encode(self.dateOfBirth, forKey: CodingKeys.dateOfBirth)
        try container.encode(self.email, forKey: CodingKeys.email)
        try container.encode(self.phone, forKey: CodingKeys.phone)
        try container.encode(self.comfortRating, forKey: CodingKeys.comfortRating)
        try container.encode(self.safetyRating, forKey: CodingKeys.safetyRating)
        try container.encode(self.securityRating, forKey: CodingKeys.securityRating)
        try container.encode(self.dateOfSurvey, forKey: CodingKeys.dateOfSurvey)
    }
}
