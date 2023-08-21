//
//  CustomCollectionViewControllerVM.swift
//  CollectionViewDemo
//
//  Created by Instructor on 18/08/23.
//

import Foundation
import AmaranthineRandomGenerators
import UIKit

class CustomCollectionViewControllerVM {
    var collection : [DemoModel] = []
    
    init() {
        self.collection = self.populate()
    }
    
    func populate() -> [DemoModel] {
        var returnArr : [DemoModel] = []
        
        var count : Int = Int.random(in: 20...100)
        
        for _ in 0..<count {
            var temp : DemoModel = DemoModel(name: RandomNames.getRandomName(),
                                             img: RandomIcon.getRandomIcon(),
                                             foregroundColor: UIColor.randomColor(),
                                             backgroundColor: UIColor.randomColor())
            
            returnArr.append(temp)
        }
        
        return returnArr
    }
}
