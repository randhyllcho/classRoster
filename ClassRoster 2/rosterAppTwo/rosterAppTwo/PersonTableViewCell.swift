//
//  PersonTableViewCell.swift
//  rosterAppTwo
//
//  Created by RYAN CHRISTENSEN on 11/18/14.
//  Copyright (c) 2014 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
