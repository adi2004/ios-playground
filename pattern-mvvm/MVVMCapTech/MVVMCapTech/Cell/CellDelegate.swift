//
//  CellDelegate.swift
//  MVVMCapTechSwift
//
//  Created by Adrian Florescu on 20/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func setup(with model: CellModel) -> UITableViewCell
    func didTap()
}
