//
//  CustomTableViewCell.swift
//  ComplexTables
//
//  Created by Instructor on 17/08/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var lhsIcon      : UIImageView!
    @IBOutlet weak var headline     : UILabel!
    @IBOutlet weak var information  : UILabel!
    
}
