//
//  DictionaryModel.swift
//  ComplexTables
//
//  Created by Instructor on 17/08/23.
//

import Foundation
import AmaranthineRandomGenerators

struct DictionaryModel {
    //MARK: - Variables
    var icon            : String    = ""
    var heading         : String    = ""
    var info            : String    = ""
}

class ModelController {
    //MARK: - Variables
    var collection                  : [DictionaryModel] = []
    
    //MARK: - Singleton logic
    private static var reference    : ModelController?
    
    static var shared               : ModelController {
        if reference == nil {
            reference = ModelController()
        }
        return reference!
    }
    
    private init() {
        self.generateData()
    }
    
    //MARK: - Functions
    func generateData() {
        let count : Int = Int.random(in: 10...100)
        
        for _ in 0...count {
            var temp = DictionaryModel()
            temp.icon       = RandomIcon.getRandomIcon()
            temp.heading    = RandomNames.getRandomName()
            temp.info       = RandomLines.getRandomLine()
            
            self.collection.append(temp)
        }
    }
}
