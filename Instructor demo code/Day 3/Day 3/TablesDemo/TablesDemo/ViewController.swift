//
//  ViewController.swift
//  TablesDemo
//
//  Created by Instructor on 16/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.prepareTable()
    }

    //MARK: - Variables and constants
    let cellID              : String    = "CELL"
    let sectionCount        : Int       = 3
    
    @IBOutlet weak var list: UITableView!
    
    func prepareTable() {
        self.list.delegate      = self
        self.list.dataSource    = self
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 30.0
            case 1:
                return 75.0
            case 2:
                return 10.0
            default:
                return 25.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var lbl : UILabel   = UILabel()
        lbl.text            = "H: \(section)"
        lbl.textColor       = UIColor.brown
        lbl.backgroundColor = UIColor.orange
        lbl.font            = UIFont.boldSystemFont(ofSize: 25.0)
        
        return lbl
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 10
            case 1:
                return 30
            case 2:
                return 5
            default:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. Check to see if there is a reusable cell
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: self.cellID)
        
        //2. If a reusable cell is not available create one
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                   reuseIdentifier: self.cellID)
        }
        
        //3. Configure the cell
        var content                 = cell?.defaultContentConfiguration()
        content?.text               = "Section: \(indexPath.section)"
        content?.secondaryText      = "Row: \(indexPath.row)"
        
        cell?.contentConfiguration  = content
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sectionCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "H: \(section)"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "\(section)"
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var titles : [String] = []
        for i in 0..<self.sectionCount {
            titles.append("\(i)")
        }
        return titles
    }
}
