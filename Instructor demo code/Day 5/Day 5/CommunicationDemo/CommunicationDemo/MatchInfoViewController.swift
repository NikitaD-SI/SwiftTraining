//
//  MatchInfoViewController.swift
//  CommunicationDemo
//
//  Created by Instructor on 18/08/23.
//

import UIKit

class MatchInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.date.text = self.viewModel.model?.startDate
        self.status.text = self.viewModel.model?.status
    }
    
    var viewModel   : MatchInfoViewControllerVM = MatchInfoViewControllerVM()
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var status: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
