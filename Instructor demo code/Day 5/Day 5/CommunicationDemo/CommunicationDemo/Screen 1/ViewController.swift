//
//  ViewController.swift
//  CommunicationDemo
//
//  Created by Instructor on 18/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    let cellID : String = "CELL"
    var viewModel   : ViewControllerVM  = ViewControllerVM()
    let segueID : String = "moreSeries"
    
    @IBAction func fetchTapped(_ sender: UIButton) {
        self.viewModel.fetchResponse(updateUIWith: {() -> Void in
            DispatchQueue.main.async {
                self.list.reloadData()
            }
        })
    }
    
    @IBOutlet weak var list: UITableView!
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (self.viewModel.tableData?.typeMatches.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: self.cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cellID)
        }
        
        var content = cell?.defaultContentConfiguration()
        content?.text = self.viewModel.tableData?.typeMatches[indexPath.row].matchType
        
        cell?.contentConfiguration = content
        
        return cell!
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueID, sender: self.viewModel.tableData?.typeMatches[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let destination : SeriesViewController = segue.destination as! SeriesViewController
            destination.viewModel.tableData = (sender as! TypeMatch).seriesMatches
        }
    }
}
