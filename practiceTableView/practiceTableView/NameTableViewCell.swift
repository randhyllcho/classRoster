//
//  NameTableViewCell.swift
//  practiceTableView
//
//  Created by RYAN CHRISTENSEN on 12/7/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
