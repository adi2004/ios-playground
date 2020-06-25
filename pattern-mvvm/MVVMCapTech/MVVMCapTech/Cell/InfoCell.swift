//
//  InfoCell.swift
//  MVVMCapTechSwift
//
//  Created by Adrian Florescu on 20/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

protocol CellAction: class {
    func present(_ uiViewController: UIViewController)
}

class InfoCell: TableViewCell {
    weak var delegate: CellAction?
    override func didTap() {
        let alert = UIAlertController(title: "", message: "Row selected at section 0, row \(index)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
    }
}
