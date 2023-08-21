//
//  ViewController.swift
//  FirstProject
//
//  Created by Instructor on 16/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createViews()
    }

    //MARK: - Variables
    var txtLbl                      : UILabel?
    var txtLbl1                     : UILabel?
    var imgIcon                     : UIImageView?
    
    //MARK: - IBOutlets
    @IBOutlet var rgbSlider         : [UISlider]!
    @IBOutlet weak var displayLbl   : UILabel!
    @IBOutlet weak var nameField    : UITextField!
    @IBOutlet weak var icon         : UIImageView!
    
    //MARK: - IBActions
    @IBAction func switchToggled(_ sender: UISwitch) {
        self.icon.isHidden = !self.icon.isHidden
    }
    
    @IBAction func tapMeTapped(_ sender: UIButton, forEvent event: UIEvent) {
        self.displayLbl.text = self.nameField.text
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        self.view.backgroundColor = UIColor(red: CGFloat(self.rgbSlider[0].value/255.0),
                                            green: CGFloat(self.rgbSlider[1].value/255.0),
                                            blue: CGFloat(self.rgbSlider[2].value/255.0),
                                            alpha: 1.0)
    }
}

extension ViewController {
    func createViews() {
        self.createLabel()
        self.createLabel1()
        self.createImage()
    }
    
    func createLabel() {
        //1. Determine the size of the view
        let frame   : CGRect        = CGRectMake(30.0, 330.0, 100.0, 50.0)
        
        //2. Create the view object
        self.txtLbl                 = UILabel(frame: frame)
        
        //3. Customise the view
        self.txtLbl?.text           = "This view was created programmatically."
        self.txtLbl?.numberOfLines  = 3
        self.txtLbl?.textColor      = UIColor.magenta
        self.txtLbl?.font           = UIFont(name: "Marker Felt", size: 23.0)
        
        //4. Add the view to the main view
        self.view.addSubview(self.txtLbl!)
    }
    
    func createLabel1() {
        //1. Determine the size of the view
        let frame   : CGRect        = CGRectMake(130.0, 330.0, 100.0, 50.0)
        
        //2. Create the view object
        self.txtLbl1                 = UILabel(frame: frame)
        
        //3. Customise the view
        self.txtLbl1?.text           = "This view was created programmatically."
        self.txtLbl1?.numberOfLines  = 3
        self.txtLbl1?.textColor      = UIColor.yellow
        self.txtLbl1?.font           = UIFont(name: "Marker Felt", size: 23.0)
        
        //4. Add the view to the main view
        self.view.addSubview(self.txtLbl1!)
    }
    
    func createImage() {
        //1. Determine the size of the view
        let frame   : CGRect        = CGRectMake(200.0, 200.0, 100.0, 100.0)
        
        //2. Create the view object
        self.imgIcon                = UIImageView(frame: frame)
        
        //3. Customise the view
        self.imgIcon?.image         = UIImage(named: "flipboard")
        
        //4. Add the view to the main view
        self.view.addSubview(self.imgIcon!)
    }
}
