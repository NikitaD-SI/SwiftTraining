//
//  PreferfenceManager.swift
//  UserDefaultsDemo
//
//  Created by Instructor on 18/08/23.
//

import Foundation

struct PrefsObject {
    var number : Int = 0
    var text : String = ""
    var status : Bool = false
    var decimal : Float = 0.0
}

enum PrefKeys : String {
    case txt_preference
    case num_preference
    case slider_preference
    case bool_preference
}

class PreferenceManager {
    private static var reference : PreferenceManager?
    
    private init() {}
    
    static var shared : PreferenceManager {
        if reference == nil {
            reference = PreferenceManager()
        }
        
        return reference!
    }
    
    private var defaults : UserDefaults = UserDefaults.standard
    
    func savePreferences(values : PrefsObject) {
        self.defaults.setValue(values.text, forKey: PrefKeys.txt_preference.rawValue)
        self.defaults.setValue(values.number, forKey: PrefKeys.num_preference.rawValue)
        self.defaults.setValue(values.decimal, forKey: PrefKeys.slider_preference.rawValue)
        self.defaults.setValue(values.status, forKey: PrefKeys.bool_preference.rawValue)
    }
    
    func fetchPreferences() -> PrefsObject {
        PrefsObject(number: self.defaults.integer(forKey: PrefKeys.num_preference.rawValue),
                    text: self.defaults.string(forKey: PrefKeys.txt_preference.rawValue) ?? "",
                    status: self.defaults.bool(forKey: PrefKeys.bool_preference.rawValue),
                    decimal: self.defaults.float(forKey: PrefKeys.slider_preference.rawValue))
        
    }
}
