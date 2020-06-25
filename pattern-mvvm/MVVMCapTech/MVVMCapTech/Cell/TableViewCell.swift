//
//  TableViewCell.swift
//  MVVMCapTechSwift
//
//  Created by Adrian Florescu on 20/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var type: CellType!
    var someValue = 1
    weak var vc: CTViewController?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("init?(style:, reuseIdentifier:)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.someValue += 1
            print("dequeued someValue: \(self.someValue)")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init?(coder:)")
    }

    func setup(with model: CellModel) {
        textLabel?.text = model.title
        backgroundColor = model.color
        type = model.type
        accessoryType = model.type == .disclosure ? .disclosureIndicator : .none
    }

    func didTap() {
        print("didTap")
    }
}
