//
//  DMWithXIBTableViewController.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import UIKit

class DMWithXIBTableViewController: UITableViewController {
    private let model: [(name: String, style: UIUserInterfaceStyle)] = [
        (name: "Unspecified", style: .unspecified),
        (name: "Dark", style: .dark),
        (name: "Light", style: .light)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.accessoryType = UIApplication.shared.windows.first?.overrideUserInterfaceStyle == model[indexPath.row].style ? .checkmark : .none
        cell.textLabel?.text = model[indexPath.row].name
        cell.applyStyles()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (0 ..< model.count)
            .map { i in IndexPath(row: i, section: 0) }
            .map { indexPath in tableView.cellForRow(at: indexPath)}
            .forEach { cell in cell?.accessoryType = .none }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        UIApplication.shared.windows.forEach { window in
            UIView.transition(
                with: window,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: {
                    window.overrideUserInterfaceStyle = self.model[indexPath.row].style
                },
                completion: nil
            )
        }
    }
}
