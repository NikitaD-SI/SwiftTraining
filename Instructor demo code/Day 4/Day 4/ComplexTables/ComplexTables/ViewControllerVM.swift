//
//  ViewControllerVM.swift
//  ComplexTables
//
//  Created by Instructor on 17/08/23.
//

import Foundation

class ViewControllerVM {
   
    //MARK: - Variables
    var tableData : Dictionary<String, [DictionaryModel]> = Dictionary<String, [DictionaryModel]>()
    
    var sections : [String] {
        tableData.keys.map({(input : String) -> String in return input})
    }
    
    func dataForRow(For section : String, at index : Int) -> DictionaryModel {
        self.tableData[section]![index]
    }
    
    func rowCount(For section : String) -> Int {
        self.tableData[section]!.count
    }
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
        for element in ModelController.shared.collection {
            //Get the key
            var key : String = "\(element.heading.first!)"
            
            //Check to see if there is an array for the key, if there isnt one, then create it.
            if self.tableData[key] == nil {
                self.tableData[key] = []
            }
            
            //add the row data to the array
            self.tableData[key]?.append(element)
        }
    }
}
