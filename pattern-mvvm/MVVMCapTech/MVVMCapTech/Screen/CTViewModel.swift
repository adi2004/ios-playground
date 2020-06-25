//
//  ViewModel.swift
//  MVVMCapTech
//
//  Created by Adrian Florescu on 14/01/2019.
//  Copyright © 2019 infloresc.ro. All rights reserved.
//

import UIKit

class CTViewModel {
    var model: CTModel
    var vc: CTViewController?

    init(with model: CTModel) {
        self.model = model
    }

    func setup(_ vc: CTViewController) {
        vc.title = model.title
        vc.view.backgroundColor = model.background
        vc.tableView.tableFooterView = UIView()
        vc.tableView.isHidden = model.cells.count == 0
        vc.imageView.isHidden = model.cells.count != 0
    }

    func dequeue(_ tableView: UITableView, cellAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = model.cells[indexPath.row]
        let base = tableView.dequeueReusableCell(withIdentifier: cellModel.type.rawValue, for: indexPath)
        var cell: TableViewCell?
        switch cellModel.type {
        case .alert:
            cell = base as? InfoCell
        case .expandable:
            cell = base as? ExpandingCell
        case .disclosure:
            break
        }
        cell?.setup(with: cellModel)
        cell?.vc = vc
        return cell ?? UITableViewCell()
    }

    func didSelect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, on viewController: UIViewController) {
        (tableView.cellForRow(at: indexPath) as? TableViewCell)?.didTap()
    }

    func expand(_ tableView: UITableView, forCellIndex index: Int) {
        var model = self.model.cells[index]
        var isExpanding = false
        if model.rowHeight == nil {
            model.rowHeight = 100
            model.color = .orange
            model.title = "All grown up..."
            isExpanding = true
        } else {
            model.rowHeight = nil
            model.color = .yellow
            model.title = "Small again"
        }
        let cellView = tableView.cellForRow(at: IndexPath(row: index, section: 0))
        cellView?.textLabel?.text = model.title
        cellView?.backgroundColor = model.color
        self.model.cells[index] = model

        if isExpanding {
            for row in 0 ..< tableView.numberOfRows(inSection: 0) where row != index {
                var model = self.model.cells[row]
                model.rowHeight = nil
                self.model.cells[row] = model
            }
        }
        tableView.beginUpdates()
        tableView.setNeedsLayout()
        tableView.endUpdates()
    }

    func disclosure() {
        let sb = UIStoryboard(name: "Main", bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "CTViewController")
        let customVc = vc as? CTViewController
    }
}
