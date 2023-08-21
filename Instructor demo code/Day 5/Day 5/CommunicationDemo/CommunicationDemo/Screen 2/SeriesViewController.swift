//
//  SeriesViewController.swift
//  CommunicationDemo
//
//  Created by Instructor on 18/08/23.
//

import UIKit

class SeriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.seriesList.reloadData()
    }
    
    var viewModel : SeriesViewControllerVM = SeriesViewControllerVM()
    
    @IBOutlet weak var seriesList: UITableView!
    let cellID  : String = "seriesCELL"
    let segueID : String = "moreMatches"
    

}

extension SeriesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: self.cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cellID)
        }
        
        var content = cell?.defaultContentConfiguration()
        
        content?.text = self.viewModel.tableData[indexPath.row].seriesAdWrapper?.seriesName
        
        cell?.contentConfiguration = content
        
        return cell!
    }
    
    
}

extension SeriesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueID, sender: self.viewModel.tableData[indexPath.row].seriesAdWrapper?.matches)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let destination : MatchesViewController = segue.destination as! MatchesViewController
            destination.viewModel.tableData = (sender as! [Match])
        }
    }
}
