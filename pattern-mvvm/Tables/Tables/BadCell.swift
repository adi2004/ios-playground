//
//  BadCell.swift
//  Tables
//
//  Created by Adrian Florescu on 22/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

class BadCell: UITableViewCell {

    var vc: TblsViewController?

    override func awakeFromNib() {
        super.awakeFromNib()

        NotificationCenter.default.addObserver(self, selector: #selector(hang), name: NSNotification.Name("sth"), object: nil)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func hang() {
        print("hang")
    }

}
