//
//  SettingsViewModel.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import UIKit
import SwiftUI

struct SettingsViewModel {
    let model: [(text: String, handler: () -> UIViewController?)] = [
        (text: "Dark Mode in SwiftUI", handler: {
            let view = DMWithSwiftUIView()
            let hostVC = UIHostingController(rootView: view)
            return hostVC
        }),
        (text: "Dark Mode with XIB", handler: {
            let vc = DMWithXIBTableViewController()
            vc.title = "Dark Mode with XIB"
            return vc
        }),
        (text: "Dark Mode with View Model", handler: { nil }),
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

    func viewController(at indexPath: IndexPath) -> UIViewController? {
        return  model[indexPath.row].handler()
    }
}
