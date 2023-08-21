//
//  PersistentStoreManager.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import Foundation

class PersistentStoreManager {
    //MARK: - Variables
    var fileName    : String    = "response"
    var fileType    : String    = "plist"
    var localCache  : [Info]    = []
    var pathToDocuments = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
    
    //MARK: -  init
    init() {
        self.localCache = self.readFromPlist()
    }
    
    //MARK: - Functions
    func writeToPlist(newInfo : Info) {
        //1. Get the path to the plist file
        var plistPath = pathToDocuments.appendingPathComponent(self.fileName).appendingPathExtension(self.fileType)
        print(plistPath)
        
        //2. Encode the contents
        let encoder : PropertyListEncoder   = PropertyListEncoder()
        localCache.append(newInfo)
        let encodedValue                    = try? encoder.encode(localCache)
        
        //3. Write to plist
        try? encodedValue?.write(to: plistPath)
    }
    
    func readFromPlist() -> [Info] {
        var dataToReturn : [Info] = []
        //1. Get the path to the plist file
        var plistPath = pathToDocuments.appendingPathComponent(self.fileName).appendingPathExtension(self.fileType)
        print(plistPath)
        
        //2. Decode the contents of the plist
        let decoder : PropertyListDecoder   = PropertyListDecoder()
        if let retrievedData = try? Data(contentsOf: plistPath), let decodedData = try? decoder.decode([Info].self, from: retrievedData) {
            for item in decodedData {
                print(item)
            }
            dataToReturn = decodedData
        }
        
        //3. Return the contents
        return dataToReturn
    }
}
