//
//  ResponsesTableViewController.swift
//  PropertyListDemo
//
//  Created by Instructor on 17/08/23.
//

import UIKit

class ResponsesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //MARK: - Variables
    var viewModel   : ResponsesTableViewControllerVM    = ResponsesTableViewControllerVM()
    let segueID     : String                            = "moreDetails"
    let cellID      : String                            = "CELL"
    
    //MARK: - Datasource methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath)

        var content = cell.defaultContentConfiguration()
        
        let rowData : Info = self.viewModel.tableData[indexPath.row]
        content.text            = rowData.text
        content.secondaryText   = rowData.eventDate.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    //MARK: - Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueID, sender: self.viewModel.tableData[indexPath.row])
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let destination : DetailsViewController = segue.destination as! DetailsViewController
            destination.viewModel.text      = (sender as! Info).text
            destination.viewModel.decimal   = "\((sender as! Info).decimal)"
            destination.viewModel.event     = (sender as! Info).eventDate.description
        }
    }
}
