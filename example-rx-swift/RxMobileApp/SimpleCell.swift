//
//  SimpleCell.swift
//  RxMobileApp
//
//  Created by adrian.florescu on 20/01/2020.
//  Copyright © 2020 adrian.florescu. All rights reserved.
//

import UIKit

class SimpleCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
