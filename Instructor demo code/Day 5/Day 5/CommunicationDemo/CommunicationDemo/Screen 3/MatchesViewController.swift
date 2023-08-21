//
//  MatchesViewController.swift
//  CommunicationDemo
//
//  Created by Instructor on 18/08/23.
//

import UIKit

class MatchesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var matchList: UITableView!
    let cellID  : String = "matchCELL"
    var viewModel   : MatchesViewControllerVM = MatchesViewControllerVM()
    let segueID : String = "info"
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MatchesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: self.cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cellID)
        }
        
        var content = cell?.defaultContentConfiguration()
        
        content?.text = self.viewModel.tableData[indexPath.row].matchInfo.matchDesc
        
        cell?.contentConfiguration = content
        
        return cell!
    }
    
    
}

extension MatchesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueID, sender: self.viewModel.tableData[indexPath.row].matchInfo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let destination : MatchInfoViewController = segue.destination as! MatchInfoViewController
            destination.viewModel.model = (sender as! MatchInfo)
        }
    }
}
