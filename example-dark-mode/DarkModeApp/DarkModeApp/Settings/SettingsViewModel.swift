//
//  SettingsViewModel.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import UIKit

struct SettingsViewModel {
    let model = [
        (text: "Dark Mode in SwiftUI", accesory: 1),
        (text: "Dark Mode with XIB", accesory: 1),
        (text: "Dark Mode with View Model", accesory: 1),
    ]
    var sections = 1
    var rows: Int {
        model.count
    }

    func cell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = model[indexPath.row].text
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.applyStyles()
        return cell
    }

    func viewController(at indexPath: IndexPath) -> UIViewController {
        let vc = DMWithXIBTableViewController()
        vc.title = model[indexPath.row].text
        return vc
    }
}
