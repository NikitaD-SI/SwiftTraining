//
//  ViewController.swift
//  ComplexTables
//
//  Created by Instructor on 17/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Variables
    var viewModel           : ViewControllerVM  = ViewControllerVM()
    let cellID              : String            = "CELL"
    let rowHeight           : CGFloat           = 100.0
    let segueID             : String            = "moreDetails"
    
    //MARK: - IBOutlets
    @IBOutlet weak var list : UITableView!
    
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let strSection : String = self.viewModel.sections[section]
        return self.viewModel.rowCount(For: strSection)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : CustomTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: self.cellID) as? CustomTableViewCell
        
        if cell == nil {
            cell = CustomTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cellID)
        }
        
        let rowData : DictionaryModel = self.viewModel.dataForRow(For: self.viewModel.sections[indexPath.section],
                                                                  at: indexPath.row)
        
        cell?.lhsIcon.image         = UIImage(systemName: rowData.icon)
        cell?.headline.text         = rowData.heading
        cell?.information.text      = rowData.info
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        self.viewModel.sections[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        self.viewModel.sections
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueID, sender: self.viewModel.dataForRow(For: self.viewModel.sections[indexPath.section],
                                                                                          at: indexPath.row))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let destination : DetailsViewController = (segue.destination as? DetailsViewController)!
            destination.viewModel.title = (sender as! DictionaryModel).heading
            destination.viewModel.icon  = (sender as! DictionaryModel).icon
            destination.viewModel.description = (sender as! DictionaryModel).info
        }
        
    }
}
