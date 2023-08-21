//
//  ResponsesTableViewControllerVM.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import Foundation

class ResponsesTableViewControllerVM {
    var tableData   : [Info] = []
    
    init() {
        self.tableData = DataModelController.shared.fetch()
    }
}
