//
//  CellModel.swift
//  MVVMCapTech
//
//  Created by Adrian Florescu on 14/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

enum CellType: String {
    case alert = "InfoCell"
    case expandable = "ExpandingCell"
    case disclosure = "DisclosureCell"
}

struct CellModel {
    var title: String
    var color: UIColor
    var rowHeight: CGFloat?
    let type: CellType

    init(title: String, color: UIColor = .white, rowHeight: CGFloat? = nil, type: CellType = .alert) {
        self.title = title
        self.color = color
        self.rowHeight = rowHeight
        self.type = type
    }
}
