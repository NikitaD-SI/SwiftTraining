//
//  DetailsViewController.swift
//  ComplexTables
//
//  Created by Instructor on 17/08/23.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.iconImg.image          = UIImage(systemName: self.viewModel.icon)
        self.descriptionLbl.text    = self.viewModel.description
        self.titleLbl.text          = self.viewModel.title
    }
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    var viewModel : DetailsVM   = DetailsVM()
    
    

}
