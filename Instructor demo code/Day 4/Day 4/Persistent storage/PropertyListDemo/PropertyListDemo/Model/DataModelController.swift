//
//  DataModelController.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import Foundation

class DataModelController {
    //MARK: - Singleton logic
    private static var reference : DataModelController?
    
    private init() { }
    
    static var shared : DataModelController {
        if reference == nil {
            reference = DataModelController()
        }
        
        return reference!
    }
    
    private var store : PersistentStoreManager  = PersistentStoreManager()
    
    //MARK: - Functions
    func save(newInfo : Info) {
        self.store.writeToPlist(newInfo: newInfo)
    }
    
    func fetch() -> [Info] {
        self.store.localCache
    }
}
