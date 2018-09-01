//
//  TableTableViewCell.swift
//  Multi-Sections Table
//
//  Created by Ahmed Almansor on 8/31/18.
//  Copyright © 2018 A.A. All rights reserved.
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
