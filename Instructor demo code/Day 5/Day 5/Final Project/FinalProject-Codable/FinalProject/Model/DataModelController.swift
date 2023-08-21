//
//  DataModelController.swift
//  FinalProject
//
//  Created by Arun Patwardhan on 08/08/18.
//  Copyright © 2018 Amaranthine. All rights reserved.
//

import Foundation

struct ReadWritekeys {
    static let name_key     : String    = "Name"
    static let email_key    : String    = "Email"
    static let phone_key    : String    = "Phone"
    static let DOB_key      : String    = "Dob"
    static let DOS_key      : String    = "DoS"
    static let safety_key : String    = "safety"
    static let comfort_key  : String    = "comfort"
    static let security_key  : String    = "security"
}

final class DataModelController
{
    //Variables --------------------------------------------------
    var localCache                              : [SurveyModel] = [SurveyModel]()
    private let persistentStoreFile             : String        = "surveyResponses"
    private let persistentStoreFileExtension    : String        = "plist"
    fileprivate var plistFile   : URL?
    fileprivate let documentsDirectory          = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //Singleton --------------------------------------------------
    static var modelController : DataModelController?
    static func createModelController() -> DataModelController
    {
        if nil == modelController
        {
            modelController = DataModelController()
        }
        return modelController!
    }
    
    private init()
    {
        
    }
    
    //Functions --------------------------------------------------
    /**
     This function caches the survey onto the local queue
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Write scheduling function")
    func cache(Survey newSurvey : SurveyModel)
    {
        localCache.append(newSurvey)
        for i in localCache {
            print(i.name)
        }
    }
    
    /**
     This function schedules all the write operations from the local cache onto the queue
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Write scheduling function")
    func put()
    {
        //1. Path tp the plist file
        plistFile  = documentsDirectory.appendingPathComponent(self.persistentStoreFile).appendingPathExtension(self.persistentStoreFileExtension)
        
        //2. Create the object that will encode the data for us
        let encoder : PropertyListEncoder   = PropertyListEncoder()
        
        //3. Encode the data using the encoder
        let encodedValue                    = try? encoder.encode(localCache)
        
        //4. Write the encoded data to the plist file
        ((try? encodedValue?.write(to: plistFile!, options: .noFileProtection)) as ()??)
        
        localCache.removeAll()
    }
    
    /**
     This function schedules a read operation onto the queue
     - important: This function does not perform data validation
     - returns: Void.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015 - version: 1.0*/
    @available(iOS, introduced: 11.0, message: "Read scheduling function")
    func pullData(UpdateScreenWith updater : @escaping ([SurveyModel]) -> Void)
    {
        //1. Path tp the plist file
        plistFile = documentsDirectory.appendingPathComponent(self.persistentStoreFile).appendingPathExtension(self.persistentStoreFileExtension)
        
        //2. Create the object that will decode the data for us
        let propertyListDecoder : PropertyListDecoder   = PropertyListDecoder()
        
        if let retrievedpersonsData = try? Data(contentsOf: plistFile!), let decodedpersons = try?  propertyListDecoder.decode([SurveyModel].self, from: retrievedpersonsData) {
            for p in decodedpersons {
                print(p.name)
            }
            
            updater(decodedpersons)
        }
    }
}
