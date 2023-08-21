//
//  ViewControllerVM.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import Foundation

class ViewControllerVM {
    //MARK: - Variables
    var text    : String    = ""
    var decimal : Double    = 0.0
    var event   : Date      = Date.now
    
    //MARK: - Functions
    func save() {
        DataModelController.shared.save(newInfo: Info(text: self.text,
                                                      decimal: self.decimal,
                                                      eventDate: self.event))
    }
}
