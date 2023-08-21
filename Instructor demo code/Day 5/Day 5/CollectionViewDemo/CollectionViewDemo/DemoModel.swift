//
//  DemoModel.swift
//  CollectionViewDemo
//
//  Created by Instructor on 18/08/23.
//

import UIKit

struct DemoModel {
    var name            : String    = ""
    var img             : String    = ""
    var foregroundColor : UIColor?
    var backgroundColor : UIColor?
}

extension DemoModel : CustomStringConvertible {
    var description: String {
        """
        NAME:       \(self.name)
        IMG:        \(self.img)
        FRONT COLOR:    \(self.foregroundColor?.description ?? "")
        BACK COLOR:     \(self.backgroundColor?.description ?? "")
        """
    }
}
