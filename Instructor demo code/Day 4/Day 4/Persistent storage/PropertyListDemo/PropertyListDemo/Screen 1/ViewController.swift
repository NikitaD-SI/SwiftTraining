//
//  ViewController.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - IBOutlets
    @IBOutlet weak var eventDate    : UIDatePicker!
    @IBOutlet weak var decimalValue : UISlider!
    @IBOutlet weak var textField    : UITextField!
    
    //MARK: - Variables
    var viewModel                   : ViewControllerVM  = ViewControllerVM()
    
    //MARK: - IBActions
    @IBAction func saveTapped(_ sender: UIButton) {
        self.viewModel.text     = self.textField.text!
        self.viewModel.decimal  = Double(self.decimalValue.value)
        self.viewModel.event    = self.eventDate.date
        self.viewModel.save()
    }
    
    @IBAction func fetchTapped(_ sender: UIButton) {
    }
    
}

