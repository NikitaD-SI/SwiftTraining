//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Instructor on 18/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var stepperLbl: UILabel!
    @IBOutlet weak var sliderLbl: UILabel!
    @IBOutlet weak var tfLbl: UILabel!
    @IBOutlet weak var switchLbl: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var switchValue: UISwitch!
    @IBOutlet weak var tfValue: UITextField!
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        PreferenceManager.shared.savePreferences(values: PrefsObject(number: Int(stepperValue.value),
                                                                     text: tfValue.text!,
                                                                     status: switchValue.isOn,
                                                                     decimal: sliderValue.value))
    }
    
    @IBAction func fetch(_ sender: UIBarButtonItem) {
        var prefs : PrefsObject = PreferenceManager.shared.fetchPreferences()
        
        self.sliderLbl.text = "\(prefs.decimal)"
        self.stepperLbl.text = "\(prefs.number)"
        self.switchLbl.text = prefs.status ? "Yes" : "No"
        self.tfLbl.text = prefs.text
    }
}

